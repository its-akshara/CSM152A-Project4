`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:07:41 11/24/2018 
// Design Name: 
// Module Name:    bossProjHandler 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bossProjHandler(clk, rst, pulse_projSpeed, bossShoot, projHit, collidedProj, attackType,
	proj1X_start, proj1Y_start, proj2X_start, proj2Y_start, proj3X_start, proj3Y_start,
	proj4X_start, proj4Y_start, proj5X_start, proj5Y_start,
	proj1X_out, proj1Y_out, proj2X_out, proj2Y_out, proj3X_out, proj3Y_out,
	proj4X_out, proj4Y_out, proj5X_out, proj5Y_out
    );
	input clk, rst, pulse_projSpeed, bossShoot, projHit;
	input [1:0] attackType;
	input [2:0] collidedProj;
	input [9:0] proj1X_start, proj2X_start, proj3X_start, proj4X_start, proj5X_start;
	input [8:0] proj1Y_start, proj2Y_start, proj3Y_start, proj4Y_start, proj5Y_start;
	output reg [9:0] proj1X_out, proj2X_out, proj3X_out, proj4X_out, proj5X_out;
	output reg [8:0] proj1Y_out, proj2Y_out, proj3Y_out, proj4Y_out, proj5Y_out;
	
	parameter STEP = 1;
	
	always @ (posedge clk) begin
		if (rst) begin
			proj1X_out <= 0;
			proj1Y_out <= 0;
			proj2X_out <= 0;
			proj2Y_out <= 0;
			proj3X_out <= 0;
			proj3Y_out <= 0;
			proj4X_out <= 0;
			proj4Y_out <= 0;
			proj5X_out <= 0;
			proj5Y_out <= 0;
		end
		else if (bossShoot) begin
			proj1X_out <= proj1X_start;
			proj1Y_out <= proj1Y_start;
			proj2X_out <= proj2X_start;
			proj2Y_out <= proj2Y_start;
			proj3X_out <= proj3X_start;
			proj3Y_out <= proj3Y_start;
			proj4X_out <= proj4X_start;
			proj4Y_out <= proj4Y_start;
			proj5X_out <= proj5X_start;
			proj5Y_out <= proj5Y_start;		
		end
		else if (projHit && attackType == 2'b00) begin
			if (collidedProj == 1) begin
					proj1X_out <= 0;
					proj1Y_out <= 0;
			end
			if (collidedProj == 2) begin
					proj2X_out <= 0;
					proj2Y_out <= 0;
			end
			if (collidedProj == 3) begin
					proj3X_out <= 0;
					proj3Y_out <= 0;
			end
			if (collidedProj == 4) begin
					proj4X_out <= 0;
					proj4Y_out <= 0;
			end
			if (collidedProj == 5) begin
					proj5X_out <= 0;
					proj5Y_out <= 0;
			end
		end
		else if (pulse_projSpeed && attackType == 2'b00) begin
			if (proj1Y_out > 0) proj1Y_out <= proj1Y_out + STEP;
			if (proj2Y_out > 0) proj2Y_out <= proj2Y_out + STEP;
			if (proj3Y_out > 0) proj3Y_out <= proj3Y_out + STEP;
			if (proj4Y_out > 0) proj4Y_out <= proj4Y_out + STEP;
			if (proj5Y_out > 0) proj5Y_out <= proj5Y_out + STEP;
		end
	end


endmodule