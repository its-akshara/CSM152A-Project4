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
module bossBattleTop(clk, sw, btnLeft, btnRight, btnShoot,
	seg, an, vgaRed, vgaGreen, vgaBlue, Hsync, Vsync
    );
	input clk, sw, btnLeft, btnRight, btnShoot;
	output [7:0] seg;
	output [3:0] an;
	output [2:0] vgaRed, vgaGreen;
	output [1:0] vgaBlue;
	output Hsync, Vsync;
    
    assign seg = 0;
    assign an = 0;
	
	parameter CYCLES_PER_BOSS_ATTACK = 300000000;
	
	wire clk_vga;
	clockDivider gen_clkVga(clk, sw, 2, clk_vga);
	
	wire pulse_bossProjSpeed;
	clockPulser gen_pulseBossProjSpeed(clk, sw, 1000000, pulse_bossProjSpeed);
	
	wire pulse_cycleStep;
	clockPulser gen_pulseCycleStep(clk, sw, CYCLES_PER_BOSS_ATTACK, pulse_cycleStep);
	
	wire mvLeft;
	wire mvRight;
	wire shoot;
	debouncer db_btnL(clk, sw, btnLeft, mvLeft);
	debouncer db_btnR(clk, sw, btnRight, mvRight);
	debouncer db_btnS(clk, sw, btnShoot, shoot);
	
	wire [9:0] bossX, bossW, bossProj1X, bossProj2X, bossProj3X, bossProj4X, bossProj5X, bossProjW;
	wire [8:0] bossY, bossH, bossProj1Y, bossProj2Y, bossProj3Y, bossProj4Y, bossProj5Y, bossProjH;
	wire bossHit, bossShoot;
    wire [1:0] atkType;
	wire [9:0] bossHP;
	wire indicate1, indicate2;
	bossController bossCtrl(clk, pulse_cycleStep, sw, bossHit, (CYCLES_PER_BOSS_ATTACK / 2), bossX, bossY, bossW, bossH,
		bossProj1X, bossProj1Y, bossProj2X, bossProj2Y, bossProj3X, bossProj3Y, bossProj4X, bossProj4Y,
		bossProj5X, bossProj5Y, bossProjW, bossProjH, bossHP, bossShoot, atkType, indicate1, indicate2);
    
    wire bossProjHit;
    wire [2:0] bossCollidedProj;
    wire [9:0] bossProj1X_out, bossProj2X_out, bossProj3X_out, bossProj4X_out, bossProj5X_out;
    wire [8:0] bossProj1Y_out, bossProj2Y_out, bossProj3Y_out, bossProj4Y_out, bossProj5Y_out;
    bossProjHandler bossProj(clk, sw, pulse_bossProjSpeed, bossShoot, bossProjHit, bossCollidedProj, atkType,
        (CYCLES_PER_BOSS_ATTACK / 4), bossProj1X, bossProj1Y, bossProj2X, bossProj2Y, bossProj3X, bossProj3Y,
        bossProj4X, bossProj4Y,	bossProj5X, bossProj5Y, bossProj1X_out, bossProj1Y_out, bossProj2X_out,
        bossProj2Y_out, bossProj3X_out, bossProj3Y_out, bossProj4X_out, bossProj4Y_out, bossProj5X_out,
        bossProj5Y_out);
        
    vga640x480 vgaController(clk_vga, sw, bossX, bossY, bossW, bossH, indicate1, indicate2, bossProj1X_out,
        bossProj1Y_out, bossProj2X_out, bossProj2Y_out, bossProj3X_out, bossProj3Y_out, bossProj4X_out,
        bossProj4Y_out,	bossProj5X_out, bossProj5Y_out, bossProjW, bossProjH, bossHP,
        244, 331, 40, 40, 0, 0, 0, 0, 0, 0, 0, 0, 2'b00,
        Hsync, Vsync, vgaRed, vgaGreen, vgaBlue);

endmodule
