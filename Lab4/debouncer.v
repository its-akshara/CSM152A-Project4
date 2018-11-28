`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:18:57 11/28/2018 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(clk, rst, btnInput, btn_signal
    );
	
	input clk, rst, btnInput;
	output reg btn_signal;
	
	wire [17:0] clk_dv_inc;
	reg [16:0] clk_dv;
	reg clk_en;
	reg clk_en_d;
	reg [2:0] step_btn;

    assign clk_dv_inc = clk_dv + 1;
   
    always @ (posedge clk)
      if (rst)
        begin
           clk_dv   <= 0;
           clk_en   <= 1'b0;
           clk_en_d <= 1'b0;
        end
      else
        begin
           clk_dv   <= clk_dv_inc[16:0];
           clk_en   <= clk_dv_inc[17];
           clk_en_d <= clk_en;
        end
	

   always @ (posedge clk)
     if (rst)
       begin
		  step_btn[2:0]  <= 0;
       end
     else if (clk_en) // Down sampling
       begin
		  step_btn[2:0] <= {btnInput, step_btn[2:1]};
       end
	   
	// Detecting posedge of btnPause
	wire is_btn_posedge;
    assign is_btn_posedge = ~ step_btn[0] & step_btn[1];
	
	always @ (posedge clk)
		if (rst)
			begin
				btn_signal <= 1'b0;
			end
		else if (clk_en_d) 
			begin
				btn_signal <= is_btn_posedge;
			end
		else
			begin
				btn_signal <= 1'b0;
			end

endmodule
