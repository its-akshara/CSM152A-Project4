`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:04:59 11/24/2018 
// Design Name: 
// Module Name:    bossController 
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
module bossController(clk_master, pulse_stepCycle, rst, bossHit, /*delay,*/
	bossLocX, bossLocY, bossWidth, bossHeight,
	proj1X, proj1Y,
	proj2X, proj2Y,
	proj3X, proj3Y,
	proj4X, proj4Y,
	proj5X, proj5Y,
	projW, projH,
	bossHP, bossShoot, attackType
    );
	input clk_master, pulse_stepCycle, rst, bossHit;
	output wire [9:0] bossLocX, bossWidth;
	output wire [8:0] bossLocY, bossHeight;
	output reg [9:0] proj1X, proj2X, proj3X, proj4X, proj5X,
		projW;
	output reg [8:0] proj1Y, proj2Y, proj3Y, proj4Y, proj5Y,
		projH;
	output reg bossShoot;
	output reg [1:0] attackType;
	output bossHP;
	
	parameter projAtk = 2'b00;
	parameter beamAtk = 2'b01;
	
	//BOSS LOCATION, SIZE CONSTANTS
	parameter BOSS_X = 150;
	parameter BOSS_Y = 50;
	parameter BOSS_W = 340;
	parameter BOSS_H = 150;
	
	assign bossLocX = BOSS_X;
	assign bossLocY = BOSS_Y;
	assign bossWidth = BOSS_W;
	assign bossHeight = BOSS_H;
	
	//ATTACK 1 & 2 CONSTANTS
	parameter PROJ_OFFSET = BOSS_W / 4;
	parameter PROJ_Y = BOSS_Y + BOSS_H;
	parameter PROJ_W = 10;
	parameter PROJ_H = 15;
	
	//ATTACK 1 CONSTANTS
	parameter ATK1_PROJ1_X = BOSS_X - (PROJ_W / 2);
	parameter ATK1_PROJ2_X = ATK1_PROJ1_X + PROJ_OFFSET;
	parameter ATK1_PROJ3_X = ATK1_PROJ2_X + PROJ_OFFSET;
	parameter ATK1_PROJ4_X = ATK1_PROJ3_X + PROJ_OFFSET;
	parameter ATK1_PROJ5_X = ATK1_PROJ4_X + PROJ_OFFSET;
	
	//ATTACK 2 CONSTANTS
	parameter ATK2_PROJ1_X = BOSS_X + (PROJ_OFFSET / 2) - (PROJ_W / 2);
	parameter ATK2_PROJ2_X = ATK2_PROJ1_X + PROJ_OFFSET;
	parameter ATK2_PROJ3_X = ATK2_PROJ2_X + PROJ_OFFSET;
	parameter ATK2_PROJ4_X = ATK2_PROJ3_X + PROJ_OFFSET;
	
	//ATTACK 3 CONSTANTS
	//parameter ATK3_PROJ1_X = <SOMETHING>
	//parameter ATK3_PROJ2_X = <SOMETHING>
	//parameter BEAM_W = 50;
	//parameter BEAM_H = 240;
	
	//ATTACK 4 CONSTANTS
	//parameter ATK4_PROJ1_X = <SOMETHING>
	//parameter ATK4_PROJ2_X = <SOMETHING>
	//parameter ATK4_PROJ3_X = <SOMETHING>
	
	reg [2:0] state = 0;
	//reg [27:0] timer = 1;
	//reg waitSignal;
	
	always @ (posedge clk_master) begin
		if (rst) begin
			state <= 0;
			bossShoot <= 0;
			//waitSignal <= 0;
		end
		else begin
			if (pulse_stepCycle) begin
				case (state)
					0: begin
						//waitSignal <= 0;
						state <= state + 1;
					end
					1, 3: begin
						proj1X <= ATK1_PROJ1_X;
						proj1Y <= PROJ_Y;
						proj2X <= ATK1_PROJ2_X;
						proj2Y <= PROJ_Y;
						proj3X <= ATK1_PROJ3_X;
						proj3Y <= PROJ_Y;
						proj4X <= ATK1_PROJ4_X;
						proj4Y <= PROJ_Y;
						proj5X <= ATK1_PROJ5_X;
						proj5Y <= PROJ_Y;
						projW <= PROJ_W;
						projH <= PROJ_H;
						attackType <= projAtk;
						bossShoot <= 1;
						state <= state + 1;
					end
					2, 4: begin
						proj1X <= ATK2_PROJ1_X;
						proj1Y <= PROJ_Y;
						proj2X <= ATK2_PROJ2_X;
						proj2Y <= PROJ_Y;
						proj3X <= ATK2_PROJ3_X;
						proj3Y <= PROJ_Y;
						proj4X <= ATK2_PROJ4_X;
						proj4Y <= PROJ_Y;
						proj5X <= 0;
						proj5Y <= 0;
						projW <= PROJ_W;
						projH <= PROJ_H;
						attackType <= projAtk;
						bossShoot <= 1;
						state <= state + 1;
					end
					5: /*begin
						proj1X <= ATK3_PROJ1_X;
						proj1Y <= PROJ_Y;
						proj2X <= ATK3_PROJ2_X;
						proj2Y <= PROJ_Y;
						proj3X <= 0;
						proj3Y <= 0;
						proj4X <= 0;
						proj4Y <= 0;
						proj5X <= 0;
						proj5Y <= 0;
						projW <= BEAM_W;
						projH <= BEAM_H;
						attackType <= beamAtk;
						timer <= 1;
						waitSignal <= 1;
						state <= state + 1;
					end
					*/
					state <= 0;
					6: /*begin
						proj1X <= ATK4_PROJ1_X;
						proj1Y <= PROJ_Y;
						proj2X <= ATK4_PROJ2_X;
						proj2Y <= PROJ_Y;
						proj3X <= ATK4_PROJ3_X;
						proj3Y <= PROJ_Y;
						proj4X <= 0;
						proj4Y <= 0;
						proj5X <= 0;
						proj5Y <= 0;
						projW <= BEAM_W;
						projH <= BEAM_H;
						attackType <= beamAtk;
						timer <= 1;
						waitSignal <= 1;
						state <= 0;
					end
					*/
					state <= 0;
				endcase
			end
			else
				bossShoot <= 0;
		end
	end
	/*
	always @ (posedge clk_master) begin
		if (waitSignal) begin
			timer <= timer + 1;
			if (timer == delay)
				bossShoot <= 1;
			else
				bossShoot <= 0;
		end
	end
	*/
	parameter BOSS_HP = 300;
	parameter HIT_DMG = 5;
	reg [9:0] bossHP = BOSS_HP;
	
	always @ (posedge clk_master) begin
		if (rst) begin
			bossHP <= BOSS_HP;
		end
		else if (bossHit) begin
			bossHP <= bossHP - HIT_DMG;
		end
	end
	
endmodule
