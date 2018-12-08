`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:17:43 12/07/2018
// Design Name:   sevenSegmentDisplayController
// Module Name:   /home/ise/Labs/CSM152A-Project4/Lab4/sevenSegmentDisplayController_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sevenSegmentDisplayController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sevenSegmentDisplayController_tb;

	// Inputs
	reg [1:0] playerHealth;
	reg clk_display;

	// Outputs
	wire [7:0] seg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	sevenSegmentDisplayController uut (
		.playerHealth(playerHealth), 
		.clk_display(clk_display), 
		.seg(seg), 
		.an(an)
	);
	
	always #0.5 clk_display = ~clk_display;

	initial begin
		// Initialize Inputs
		playerHealth = 0;
		clk_display = 0;

		#4
		playerHealth=2'b01;
		
		#4
		playerHealth=2'b10;
		
		#4
		playerHealth=2'b11;

	end
      
endmodule

