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
	projW,
	playerHit, projHit, collidedProj
    );
	input clk;
	input [9:0] playerX, playerW, playerProj1X, playerProj2X, playerProj3X, projW;
	input [8:0] playerY, playerH, playerProj1Y, playerProj2Y, playerProj3Y;
	output playerHit, projHit;
	output [2:0] collidedProj;
	
	always @ (posedge clk) begin
		if ((bossProj1Y < (playerY + playerH)) &&
			(((playerX >= bossProj1X) && (bossX < (bossProj1X + projW))) ||
			((bossProj1X > playerX) && (bossProj1X < (playerX + playerW))))) begin
			
			playerHit <= 1;
			projHit <= 1;
			collidedProj <= 1;
		end
		else if ((bossProj2Y < (playerY + playerH)) &&
			(((playerX >= bossProj2X) && (bossX < (bossProj2X + projW))) ||
			((bossProj2X > playerX) && (bossProj2X < (playerX + playerW))))) begin
			
			playerHit <= 1;
			projHit <= 1;
			collidedProj <= 2;
		end
		else if ((bossProj3Y < (playerY + playerH)) &&
			(((playerX >= bossProj3X) && (bossX < (bossProj3X + projW))) ||
			((bossProj3X > playerX) && (bossProj3X < (playerX + playerW))))) begin
			
			playerHit <= 1;
			projHit <= 1;
			collidedProj <= 3;
		end
		else if ((bossProj4Y < (playerY + playerH)) &&
			(((playerX >= bossProj4X) && (bossX < (bossProj4X + projW))) ||
			((bossProj4X > playerX) && (bossProj4X < (playerX + playerW))))) begin
			
			playerHit <= 1;
			projHit <= 1;
			collidedProj <= 4;
		end
		else if ((bossProj5Y < (playerY + playerH)) &&
			(((playerX >= bossProj5X) && (bossX < (bossProj5X + projW))) ||
			((bossProj5X > playerX) && (bossProj5X < (playerX + playerW))))) begin
			
			playerHit <= 1;
			projHit <= 1;
			collidedProj <= 5;
		end
		else if (playerProj1Y < 0) begin
			projHit <= 1;
			collidedProj <= 1;
		end
		else if (playerProj2Y < 0) begin
			projHit <= 1;
			collidedProj <= 2;
		end
		else if (playerProj3Y < 0) begin
			projHit <= 1;
			collidedProj <= 3;
		end
		else if (playerProj4Y < 0) begin
			projHit <= 1;
			collidedProj <= 4;
		end
		else if (playerProj5Y < 0) begin
			projHit <= 1;
			collidedProj <= 5;
		end
		else begin
			playerHit <= 0;
			projHit <= 0;
		end
	end


endmodule
