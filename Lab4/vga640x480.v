`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    vga640x480 
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
module vga640x480(
	input wire dclk,			//pixel clock: 25MHz
	input wire rst,			//asynchronous reset
	
	input wire [9:0] bossX,
	input wire [8:0] bossY,
	input wire [9:0] bossW,
	input wire [8:0] bossH,
	
	input wire indicate1,
	input wire indicate2,
	input wire [9:0] bossProj1X,
	input wire [8:0] bossProj1Y,
	input wire [9:0] bossProj2X,
	input wire [8:0] bossProj2Y,
	input wire [9:0] bossProj3X,
	input wire [8:0] bossProj3Y,
	input wire [9:0] bossProj4X,
	input wire [8:0] bossProj4Y,
	input wire [9:0] bossProj5X,
	input wire [8:0] bossProj5Y,
	input wire [9:0] bossProjW,
	input wire [8:0] bossProjH,
	input wire [9:0] bossHP,
	
	input wire [9:0] playerX,
	input wire [8:0] playerY,
	input wire [9:0] playerW,
	input wire [8:0] playerH,
	
	input wire [9:0] playerProj1X,
	input wire [8:0] playerProj1Y,
	input wire [9:0] playerProj2X,
	input wire [8:0] playerProj2Y,
	input wire [9:0] playerProj3X,
	input wire [8:0] playerProj3Y,
	input wire [9:0] playerProjW,
	input wire [8:0] playerProjH,
	
	input wire [1:0] gameState,
	
	output wire hsync,		//horizontal sync out
	output wire vsync,		//vertical sync out
	output reg [2:0] red,	//red vga output
	output reg [2:0] green, //green vga output
	output reg [1:0] blue	//blue vga output
	);

// video structure constants
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96; 	// hsync pulse length
parameter vpulse = 2; 	// vsync pulse length
parameter hbp = 144; 	// end of horizontal back porch
parameter hfp = 784; 	// beginning of horizontal front porch
parameter vbp = 31; 		// end of vertical back porch
parameter vfp = 511; 	// beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

parameter bossHP_Y = 56;
parameter bossHP_H = 50;
parameter bossHP_X = 144 + 50;

parameter PX_PER_BLOCK = 15;
parameter VICTORY_Y = 233;
parameter VICTORY_X = 179;

parameter GAMEOVER_X = 314;
parameter GAMEOVER_Y = 189;

parameter LEFTEYE_X = 334;
parameter LEFTEYE_Y = 151;
parameter RIGHTEYE_X = 264+230;
parameter RIGHTEYE_Y = 151;

parameter INDIC_W = 10;
parameter INDIC_H = 15;
parameter INDIC_Y = 231;
parameter INDIC1_1X = 254;
parameter INDIC1_2X = 664;
parameter INDIC2_1X = 144 + 30;
parameter INDIC2_2X = 464;
parameter INDIC2_3X = 783 - 30;

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

// Horizontal & vertical counters --
// this is how we keep track of where we are on the screen.
// ------------------------
// Sequential "always block", which is a block that is
// only triggered on signal transitions or "edges".
// posedge = rising edge  &  negedge = falling edge
// Assignment statements can only be used on type "reg" and need to be of the "non-blocking" type: <=
always @(posedge dclk or posedge rst)
begin
	// reset condition
	if (rst == 1)
	begin
		hc <= 0;
		vc <= 0;
	end
	else
	begin
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
		else
		// When we hit the end of the line, reset the horizontal
		// counter and increment the vertical counter.
		// If vertical counter is at the end of the frame, then
		// reset that one too.
		begin
			hc <= 0;
			if (vc < vlines - 1)
				vc <= vc + 1;
			else
				vc <= 0;
		end
		
	end
end

// generate sync pulses (active low)
// ----------------
// "assign" statements are a quick way to
// give values to variables of type: wire
assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

// display 100% saturation colorbars
// ------------------------
// Combinational "always block", which is a block that is
// triggered when anything in the "sensitivity list" changes.
// The asterisk implies that everything that is capable of triggering the block
// is automatically included in the sensitivty list.  In this case, it would be
// equivalent to the following: always @(hc, vc)
// Assignment statements can only be used on type "reg" and should be of the "blocking" type: =
always @(hc,vc)
begin
	// first check if we're within vertical active video range
	if (vc >= vbp && vc < vfp)
	begin
		// NORMAL GAME STATE
		if (gameState == 2'b00) begin
			// draw boss rectangle
			if (vc >= bossY && vc <= bossY + bossH &&
				hc >= bossX && hc <= bossX + bossW)
			begin
				red = 3'b111;
				green = 3'b000;
				blue = 2'b00;
			end
			
			// draw boss HP meter
			else if (vc >= bossHP_Y && vc <= (bossHP_Y + bossHP_H) &&
				hc >= bossHP_X && hc <= (bossHP_X + bossHP))
			begin
				//if (bossHP > 360) begin
					red = 3'b000;
					green = 3'b111;
					blue = 2'b00;
				//end
				/*
				else if (bossHP > 180) begin
					red = 3'b111;
					green = 3'b111;
					blue = 2'b00;
				end
				else begin
					red = 3'b111;
					green = 3'b000;
					blue = 2'b00;
				end
				*/
			end
			
			// draw indicators
			else if (indicate1 && vc >= INDIC_Y && vc <= INDIC_Y + INDIC_H &&
					((hc >= INDIC1_1X && hc <= INDIC1_1X + INDIC_W) ||
					(hc >= INDIC1_2X && hc <= INDIC1_2X + INDIC_W)))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b00;
			end
						
			else if (indicate2 && vc >= INDIC_Y && vc <= INDIC_Y + INDIC_H &&
					((hc >= INDIC2_1X && hc <= INDIC2_1X + INDIC_W) ||
					(hc >= INDIC2_2X && hc <= INDIC2_2X + INDIC_W) ||
					(hc >= INDIC2_3X && hc <= INDIC2_3X + INDIC_W)))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b00;
			end
						
			// draw boss projectile 1
			else if (bossProj1X >= 144 && bossProj1Y >= 31 &&
				vc >= bossProj1Y && vc <= bossProj1Y + bossProjH &&
				hc >= bossProj1X && hc <= bossProj1X + bossProjW)
			begin
				red = 3'b111;
				green = 3'b000;
				blue = 2'b11;
			end
			
			// draw boss projectile 2
			else if (bossProj2X >= 144 && bossProj2Y >= 31 &&
				vc >= bossProj2Y && vc <= bossProj2Y + bossProjH &&
				hc >= bossProj2X && hc <= bossProj2X + bossProjW)
			begin
				red = 3'b111;
				green = 3'b000;
				blue = 2'b11;
			end
			
			// draw boss projectile 3
			else if (bossProj3X >= 144 && bossProj3Y >= 31 &&
				vc >= bossProj3Y && vc <= bossProj3Y + bossProjH &&
				hc >= bossProj3X && hc <= bossProj3X + bossProjW)
			begin
				red = 3'b111;
				green = 3'b000;
				blue = 2'b11;
			end
			
			// draw boss projectile 4
			else if (bossProj4X >= 144 && bossProj4Y >= 31 &&
				vc >= bossProj4Y && vc <= bossProj4Y + bossProjH &&
				hc >= bossProj4X && hc <= bossProj4X + bossProjW)
			begin
				red = 3'b111;
				green = 3'b000;
				blue = 2'b11;
			end
			
			// draw boss projectile 5
			else if (bossProj5X >= 144 && bossProj5Y >= 31 &&
				vc >= bossProj5Y && vc <= bossProj5Y + bossProjH &&
				hc >= bossProj5X && hc <= bossProj5X + bossProjW)
			begin
				red = 3'b111;
				green = 3'b000;
				blue = 2'b11;
			end
			
			// draw player
			else if (vc >= playerY && vc <= playerY + playerH &&
				hc >= playerX && hc <= playerX + playerW)
			begin
				red = 3'b000;
				green = 3'b000;
				blue = 2'b11;
			end
			
			// draw player projectile 1
			else if (playerProj1X >= 144 && playerProj1Y >= 31 &&
				vc >= playerProj1Y && vc <= playerProj1Y + playerProjH &&
				hc >= playerProj1X && hc <= playerProj1X + playerProjW)
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b11;
			end
			
			// draw player projectile 2
			else if (playerProj2X >= 144 && playerProj2Y >= 31 &&
				vc >= playerProj2Y && vc <= playerProj2Y + playerProjH &&
				hc >= playerProj2X && hc <= playerProj2X + playerProjW)
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b11;
			end
			
			// draw player projectile 3
			else if (playerProj3X >= 144 && playerProj3Y >= 31 &&
				vc >= playerProj3Y && vc <= playerProj3Y + playerProjH &&
				hc >= playerProj3X && hc <= playerProj3X + playerProjW)
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b11;
			end
			
			// we're outside active horizontal range so display black
			else
			begin
				red = 0;
				green = 0;
				blue = 0;
			end
		end
		//VICTORY GAME SCREEN
		else if (gameState == 2'b01) begin
			//Display "V"
			if (vc >= VICTORY_Y && vc <= VICTORY_Y + (3*PX_PER_BLOCK) &&
				hc >= VICTORY_X && hc <= VICTORY_X + PX_PER_BLOCK)
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + (3*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (4*PX_PER_BLOCK) && hc <= VICTORY_X + (5*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + (3*PX_PER_BLOCK) && vc <= VICTORY_Y + (4*PX_PER_BLOCK) &&
				((hc >= VICTORY_X + PX_PER_BLOCK && hc <= VICTORY_X + (2*PX_PER_BLOCK)) ||
				(hc >= VICTORY_X + (3*PX_PER_BLOCK) && hc <= VICTORY_X + (4*PX_PER_BLOCK))))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + (4*PX_PER_BLOCK) && vc <= VICTORY_Y + (5*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (2*PX_PER_BLOCK) && hc <= VICTORY_X + (3*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			//Display "I"
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + (5*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (6*PX_PER_BLOCK) && hc <= VICTORY_X + (7*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			//Display "C"
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + PX_PER_BLOCK &&
				hc >= VICTORY_X + (8*PX_PER_BLOCK) && hc <= VICTORY_X + (12*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + (5*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (8*PX_PER_BLOCK) && hc <= VICTORY_X + (9*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + (4*PX_PER_BLOCK) && vc <= VICTORY_Y + (5*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (8*PX_PER_BLOCK) && hc <= VICTORY_X + (12*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			//Display "T"
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + PX_PER_BLOCK &&
				hc >= VICTORY_X + (13*PX_PER_BLOCK) && hc <= VICTORY_X + (18*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + (5*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (15*PX_PER_BLOCK) && hc <= VICTORY_X + (16*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			//Display "O"
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + PX_PER_BLOCK &&
				hc >= VICTORY_X + (20*PX_PER_BLOCK) && hc <= VICTORY_X + (22*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + PX_PER_BLOCK && vc <= VICTORY_Y + (4*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (19*PX_PER_BLOCK) && hc <= VICTORY_X + (20*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + PX_PER_BLOCK && vc <= VICTORY_Y + (4*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (22*PX_PER_BLOCK) && hc <= VICTORY_X + (23*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + (4*PX_PER_BLOCK) && vc <= VICTORY_Y + (5*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (20*PX_PER_BLOCK) && hc <= VICTORY_X + (22*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			//Display "R"
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + PX_PER_BLOCK &&
				hc >= VICTORY_X + (24*PX_PER_BLOCK) && hc <= VICTORY_X + (27*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + (5*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (24*PX_PER_BLOCK) && hc <= VICTORY_X + (25*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + (2*PX_PER_BLOCK) && vc <= VICTORY_Y + (3*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (24*PX_PER_BLOCK) && hc <= VICTORY_X + (28*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + PX_PER_BLOCK && vc <= VICTORY_Y + (2*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (27*PX_PER_BLOCK) && hc <= VICTORY_X + (28*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + (3*PX_PER_BLOCK) && vc <= VICTORY_Y + (4*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (26*PX_PER_BLOCK) && hc <= VICTORY_X + (27*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + (4*PX_PER_BLOCK) && vc <= VICTORY_Y + (5*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (27*PX_PER_BLOCK) && hc <= VICTORY_X + (28*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			//Display "Y"
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + PX_PER_BLOCK &&
				((hc >= VICTORY_X + (29*PX_PER_BLOCK) && hc <= VICTORY_X + (30*PX_PER_BLOCK)) ||
				(hc >= VICTORY_X + (33*PX_PER_BLOCK) && hc <= VICTORY_X + (34*PX_PER_BLOCK))))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + PX_PER_BLOCK && vc <= VICTORY_Y + (2*PX_PER_BLOCK) &&
				((hc >= VICTORY_X + (30*PX_PER_BLOCK) && hc <= VICTORY_X + (31*PX_PER_BLOCK)) ||
				(hc >= VICTORY_X + (32*PX_PER_BLOCK) && hc <= VICTORY_X + (33*PX_PER_BLOCK))))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			else if (vc >= VICTORY_Y + (2*PX_PER_BLOCK) && vc <= VICTORY_Y + (5*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (31*PX_PER_BLOCK) && hc <= VICTORY_X + (32*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
			
			//Display "!"
			else if (vc >= VICTORY_Y && vc <= VICTORY_Y + (3*PX_PER_BLOCK) &&
				hc >= VICTORY_X + (35*PX_PER_BLOCK) && hc <= VICTORY_X + (36*PX_PER_BLOCK))
			begin
				red = 3'b000;
				green = 3'b111;
				blue = 2'b00;
			end
            
            else if (vc >= VICTORY_Y + (4*PX_PER_BLOCK) && vc <= VICTORY_Y + (5*PX_PER_BLOCK) &&
                hc >= VICTORY_X + (35*PX_PER_BLOCK) && hc <= VICTORY_X + (36*PX_PER_BLOCK))
            begin
                red = 3'b000;
                green = 3'b111;
                blue = 2'b00;
            end
			
			else
			begin
				red = 0;
				green = 0;
				blue = 0;
			end
		end
		
		//GAME OVER SCREEN
		else if (gameState == 2'b10)
		begin
			//Display "G"
			if (vc >= GAMEOVER_Y && vc <= GAMEOVER_Y + PX_PER_BLOCK &&
				hc >= GAMEOVER_X + PX_PER_BLOCK && hc <= GAMEOVER_X + (4*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end
			
			else if (vc >= GAMEOVER_Y + PX_PER_BLOCK && vc <= GAMEOVER_Y + (4*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X && hc <= GAMEOVER_X + PX_PER_BLOCK)
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end
			
			else if (vc >= GAMEOVER_Y + (4*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (5*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + PX_PER_BLOCK && hc <= GAMEOVER_X + (4*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end
			
			else if (vc >= GAMEOVER_Y + (2*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (5*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (3*PX_PER_BLOCK) && hc <= GAMEOVER_X + (4*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end
			
			else if (vc >= GAMEOVER_Y + (2*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (3*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (2*PX_PER_BLOCK) && hc <= GAMEOVER_X + (3*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end
			
			//Display "A"
			else if (vc >= GAMEOVER_Y && vc <= GAMEOVER_Y + PX_PER_BLOCK &&
				hc >= GAMEOVER_X + (6*PX_PER_BLOCK) && hc <= GAMEOVER_X + (8*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + PX_PER_BLOCK && vc <= GAMEOVER_Y + (5*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (5*PX_PER_BLOCK) && hc <= GAMEOVER_X + (6*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + PX_PER_BLOCK && vc <= GAMEOVER_Y + (5*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (8*PX_PER_BLOCK) && hc <= GAMEOVER_X + (9*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (2*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (3*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (6*PX_PER_BLOCK) && hc <= GAMEOVER_X + (8*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			//Display "M"
			else if (vc >= GAMEOVER_Y && vc <= GAMEOVER_Y + (5*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (10*PX_PER_BLOCK) && hc <= GAMEOVER_X + (11*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + PX_PER_BLOCK && vc <= GAMEOVER_Y + (2*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (11*PX_PER_BLOCK) && hc <= GAMEOVER_X + (12*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (2*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (3*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (12*PX_PER_BLOCK) && hc <= GAMEOVER_X + (13*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + PX_PER_BLOCK && vc <= GAMEOVER_Y + (2*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (13*PX_PER_BLOCK) && hc <= GAMEOVER_X + (14*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y && vc <= GAMEOVER_Y + (5*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (14*PX_PER_BLOCK) && hc <= GAMEOVER_X + (15*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			//Display "E"
			else if (vc >= GAMEOVER_Y && vc <= GAMEOVER_Y + PX_PER_BLOCK &&
				hc >= GAMEOVER_X + (17*PX_PER_BLOCK) && hc <= GAMEOVER_X + (20*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (2*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (3*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (17*PX_PER_BLOCK) && hc <= GAMEOVER_X + (19*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (4*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (5*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (17*PX_PER_BLOCK) && hc <= GAMEOVER_X + (20*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y && vc <= GAMEOVER_Y + (5*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (16*PX_PER_BLOCK) && hc <= GAMEOVER_X + (17*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			//Display O
			else if (vc >= GAMEOVER_Y + (6*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (7*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + PX_PER_BLOCK && hc <= GAMEOVER_X + (3*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (7*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (10*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X && hc <= GAMEOVER_X + PX_PER_BLOCK)
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (7*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (10*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (3*PX_PER_BLOCK) && hc <= GAMEOVER_X + (4*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (10*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (11*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + PX_PER_BLOCK && hc <= GAMEOVER_X + (3*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			//Display V
			else if (vc >= GAMEOVER_Y + (6*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (9*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (5*PX_PER_BLOCK) && hc <= GAMEOVER_X + (6*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (6*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (9*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (9*PX_PER_BLOCK) && hc <= GAMEOVER_X + (10*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (9*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (10*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (6*PX_PER_BLOCK) && hc <= GAMEOVER_X + (7*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (10*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (11*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (7*PX_PER_BLOCK) && hc <= GAMEOVER_X + (8*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (9*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (10*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (8*PX_PER_BLOCK) && hc <= GAMEOVER_X + (9*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			//Display E
			else if (vc >= GAMEOVER_Y + (6*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (11*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (11*PX_PER_BLOCK) && hc <= GAMEOVER_X + (12*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (6*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (7*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (12*PX_PER_BLOCK) && hc <= GAMEOVER_X + (15*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (8*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (9*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (12*PX_PER_BLOCK) && hc <= GAMEOVER_X + (14*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (10*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (11*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (12*PX_PER_BLOCK) && hc <= GAMEOVER_X + (15*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			//Display "R"
			else if (vc >= GAMEOVER_Y + (6*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (11*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (16*PX_PER_BLOCK) && hc <= GAMEOVER_X + (17*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (6*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (7*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (17*PX_PER_BLOCK) && hc <= GAMEOVER_X + (19*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (8*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (9*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (17*PX_PER_BLOCK) && hc <= GAMEOVER_X + (20*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (7*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (8*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (19*PX_PER_BLOCK) && hc <= GAMEOVER_X + (20*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (9*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (10*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (18*PX_PER_BLOCK) && hc <= GAMEOVER_X + (19*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end

			else if (vc >= GAMEOVER_Y + (10*PX_PER_BLOCK) && vc <= GAMEOVER_Y + (11*PX_PER_BLOCK) &&
				hc >= GAMEOVER_X + (19*PX_PER_BLOCK) && hc <= GAMEOVER_X + (20*PX_PER_BLOCK))
			begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end
			
			else
			begin
				red = 0;
				green = 0;
				blue = 0;
			end
		end
	end
	// we're outside active vertical range so display black
	else
	begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule
		/*
		// now display different colors every 80 pixels
		// while we're within the active horizontal range
		// -----------------
		// display white bar
		if (hc >= hbp && hc < (hbp+80))
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b11;
		end
		// display yellow bar
		else if (hc >= (hbp+80) && hc < (hbp+160))
		begin
			red = 3'b111;
			green = 3'b111;
			blue = 2'b00;
		end
		// display cyan bar
		else if (hc >= (hbp+160) && hc < (hbp+240))
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b11;
		end
		// display green bar
		else if (hc >= (hbp+240) && hc < (hbp+320))
		begin
			red = 3'b000;
			green = 3'b111;
			blue = 2'b00;
		end
		// display magenta bar
		else if (hc >= (hbp+320) && hc < (hbp+400))
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b11;
		end
		// display red bar
		else if (hc >= (hbp+400) && hc < (hbp+480))
		begin
			red = 3'b111;
			green = 3'b000;
			blue = 2'b00;
		end
		// display blue bar
		else if (hc >= (hbp+480) && hc < (hbp+560))
		begin
			red = 3'b000;
			green = 3'b000;
			blue = 2'b11;
		end
		// display black bar
		else if (hc >= (hbp+560) && hc < (hbp+640))
		begin
			red = 3'b000;
			green = 3'b000;
			blue = 2'b00;
		end
		*/