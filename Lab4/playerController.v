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
	playerX, playerY, playerW, playerH,
	projW, projH,
	playerHP
    );
	input clk_master, pulse_stepCycle, rst, mvLeft, mvRight, playerHit;
	
	parameter PLAYER_START_X = 449;
	parameter PLAYER_Y = 450;
	parameter PLAYER_W = 30;
	parameter PLAYER_H = 30;
	parameter PROJ_W = 10;
	parameter PROJ_H = 10;
	parameter STEP = 1;
	parameter LEFT_BOUNDARY = 144;
	parameter RIGHT_BOUNDARY = 784;
	parameter MAX_HEALTH = 2'b11;
	parameter MIN_HEALTH = 0;
	parameter HEALTH_LOSS = 1;
	
	output reg [9:0] playerX = PLAYER_START_X;
	output wire [8:0] playerY;
	output wire [9:0] playerW, projW;
	output wire [8:0] playerH, projH;
	output reg [2:0] playerHP = MAX_HEALTH;
	
	assign playerW = PLAYER_W;
	assign playerH = PLAYER_H;
	assign playerY = PLAYER_Y;
	assign projW = PROJ_W;
	assign projH = PROJ_H;
	
	always @(posedge clk_master)
	begin
		if (rst)
		begin
			playerX <= PLAYER_START_X;
			playerHP <= MAX_HEALTH; //set back to three lives
		end
		else if(playerHit)
		begin
			if(playerHP > MIN_HEALTH)
			begin
				playerHP <= playerHP-HEALTH_LOSS;
			end
			else
			begin
				playerHP <= MIN_HEALTH; //handle game over here
			end
		end
		else if(mvLeft || mvRight) //start handling updating position
		begin
			if(mvLeft && playerX > LEFT_BOUNDARY)
			begin
				playerX <= playerX - STEP;
			end
			else if(mvRight && playerX < RIGHT_BOUNDARY)
			begin
				playerX <= playerX + STEP;
			end
		end
		else
		begin
			playerX <= playerX;
		end
	end

endmodule
