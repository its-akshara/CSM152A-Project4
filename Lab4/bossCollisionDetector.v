`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:36:30 11/24/2018 
// Design Name: 
// Module Name:    bossCollisionDetector 
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
module bossCollisionDetector(clk, bossX, bossY, bossW, bossH,
	playerProj1X, playerProj1Y, playerProj2X, playerProj2Y, playerProj3X, playerProj3Y,
	projW, 
	bossHit, projHit, collidedProj
    );
	input clk;
	input [9:0] bossX, bossW, playerProj1X, playerProj2X, playerProj3X, projW;
	input [8:0] bossY, bossH, playerProj1Y, playerProj2Y, playerProj3Y;
	output reg bossHit = 0, projHit = 0;
	output reg [1:0] collidedProj = 0;
	
	parameter BORDER = 31;
	
	always @ (posedge clk) begin
		if ((playerProj1Y < (bossY + bossH)) &&
			(((bossX >= playerProj1X) && (bossX < (playerProj1X + projW))) ||
			((playerProj1X >= bossX) && (playerProj1X < (bossX + bossW))))) begin
			
			bossHit <= 1;
			projHit <= 1;
			collidedProj <= 1;
		end
		else if ((playerProj2Y < (bossY + bossH)) &&
				(((bossX >= playerProj2X) && (bossX < (playerProj2X + projW))) ||
				((playerProj2X >= bossX) && (playerProj2X < (bossX + bossW))))) begin
			bossHit <= 1;
			projHit <= 1;
			collidedProj <= 2;
		end
		else if ((playerProj3Y < (bossY + bossH)) &&
				(((bossX >= playerProj3X) && (bossX < (playerProj3X + projW))) ||
				((playerProj3X >= bossX) && (playerProj3X < (bossX + bossW))))) begin
			bossHit <= 1;
			projHit <= 1;
			collidedProj <= 3;
		end
		else if (playerProj1Y < BORDER) begin
			projHit <= 1;
			collidedProj <= 1;
		end
		else if (playerProj2Y < BORDER) begin
			projHit <= 1;
			collidedProj <= 2;
		end
		else if (playerProj3Y < BORDER) begin
			projHit <= 1;
			collidedProj <= 3;
		end
		else begin
			bossHit <= 0;
			projHit <= 0;
			collidedProj <= 0;
		end
	end

endmodule
