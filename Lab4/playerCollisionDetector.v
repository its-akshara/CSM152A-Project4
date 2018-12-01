`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:11:12 11/26/2018 
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
module playerCollisionDetector(clk, playerX, playerY, playerW, playerH,
	bossProj1X, bossProj1Y, bossProj2X, bossProj2Y, bossProj3X, bossProj3Y,bossProj4X, bossProj4Y,bossProj5X, bossProj5Y,
	projW, projH,
	playerHit, projHit, collidedProj
    );
	input clk;
	input [9:0] playerX, playerW, bossProj1X, bossProj2X, bossProj3X, bossProj4X, bossProj5X, projW;
	input [8:0] playerY, playerH, bossProj1Y, bossProj2Y, bossProj3Y, bossProj4Y, bossProj5Y, projH;
	output reg playerHit=0, projHit=0;
	output reg [2:0] collidedProj=0;
	
	always @ (posedge clk) begin
		if ((bossProj1Y + projH > playerY) &&
			(((playerX >= bossProj1X) && (playerX < (bossProj1X + projW))) ||
			((bossProj1X > playerX) && (bossProj1X < (playerX + playerW))))) begin
			
			playerHit <= 1;
			projHit <= 1;
			collidedProj <= 1;
		end
		else if ((bossProj2Y + projH > playerY) &&
			(((playerX >= bossProj2X) && (playerX < (bossProj2X + projW))) ||
			((bossProj2X > playerX) && (bossProj2X < (playerX + playerW))))) begin
			
			playerHit <= 1;
			projHit <= 1;
			collidedProj <= 2;
		end
		else if ((bossProj3Y + projH > playerY) &&
			(((playerX >= bossProj3X) && (playerX < (bossProj3X + projW))) ||
			((bossProj3X > playerX) && (bossProj3X < (playerX + playerW))))) begin
			
			playerHit <= 1;
			projHit <= 1;
			collidedProj <= 3;
		end
		else if ((bossProj4Y + projH > playerY) &&
			(((playerX >= bossProj4X) && (playerX < (bossProj4X + projW))) ||
			((bossProj4X > playerX) && (bossProj4X < (playerX + playerW))))) begin
			
			playerHit <= 1;
			projHit <= 1;
			collidedProj <= 4;
		end
		else if ((bossProj5Y + projH > playerY) &&
			(((playerX >= bossProj5X) && (playerX < (bossProj5X + projW))) ||
			((bossProj5X > playerX) && (bossProj5X < (playerX + playerW))))) begin
			
			playerHit <= 1;
			projHit <= 1;
			collidedProj <= 5;
		end
		else begin
			playerHit <= 0;
			projHit <= 0;
		end
	end


endmodule
