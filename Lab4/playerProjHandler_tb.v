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
	reg pulse_projSpeed;
	reg shoot;
	reg projHit;
	reg [1:0] collidedProj;
	reg [9:0] playerX;
	reg [8:0] playerY;
	reg [9:0] playerW;
	reg [9:0] i_proj1X;
	reg [8:0] i_proj1Y;
	reg [9:0] i_proj2X;
	reg [8:0] i_proj2Y;
	reg [9:0] i_proj3X;
	reg [8:0] i_proj3Y;

	// Outputs
	wire [9:0] o_proj1X;
	wire [8:0] o_proj1Y;
	wire [9:0] o_proj2X;
	wire [8:0] o_proj2Y;
	wire [9:0] o_proj3X;
	wire [8:0] o_proj3Y;

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
		.i_proj1X(i_proj1X), 
		.i_proj1Y(i_proj1Y), 
		.i_proj2X(i_proj2X), 
		.i_proj2Y(i_proj2Y), 
		.i_proj3X(i_proj3X), 
		.i_proj3Y(i_proj3Y), 
		.o_proj1X(o_proj1X), 
		.o_proj1Y(o_proj1Y), 
		.o_proj2X(o_proj2X), 
		.o_proj2Y(o_proj2Y), 
		.o_proj3X(o_proj3X), 
		.o_proj3Y(o_proj3Y)
	);
	
	always #0.5 clk = ~clk;
	//always #1 pulse_projSpeed = ~pulse_projSpeed;
	clockPulser pulseGen(clk, rst, 2, pulse_projSpeed);
	
	always #0.5 i_proj1X=o_proj1X;
	always #0.5 i_proj1Y=o_proj1Y;
	always #0.5 i_proj2X=o_proj2X;
	always #0.5 i_proj2Y=o_proj2Y;
	always #0.5 i_proj3X = o_proj3X;
	always #0.5 i_proj3Y=o_proj3Y;
	

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		pulse_projSpeed = 0;
		shoot = 0;
		projHit = 0;
		collidedProj = 0;
		playerX = 449;
		playerY = 450;
		playerW = 30;
		i_proj1X = 0;
		i_proj1Y = 0;
		i_proj2X = 0;
		i_proj2Y = 0;
		i_proj3X = 0;
		i_proj3Y = 0;
		
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
		
		#1
		projHit = 0;
		collidedProj = 0;
		
		#5
		shoot = 1;
		
		#1
		shoot = 0;
		
		#10
		rst = 1;
		
		#1
		rst = 0;

	end
      
endmodule

