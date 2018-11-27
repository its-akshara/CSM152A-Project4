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
module playerController(clk_master, pulse_stepCycle, rst, mvLeft, mvRight, playerHit,
	currPlayerHP,
	playerX, playerW, playerH,
	// proj1X, proj1Y, proj2X, proj2Y, proj3X, proj3Y,
	projW, projH,
	playerHP
    );
	input clk_master, pulse_stepCycle, rst, mvLeft, mvRight, playerHit;
	input [1:0] currPlayerHP;
	input [9:0] currPlayerX;

	output reg [9:0] playerX, proj1X, proj2X, proj3X;
	// output reg [8:0] proj1Y, proj2Y, proj3Y;
	output wire [9:0] playerW, projW;
	output wire [8:0] playerH, projH;
	output reg [2:0] playerHP;
	
	parameter PLAYER_START_X = 1;
	parameter PLAYER_Y = 1;
	parameter PLAYER_W = 1;
	parameter PLAYER_H = 1;
	// parameter PROJ_W = 1;
	// parameter PROJ_H = 1;
	parameter STEP = 1;
	parameter LEFT_BOUNDARY = 0;
	parameter RIGHT_BOUNDARY = 400'
	
	assign playerW = PLAYER_W;
	assign playerH = PLAYER_H;
	assign projW = PROJ_W;
	assign projH = PROJ_H;
	
	always @(posedge clk_master)
	begin
		if (rst)
		begin
			playerX <= PLAYER_START_X;
			// playerY <= PLAYER_START_Y;
			playerHP <= 2'b11; //set back to three lives
		end
		else if(playerHit)
		begin
			if(currPlayerHP > 0)
			begin
				playerHP <= currPlayerHP-1;
			end
			else
			begin
				playerHP <= 0; //handle game over here
			end
		end
		else if(pulse_stepCycle) //start handling updating position
		begin
			if(mvLeft && playerX > LEFT_BOUNDARY)
			begin
				playerX <= currPlayerX - STEP;
			end
			else if(mvRight && playerX < RIGHT_BOUNDARY)
			begin
				playerX <= currPlayerX + STEP;
			end
			else
			begin
				playerX <= currPlayerX;
			end
			
		end
	end

endmodule
