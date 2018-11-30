`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:45:12 11/29/2018
// Design Name:   bossProjHandler
// Module Name:   /home/ise/VM_Share_Dir/CSM152A-Project4/Lab4/bossProjHandler_tb.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bossProjHandler
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bossProjHandler_tb;

	// Inputs
	reg clk;
	reg rst;
	wire pulse_projSpeed;
	reg bossShoot;
	reg projHit;
	reg [2:0] collidedProj;
	reg [1:0] attackType;
	reg [31:0] delay;
	reg [9:0] proj1X_start;
	reg [8:0] proj1Y_start;
	reg [9:0] proj2X_start;
	reg [8:0] proj2Y_start;
	reg [9:0] proj3X_start;
	reg [8:0] proj3Y_start;
	reg [9:0] proj4X_start;
	reg [8:0] proj4Y_start;
	reg [9:0] proj5X_start;
	reg [8:0] proj5Y_start;

	// Outputs
	wire [9:0] proj1X_out;
	wire [8:0] proj1Y_out;
	wire [9:0] proj2X_out;
	wire [8:0] proj2Y_out;
	wire [9:0] proj3X_out;
	wire [8:0] proj3Y_out;
	wire [9:0] proj4X_out;
	wire [8:0] proj4Y_out;
	wire [9:0] proj5X_out;
	wire [8:0] proj5Y_out;
	
	always #0.5 clk = ~clk;
	clockPulser gen_pulseProjSpeed(clk, rst, 1, pulse_projSpeed);

	// Instantiate the Unit Under Test (UUT)
	bossProjHandler uut (
		.clk(clk), 
		.rst(rst), 
		.pulse_projSpeed(pulse_projSpeed), 
		.bossShoot(bossShoot), 
		.projHit(projHit), 
		.collidedProj(collidedProj), 
		.attackType(attackType), 
		.delay(delay), 
		.proj1X_start(proj1X_start), 
		.proj1Y_start(proj1Y_start), 
		.proj2X_start(proj2X_start), 
		.proj2Y_start(proj2Y_start), 
		.proj3X_start(proj3X_start), 
		.proj3Y_start(proj3Y_start), 
		.proj4X_start(proj4X_start), 
		.proj4Y_start(proj4Y_start), 
		.proj5X_start(proj5X_start), 
		.proj5Y_start(proj5Y_start), 
		.proj1X_out(proj1X_out), 
		.proj1Y_out(proj1Y_out), 
		.proj2X_out(proj2X_out), 
		.proj2Y_out(proj2Y_out), 
		.proj3X_out(proj3X_out), 
		.proj3Y_out(proj3Y_out), 
		.proj4X_out(proj4X_out), 
		.proj4Y_out(proj4Y_out), 
		.proj5X_out(proj5X_out), 
		.proj5Y_out(proj5Y_out)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		rst = 0;
		bossShoot = 0;
		projHit = 0;
		collidedProj = 0;
		attackType = 0;
		delay = 2;
		proj1X_start = 0;
		proj1Y_start = 0;
		proj2X_start = 0;
		proj2Y_start = 0;
		proj3X_start = 0;
		proj3Y_start = 0;
		proj4X_start = 0;
		proj4Y_start = 0;
		proj5X_start = 0;
		proj5Y_start = 0;
		
		//Testing straight projectile attack
		#4
		proj1X_start = 1;
		proj1Y_start = 1;
		proj2X_start = 2;
		proj2Y_start = 2;
		attackType = 0;
		bossShoot = 1;
		#1
		bossShoot = 0;
		
		//Testing erasure of projectiles upon hit
		#3
		collidedProj = 1;
		projHit = 1;
		#1
		projHit = 0;
		
		#1
		collidedProj = 2;
		projHit = 1;
		#1
		projHit = 0;
		
		//Testing beam attack
		#1
		proj1X_start = 3;
		proj1Y_start = 3;
		proj2X_start = 15;
		proj2Y_start = 15;
		attackType = 1;
		bossShoot = 1;
		#1
		bossShoot = 0;
		
		//Testing diagonal attack
		#4
		proj1X_start = 1;
		proj1Y_start = 1;
		proj2X_start = 5;
		proj2Y_start = 5;
		attackType = 2;
		bossShoot = 1;
		#1
		bossShoot = 0;
		
		//Testing reset
		#4
		rst = 1;
		#1
		rst = 0;
		
		

	end
      
endmodule

