`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:10:08 11/29/2018
// Design Name:   gameStateHandler
// Module Name:   /home/ise/Labs/CSM152A-Project4/Lab4/gameStateHandler_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gameStateHandler
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module gameStateHandler_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [9:0] bossHP;
	reg [1:0] playerHP;

	// Outputs
	wire [1:0] gameState;

	// Instantiate the Unit Under Test (UUT)
	gameStateHandler uut (
		.clk(clk), 
		.rst(rst), 
		.bossHP(bossHP), 
		.playerHP(playerHP), 
		.gameState(gameState)
	);
	
	always #0.5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		bossHP = 0;
		playerHP = 0;

		#1
		bossHP = 5;
		playerHP = 3;
		
		#3
		bossHP = 0;
		playerHP = 3;
		
		#3
		bossHP = 1;
		playerHP = 0;
		
		#3
		bossHP = 0;
		playerHP = 0;
		
		#3
		rst = 1;
		
		#3
		rst = 0;
		bossHP = 3;
		playerHP = 3;
		
	end
      
endmodule

