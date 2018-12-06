`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:04:00 11/24/2018 
// Design Name: 
// Module Name:    bossBattleTop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bossBattleTop(clk, btnRst, btnLeft, btnRight, btnShoot,
	seg, an, vgaRed, vgaGreen, vgaBlue, Hsync, Vsync
    );
	input clk, btnRst, btnLeft, btnRight, btnShoot;
	output [7:0] seg;
	output [3:0] an;
	output [2:0] vgaRed, vgaGreen;
	output [1:0] vgaBlue;
	output Hsync, Vsync;
    
	wire rst;
	reg [1:0] arst_ff;
	wire arst_i;
	
	assign arst_i = btnRst;
	assign rst = arst_ff[0];
    always @ (posedge clk or posedge arst_i)
      if (arst_i)
        arst_ff <= 2'b11;
      else
        arst_ff <= {1'b0, arst_ff[1]};
	
	parameter CYCLES_PER_BOSS_ATTACK = 300000000;
	parameter IMMUNE_CYCLES = 150000000;
	
	wire clk_vga;
	clockDivider gen_clkVga(clk, rst, 26'b0000000000000000000000010, clk_vga);
	
	wire pulse_bossProjSpeed;
	clockPulser gen_pulseBossProjSpeed(clk, rst, 1000000, pulse_bossProjSpeed);

	wire pulse_playerProjSpeed;
	clockPulser gen_pulsePlayerProjSpeed(clk, rst, 500000, pulse_playerProjSpeed);
	
	wire pulse_cycleStep;
	clockPulser gen_pulseCycleStep(clk, rst, CYCLES_PER_BOSS_ATTACK, pulse_cycleStep);
	
	wire clk_immune;
	clockDivider gen_clkImmune(clk,rst,50000000,clk_immune);
	
	wire mvLeft;
	wire mvRight;
	wire shoot;
	debouncer db_btnL(clk, rst, btnLeft, mvLeft);
	debouncer db_btnR(clk, rst, btnRight, mvRight);
	debouncer db_btnS(clk, rst, btnShoot, shoot);
	
	wire [9:0] bossX, bossW, bossProj1X, bossProj2X, bossProj3X, bossProj4X, bossProj5X, bossProjW;
	wire [8:0] bossY, bossH, bossProj1Y, bossProj2Y, bossProj3Y, bossProj4Y, bossProj5Y, bossProjH;
	wire bossHit, bossShoot;
    wire [1:0] atkType;
	wire [9:0] bossHP;
	wire indicate1, indicate2;
	bossController bossCtrl(clk, pulse_cycleStep, rst, bossHit, (CYCLES_PER_BOSS_ATTACK / 2),
		bossX, bossY, bossW, bossH,
		bossProj1X, bossProj1Y, bossProj2X, bossProj2Y, bossProj3X, bossProj3Y, bossProj4X, bossProj4Y,
		bossProj5X, bossProj5Y, bossProjW, bossProjH, bossHP, bossShoot, atkType, indicate1, indicate2);
    
    wire bossProjHit;
    wire [2:0] bossCollidedProj;
    wire [9:0] bossProj1X_out, bossProj2X_out, bossProj3X_out, bossProj4X_out, bossProj5X_out;
    wire [8:0] bossProj1Y_out, bossProj2Y_out, bossProj3Y_out, bossProj4Y_out, bossProj5Y_out;
    bossProjHandler bossProj(clk, rst, pulse_bossProjSpeed, bossShoot, bossProjHit, bossCollidedProj, atkType,
        (CYCLES_PER_BOSS_ATTACK / 4), bossProj1X, bossProj1Y, bossProj2X, bossProj2Y, bossProj3X, bossProj3Y,
        bossProj4X, bossProj4Y,	bossProj5X, bossProj5Y, bossProj1X_out, bossProj1Y_out, bossProj2X_out,
        bossProj2Y_out, bossProj3X_out, bossProj3Y_out, bossProj4X_out, bossProj4Y_out, bossProj5X_out,
        bossProj5Y_out);
    
	wire [9:0] playerX, playerW, playerProjW;
	wire [8:0] playerY, playerH, playerProjH;
	wire playerHit;
	wire playerImmune;
	wire [1:0] playerHP;
	playerController playerCtrl(clk, pulse_cycleStep, rst, mvLeft, mvRight, playerHit, IMMUNE_CYCLES,
								playerX, playerY, playerW, playerH, playerProjW, playerProjH,
								playerHP, playerImmune);
															
	wire playerProjHit;
    wire [1:0] playerCollidedProj;
    wire [9:0] playerProj1X_out, playerProj2X_out, playerProj3X_out;
    wire [8:0] playerProj1Y_out, playerProj2Y_out, playerProj3Y_out;
	playerProjHandler playerProj(clk,rst, pulse_playerProjSpeed, shoot, playerProjHit, playerCollidedProj,
								playerX, playerY, playerW,
								playerProj1X_out, playerProj1Y_out, playerProj2X_out, playerProj2Y_out, playerProj3X_out, playerProj3Y_out
								);
	
	playerCollisionDetector playerCollisions(clk, playerX, playerY, playerW, playerH,
								bossProj1X_out, bossProj1Y_out, bossProj2X_out, bossProj2Y_out, 
								bossProj3X_out, bossProj3Y_out, bossProj4X_out, bossProj4Y_out, bossProj5X_out, bossProj5Y_out,
								bossProjW, bossProjH, playerHit, bossProjHit, bossCollidedProj);
										
	bossCollisionDetector bossCollisions(clk, rst, bossX, bossY, bossW, bossH,
	playerProj1X_out, playerProj1Y_out, playerProj2X_out, playerProj2Y_out, playerProj3X_out, playerProj3Y_out,
	playerProjW, bossHit, playerProjHit, playerCollidedProj);
	
	wire clk_display;
	clockDivider clkDisplay(clk, 1'b0, 26'b00000000111101000010010000, clk_display);
	sevenSegmentDisplayController playerHealthDisplay(playerHP,clk_display,seg,an);
	 
	wire [1:0] gameState;
	gameStateHandler state(clk, rst, bossHP, playerHP, gameState);
	 
    vga640x480 vgaController(clk_vga, clk_immune, rst, bossX, bossY, bossW, bossH,playerImmune, indicate1, indicate2, bossProj1X_out,
        bossProj1Y_out, bossProj2X_out, bossProj2Y_out, bossProj3X_out, bossProj3Y_out, bossProj4X_out,
        bossProj4Y_out,	bossProj5X_out, bossProj5Y_out, bossProjW, bossProjH, bossHP,
        playerX, playerY, playerW, playerH, playerProj1X_out, playerProj1Y_out, playerProj2X_out, playerProj2Y_out, playerProj3X_out, playerProj3Y_out,
		  playerProjW, playerProjH, gameState,
        Hsync, Vsync, vgaRed, vgaGreen, vgaBlue);

endmodule
