module ADC_bin(CLOCK_50, rst, compare, pwm_out, bs_out, disp_out);
	input CLOCK_50;
	input rst;
	wire search_clk;
	input compare;
	wire compare;
	output pwm_out;
	output unsigned[7:0] bs_out, disp_out;
	
	wire[7:0] dummy;
	//assign compare = (dummy_input > bs_out);
	
	//assign disp_out[7] = compare;
	
	clk_div cd(CLOCK_50, search_clk, rst);
	BinarySearch bs(search_clk, rst, bs_out, disp_out, compare);
	PWM pwm(bs_out, CLOCK_50, pwm_out, rst );
	
endmodule