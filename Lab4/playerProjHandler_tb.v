`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:37:32 11/28/2018
// Design Name:   playerProjHandler
// Module Name:   /home/ise/Labs/CSM152A-Project4/Lab4/playerProjHandler_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: playerProjHandler
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module playerProjHandler_tb;

	// Inputs
	reg clk;
	reg rst;
	wire pulse_projSpeed;
	reg shoot;
	reg projHit;
	reg [1:0] collidedProj;
	reg [9:0] playerX;
	reg [8:0] playerY;
	reg [9:0] playerW;

	// Outputs
	wire [9:0] o_proj1X;
	wire [8:0] o_proj1Y;
	wire [9:0] o_proj2X;
	wire [8:0] o_proj2Y;
	wire [9:0] o_proj3X;
	wire [8:0] o_proj3Y;
	
	always #0.5 clk = ~clk;
	clockPulser pulseGen(clk, rst, 2, pulse_projSpeed);

	// Instantiate the Unit Under Test (UUT)
	playerProjHandler uut (
		.clk(clk), 
		.rst(rst), 
		.pulse_projSpeed(pulse_projSpeed), 
		.shoot(shoot), 
		.projHit(projHit), 
		.collidedProj(collidedProj), 
		.playerX(playerX), 
		.playerY(playerY), 
		.playerW(playerW), 
		.o_proj1X(o_proj1X), 
		.o_proj1Y(o_proj1Y), 
		.o_proj2X(o_proj2X), 
		.o_proj2Y(o_proj2Y), 
		.o_proj3X(o_proj3X), 
		.o_proj3Y(o_proj3Y)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		shoot = 0;
		projHit = 0;
		collidedProj = 0;
		playerX = 449;
		playerY = 450;
		playerW = 30;
		
		#5;
      shoot = 1;
		
		#1
		shoot = 0;
		
		#5	
		shoot = 1;
		
		#1
		shoot = 0;
		
		#1
		projHit = 1;
		collidedProj = 2;
		
		#5
		projHit = 0;
		collidedProj = 0;
		
		#5
		shoot = 1;
		
		#1
		shoot = 0;
		
		#10
		rst = 1;
		
		#5
		rst = 0;

	end
      
endmodule

