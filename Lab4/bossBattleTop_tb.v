`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:02:19 11/30/2018
// Design Name:   bossBattleTop
// Module Name:   C:/Users/152/Documents/CSM152A-Project4/Lab4/bossBattleTop_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bossBattleTop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bossBattleTop_tb;

	// Inputs
	reg clk;
	reg btnRst;
	reg btnLeft;
	reg btnRight;
	reg btnShoot;

	// Outputs
	wire [7:0] seg;
	wire [3:0] an;
	wire [2:0] vgaRed;
	wire [2:0] vgaGreen;
	wire [1:0] vgaBlue;
	wire Hsync;
	wire Vsync;

	// Instantiate the Unit Under Test (UUT)
	bossBattleTop uut (
		.clk(clk), 
		.btnRst(btnRst), 
		.btnLeft(btnLeft), 
		.btnRight(btnRight), 
		.btnShoot(btnShoot), 
		.seg(seg), 
		.an(an), 
		.vgaRed(vgaRed), 
		.vgaGreen(vgaGreen), 
		.vgaBlue(vgaBlue), 
		.Hsync(Hsync), 
		.Vsync(Vsync)
	);

	always #0.5 clk = ~clk;
	
	initial begin
		// Initialize Inputs
		clk = 0;
		btnRst = 0;
		btnLeft = 0;
		btnRight = 0;
		btnShoot = 0;
		
		#5 btnShoot = 1;
		#1 btnShoot = 0;
		
		#2 btnShoot = 1;
		#1 btnShoot = 0;

		#2 btnShoot = 1;
		#1 btnShoot = 0;

	end
      
endmodule

