module time_division(clk_in, rst, time_per_div, clk_out);
	input clk_in, rst;
	input [1:0]time_per_div;
	output reg clk_out;
	reg[19:0] timer, top;
	always@(posedge clk_in)
		if(rst || timer == top)
		timer=0;
		else
		timer=timer+1;
	always@(time_per_div)
		case(time_per_div)
				2'b00:
					top=24999;
				2'b01:
					top=49999;
				2'b10:
					top=99999;
				2'b11:
					top=199999;
					endcase
	always@(posedge clk_in)
		if (rst)
			clk_out = 1;
		else if (timer == top)
			clk_out = ~clk_out;
endmodule