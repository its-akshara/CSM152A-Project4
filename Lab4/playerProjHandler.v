`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:07 11/25/2018 
// Design Name: 
// Module Name:    playerProjHandler 
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
module playerProjHandler(clk, rst, pulse_projSpeed, shoot, projHit, collidedProj,
	playerX, playerY, playerW,
	proj1X, proj1Y, proj2X, proj2Y, proj3X, proj3Y
    );
	input clk, rst, pulse_projSpeed, shoot, projHit;
	input [1:0] collidedProj;
	input [9:0] playerX, playerW;
	input [8:0] playerY;
	output reg [9:0] proj1X, proj2X, proj3X;
	output reg [8:0] proj1Y, proj2Y, proj3Y;


endmodule
