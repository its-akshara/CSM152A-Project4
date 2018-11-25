`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:58:28 11/25/2018 
// Design Name: 
// Module Name:    playerController 
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
module playerController(clk, rst, mvLeft, mvRight, playerHit,
	playerX, playerY, playerW, playerH,
	proj1X, proj1Y, proj2X, proj2Y, proj3X, proj3Y,
	projW, projH,
	playerHP
    );
	input clk, rst, mvLeft, mvRight, playerHit;
	output reg [9:0] playerX, proj1X, proj2X, proj3X;
	output reg [8:0] playerY, proj1Y, proj2Y, proj3Y;
	output wire [9:0] playerW, projW;
	output wire [8:0] playerH, projH;
	
	parameter PLAYER_START_X = 1;
	parameter PLAYER_START_Y = 1;
	parameter PLAYER_W = 1;
	parameter PLAYER_H = 1;
	parameter PROJ_W = 1;
	parameter PROJ_H = 1;
	
	assign playerW = PLAYER_W;
	assign playerH = PLAYER_H;
	assign projW = PROJ_W;
	assign projH = PROJ_H;

endmodule
