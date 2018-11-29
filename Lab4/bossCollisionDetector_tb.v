`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:54:07 11/29/2018
// Design Name:   bossCollisionDetector
// Module Name:   /home/ise/Labs/CSM152A-Project4/Lab4/bossCollisionDetector_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bossCollisionDetector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bossCollisionDetector_tb;

	// Inputs
	reg clk;
	reg [9:0] bossX;
	reg [8:0] bossY;
	reg [9:0] bossW;
	reg [8:0] bossH;
	reg [9:0] playerProj1X;
	reg [8:0] playerProj1Y;
	reg [9:0] playerProj2X;
	reg [8:0] playerProj2Y;
	reg [9:0] playerProj3X;
	reg [8:0] playerProj3Y;
	reg [9:0] projW;

	// Outputs
	wire bossHit;
	wire projHit;
	wire [1:0] collidedProj;

	// Instantiate the Unit Under Test (UUT)
	bossCollisionDetector uut (
		.clk(clk), 
		.bossX(bossX), 
		.bossY(bossY), 
		.bossW(bossW), 
		.bossH(bossH), 
		.playerProj1X(playerProj1X), 
		.playerProj1Y(playerProj1Y), 
		.playerProj2X(playerProj2X), 
		.playerProj2Y(playerProj2Y), 
		.playerProj3X(playerProj3X), 
		.playerProj3Y(playerProj3Y), 
		.projW(projW), 
		.bossHit(bossHit), 
		.projHit(projHit), 
		.collidedProj(collidedProj)
	);
	
	always #0.5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		bossX = 200;
		bossY = 220;
		bossW = 100;
		bossH = 100;
		playerProj1X = 0;
		playerProj1Y = 0;
		playerProj2X = 0;
		playerProj2Y = 0;
		playerProj3X = 0;
		playerProj3Y = 0;
		projW = 100;

		#3;
		playerProj1X = 190;
		playerProj1Y = 210;
		
		#5
		playerProj3X = 300;
		playerProj3Y = 100;
		
		#5
		playerProj1X =0;
		playerProj1Y = 0;
		playerProj2X = 300;
		playerProj2Y = 200;
		bossX = 330;
		bossY = 200;
		
		#10
		playerProj2X = 0;
		playerProj2Y = 0;
		playerProj3X = 10;
		playerProj3Y = 10;

	end
      
endmodule

