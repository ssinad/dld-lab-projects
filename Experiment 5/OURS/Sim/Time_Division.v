module time_division(clk_in, rst, time_per_div, clk_out, func_clk);
	input clk_in, rst;
	input [1:0]time_per_div;
	localparam func_top = 8;
	output reg clk_out, func_clk;
	reg[19:0] timer, func_timer, top;
	always@(posedge clk_in)
		if(rst || timer == top - 1)
		timer=0;
		else
		timer=timer+1;
	
	always@(posedge clk_in)
		if(rst || func_timer == func_top - 1)
		func_timer=0;
		else
		func_timer=func_timer+1;
		
	always@(time_per_div)
		case(time_per_div)
				2'b00:
					top=1;
				2'b01:
					top=2;
				2'b10:
					top=4;
				2'b11:
					top=8;
					endcase
		/*case(time_per_div)
				2'b00:
					top=25000;
				2'b01:
					top=50000;
				2'b10:
					top=100000;
				2'b11:
					top=200000;
					endcase*/
	always@(posedge clk_in)
		if (rst)
			clk_out = 1;
		else if (timer == top - 1)
			clk_out = ~clk_out;
			
	always@(posedge clk_in)
		if (rst)
			func_clk = 1;
		else if (func_timer == func_top - 1)
			func_clk = ~func_clk;
endmodule