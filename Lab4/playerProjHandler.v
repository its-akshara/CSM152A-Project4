`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:07 11/25/2018 
// Design Name: 
// Module Name:    playerProjHandler 
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
module playerProjHandler(clk, rst, pulse_projSpeed, shoot, projHit, collidedProj,
	playerX, playerY, playerW,
//	i_proj1X, i_proj1Y, i_proj2X, i_proj2Y, i_proj3X, i_proj3Y,
	o_proj1X, o_proj1Y, o_proj2X, o_proj2Y, o_proj3X, o_proj3Y
    );
	input clk, rst, pulse_projSpeed, shoot, projHit;
	input [1:0] collidedProj;
	input [9:0] playerX, playerW;
	input [8:0] playerY;
	
	output reg [9:0] o_proj1X=0, o_proj2X=0, o_proj3X=0;
	output reg [8:0] o_proj1Y=0, o_proj2Y=0, o_proj3Y=0;
	
	parameter TOP_BOUNDARY = 31;
	parameter STEP = 1;

	always @(posedge clk)
	begin
		if(rst)
		begin
			o_proj1X <= 0;
			o_proj1Y <= 0;
			o_proj2X <= 0;
			o_proj2Y <= 0;
			o_proj3X <= 0;
			o_proj3Y <= 0;
		end
		else if(shoot) //create a new projectile only if space available
		begin
			if(o_proj1X==0 && o_proj1Y ==0)
			begin
				o_proj1X <= playerX + playerW/4;
				o_proj1Y <= playerY - playerW;
			end
			else if(o_proj2X==0 && o_proj2Y ==0)
			begin
				o_proj2X <= playerX + playerW/4;
				o_proj2Y <= playerY - playerW;
			end
			else if(o_proj3X==0 && o_proj3Y ==0)
			begin
				o_proj3X <= playerX + playerW/4;
				o_proj3Y <= playerY - playerW;
			end
		end //NOTE check logic here!!
		if(pulse_projSpeed) // update location and check for collision
		begin
			if(((o_proj1Y+STEP)<=TOP_BOUNDARY || (projHit && collidedProj==2'b01) || (o_proj1X==0 && o_proj1Y==0))) 
			begin
				o_proj1X <= 0;
				o_proj1Y <= 0;
			end
			else
			begin
				o_proj1X <= o_proj1X;
				o_proj1Y <= o_proj1Y-STEP;
			end // NOTE consider adding !shoot in if
			if(((o_proj2Y+STEP)<=TOP_BOUNDARY || (projHit && collidedProj==2'b10) || (o_proj2X==0 && o_proj2Y==0))) 
			begin
				o_proj2X <= 0;
				o_proj2Y <= 0;
			end
			else
			begin
				o_proj2X <= o_proj2X;
				o_proj2Y <= o_proj2Y-STEP;
			end
			if(((o_proj3Y+STEP)<=TOP_BOUNDARY || (projHit && collidedProj==2'b11) || (o_proj3X==0 && o_proj3Y==0))) 
			begin
				o_proj3X <= 0;
				o_proj3Y <= 0;
			end
			else
			begin
				o_proj3X <= o_proj3X;
				o_proj3Y <= o_proj3Y-STEP;
			end
		end
		
	end

endmodule
