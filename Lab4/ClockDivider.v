`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:46 10/30/2018 
// Design Name: 
// Module Name:    clockDivider 
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
module clockDivider(clk, rst, maxValue, clk_out);
	input clk, rst;
	input [25:0] maxValue;
	output reg clk_out=0;
	
	reg [25:0] counter=0;
	
	always @(posedge clk) begin
		if (rst) begin
			counter <= 1;
			clk_out <= 1'b0;
		end
		else begin
			counter <= counter + 1'b1;
			if (counter == maxValue) begin
				clk_out <= ~clk_out;
				counter <= 1;
			end
		end
	end

endmodule