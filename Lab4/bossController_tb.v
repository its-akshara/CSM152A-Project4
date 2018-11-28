`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:37:34 11/24/2018
// Design Name:   bossController
// Module Name:   /home/ise/VM_Share_Dir/CSM152A-Project4/Lab4/bossController_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bossController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bossController_tb;

	// Inputs
	reg clk_master;
	wire pulse_cycleStep;
	reg rst;
	reg bossHit;
	reg [31:0] delay;

	// Outputs
	wire [9:0] bossLocX;
	wire [8:0] bossLocY;
	wire [9:0] bossWidth;
	wire [8:0] bossHeight;
	wire [9:0] proj1X;
	wire [8:0] proj1Y;
	wire [9:0] proj2X;
	wire [8:0] proj2Y;
	wire [9:0] proj3X;
	wire [8:0] proj3Y;
	wire [9:0] proj4X;
	wire [8:0] proj4Y;
	wire [9:0] proj5X;
	wire [8:0] proj5Y;
	wire [9:0] projW;
	wire [8:0] projH;
	wire [9:0] bossHP;
	wire bossShoot;
	wire [1:0] attackType;
	wire indicate1;
	wire indicate2;
	
	always #0.5 clk_master = ~clk_master;
	
	clockPulser pulseGen(clk_master, rst, 4, pulse_cycleStep);

	// Instantiate the Unit Under Test (UUT)
	bossController uut (
		.clk_master(clk_master), 
		.pulse_cycleStep(pulse_cycleStep), 
		.rst(rst), 
		.bossHit(bossHit), 
		.delay(delay),
		.bossLocX(bossLocX), 
		.bossLocY(bossLocY), 
		.bossWidth(bossWidth), 
		.bossHeight(bossHeight), 
		.proj1X(proj1X), 
		.proj1Y(proj1Y), 
		.proj2X(proj2X), 
		.proj2Y(proj2Y), 
		.proj3X(proj3X), 
		.proj3Y(proj3Y), 
		.proj4X(proj4X), 
		.proj4Y(proj4Y), 
		.proj5X(proj5X), 
		.proj5Y(proj5Y), 
		.projW(projW), 
		.projH(projH), 
		.bossHP(bossHP), 
		.bossShoot(bossShoot), 
		.attackType(attackType),
		.indicate1(indicate1),
		.indicate2(indicate2)
	);

	initial begin
		// Initialize Inputs
		clk_master = 1;
		rst = 0;
		bossHit = 0;
		delay = 2;

	end
      
endmodule

