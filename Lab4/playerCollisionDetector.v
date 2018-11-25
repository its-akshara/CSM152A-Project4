`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:27:39 11/25/2018 
// Design Name: 
// Module Name:    playerCollisionDetector 
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
module playerCollisionDetector(clk, rst, playerX, playerY, playerW, playerH,
	proj1X, proj1Y, proj2X, proj2Y, proj3X, proj3Y, proj4X, proj4Y, proj5X, proj5Y,
	projW, projH,
	playerHit, projHit, collidedProj
    );
	input clk, rst;
	input [9:0] playerX, playerW, proj1X, proj2X, proj3X, proj4X, proj5X, projW;
	input [8:0] playerY, playerH, proj1Y, proj2Y, proj3Y, proj4Y, proj5Y, projH;
	output playerHit, projHit;
	output [2:0] collidedProj;


endmodule
