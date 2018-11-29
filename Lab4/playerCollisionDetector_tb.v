`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:24:41 11/29/2018
// Design Name:   playerCollisionDetector
// Module Name:   /home/ise/Labs/CSM152A-Project4/Lab4/playerCollisionDetector_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: playerCollisionDetector
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module playerCollisionDetector_tb;

	// Inputs
	reg clk;
	reg [9:0] playerX;
	reg [8:0] playerY;
	reg [9:0] playerW;
	reg [8:0] playerH;
	reg [9:0] bossProj1X;
	reg [8:0] bossProj1Y;
	reg [9:0] bossProj2X;
	reg [8:0] bossProj2Y;
	reg [9:0] bossProj3X;
	reg [8:0] bossProj3Y;
	reg [9:0] bossProj4X;
	reg [8:0] bossProj4Y;
	reg [9:0] bossProj5X;
	reg [8:0] bossProj5Y;
	reg [9:0] projW;

	// Outputs
	wire playerHit;
	wire projHit;
	wire [2:0] collidedProj;

	// Instantiate the Unit Under Test (UUT)
	playerCollisionDetector uut (
		.clk(clk), 
		.playerX(playerX), 
		.playerY(playerY), 
		.playerW(playerW), 
		.playerH(playerH), 
		.bossProj1X(bossProj1X), 
		.bossProj1Y(bossProj1Y), 
		.bossProj2X(bossProj2X), 
		.bossProj2Y(bossProj2Y), 
		.bossProj3X(bossProj3X), 
		.bossProj3Y(bossProj3Y), 
		.bossProj4X(bossProj4X), 
		.bossProj4Y(bossProj4Y), 
		.bossProj5X(bossProj5X), 
		.bossProj5Y(bossProj5Y), 
		.projW(projW), 
		.playerHit(playerHit), 
		.projHit(projHit), 
		.collidedProj(collidedProj)
	);
	
	always #0.5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		playerX = 200;
		playerY = 200;
		playerW = 100;
		playerH = 100;
		bossProj1X = 0;
		bossProj1Y = 0;
		bossProj2X = 0;
		bossProj2Y = 0;
		bossProj3X = 0;
		bossProj3Y = 0;
		bossProj4X = 0;
		bossProj4Y = 0;
		bossProj5X = 0;
		bossProj5Y = 0;
		projW = 100;

		#3;
		bossProj1X = 190;
		bossProj1Y = 210;
		
		#5
		bossProj5X = 300;
		bossProj5Y = 300;
		
		#5
		bossProj1X =0;
		bossProj1Y = 0;
		bossProj4X = 300;
		bossProj4Y = 200;
		playerX = 330;
		playerY = 200;

	end
      
endmodule

