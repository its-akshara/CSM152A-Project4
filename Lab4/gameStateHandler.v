`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:59:23 11/28/2018 
// Design Name: 
// Module Name:    gameStateHandler 
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
module gameStateHandler(clk, rst, bossHP, playerHP, gameState
    );
	
	input clk, rst;
	input [9:0] bossHP;
	input [1:0] playerHP;
	output reg [1:0] gameState;
	
	always @ (posedge clk) begin
		if (rst)
			gameState <= 2'b00;
		else if (bossHP == 0)
			gameState <= 2'b01;
		else if (playerHP == 0)
			gameState <= 2'b10;
		else
			gameState <= 2'b00;
	end


endmodule
