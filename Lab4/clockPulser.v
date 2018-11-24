`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:06 11/13/2018 
// Design Name: 
// Module Name:    clockPulser 
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
module clockPulser(clk, rst, maxValue, clk_out);
	input clk, rst;
	input [27:0] maxValue;
	output reg clk_out=0;
	
	reg [27:0] counter = 1;
	
	always @(posedge clk) begin
		if (rst) begin
			counter <= 1;
			clk_out <= 1'b0;
		end
		else begin
			counter <= counter + 1'b1;
			if (counter == maxValue) begin
				clk_out <= 1;
				counter <= 1;
			end
			else
				clk_out <= 0;
		end
	end
endmodule
