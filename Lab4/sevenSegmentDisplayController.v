`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:03:21 11/29/2018 
// Design Name: 
// Module Name:    sevenSegmentDisplayController 
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
module sevenSegmentDisplayController(
	playerHealth, clk_display,
	seg, an
    );
	input [1:0] playerHealth;
	input clk_display;
	output reg [7:0] seg;
	output reg [3:0] an;
	
	parameter stFirst = 2'b00;
	parameter stSecond = 2'b01;
	parameter stThird = 2'b10;
	parameter stFourth = 2'b11;
	parameter fstSeg = 4'b0111;
	parameter sndSeg = 4'b1011;
	parameter thrdSeg = 4'b1101;
	parameter frthSeg = 4'b1110;
	
	reg [1:0] state;
	
	function [7:0] getSegment;
		input [3:0] digit;
		begin
			case (digit)
				4'b0000: getSegment = 8'b11000000;
				4'b0001: getSegment = 8'b11111001;
				4'b0010: getSegment = 8'b10100100;
				4'b0011: getSegment = 8'b10110000;
				4'b0100: getSegment = 8'b10011001;
				4'b0101: getSegment = 8'b10010010;
				4'b0110: getSegment = 8'b10000010;
				4'b0111: getSegment = 8'b11111000;
				4'b1000: getSegment = 8'b10000000;
				4'b1001: getSegment = 8'b10010000;
				default: getSegment = 8'b11111111;
			endcase
		end
	endfunction
	
	always @ (posedge clk_display) begin
		case (state)
			stFirst:
				state <= state + 1;
			stSecond:
				state <= state + 1;
			stThird:
				state <= state + 1;
			stFourth:
				state <= stFirst;
		endcase
	end
	
	always @ (*) begin
		case (state)
			stFirst: begin
				an = fstSeg;
				seg = getSegment(4'b1111);
				end
			stSecond: begin
				an = sndSeg;
				seg = getSegment(4'b1111);
				end
			stThird: begin
				an = thrdSeg;
				seg = getSegment(4'b1111);
				end
			stFourth: begin
				an = frthSeg;
				seg = getSegment(playerHealth);
				end
		endcase
	end
endmodule
