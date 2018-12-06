`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:10:56 12/06/2018 
// Design Name: 
// Module Name:    immuneController 
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
module immuneController(
	clk, pulse_immune, immune, display_player
    );
	input clk,pulse_immune, immune;
	output reg display_player = 1;
	
	always@(posedge clk)
	begin
		if(immune)
		begin
			if(pulse_immune)
				display_player <= ~display_player;
		end
		else
			display_player <= 1;
	end
	

endmodule
