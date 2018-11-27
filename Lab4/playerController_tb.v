`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:03:29 11/26/2018
// Design Name:   playerController
// Module Name:   /home/ise/Labs/CSM152A-Project4/Lab4/playerController_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: playerController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module playerController_tb;

	// Inputs
	reg clk_master;
	reg pulse_stepCycle;
	reg rst;
	reg mvLeft;
	reg mvRight;
	reg playerHit;
	reg [1:0] currPlayerHP;

	// Outputs
	wire [9:0] playerX;
	wire [9:0] playerW;
	wire [8:0] playerH;
	wire [9:0] proj1X;
	wire [8:0] proj1Y;
	wire [9:0] proj2X;
	wire [8:0] proj2Y;
	wire [9:0] proj3X;
	wire [8:0] proj3Y;
	wire [9:0] projW;
	wire [8:0] projH;
	wire [2:0] playerHP;

	// Instantiate the Unit Under Test (UUT)
	playerController uut (
		.clk_master(clk_master), 
		.pulse_stepCycle(pulse_stepCycle), 
		.rst(rst), 
		.mvLeft(mvLeft), 
		.mvRight(mvRight), 
		.playerHit(playerHit), 
		.currPlayerHP(currPlayerHP), 
		.playerX(playerX),  
		.playerW(playerW), 
		.playerH(playerH), 
		.proj1X(proj1X), 
		.proj1Y(proj1Y), 
		.proj2X(proj2X), 
		.proj2Y(proj2Y), 
		.proj3X(proj3X), 
		.proj3Y(proj3Y), 
		.projW(projW), 
		.projH(projH), 
		.playerHP(playerHP)
	);
	
	always #0.5 clk_master = ~clk_master;
	
	clockPulser pulseGen(clk_master, rst, 4, pulse_stepCycle);

	initial begin
		// Initialize Inputs
		clk_master = 0;
		pulse_stepCycle = 0;
		rst = 0;
		mvLeft = 0;
		mvRight = 0;
		playerHit = 0;
		currPlayerHP = 2'b11;
		
		#5
		playerHit = 1;
		
		#1
		playerHit = 0;
		
		#5;
		rst = 1;
		
		#5
		rst = 0;
        

	end
      
endmodule

