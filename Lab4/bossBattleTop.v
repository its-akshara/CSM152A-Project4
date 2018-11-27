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
	
	wire clk_vga;
	clockDivider clkVga(clk, sw, 2, clk_vga);
	
	wire clk_bossProjSpeed;
	clockDivider clkBossProjSpeed(clk, sw, 500000, clk_bossProjSpeed);

endmodule
