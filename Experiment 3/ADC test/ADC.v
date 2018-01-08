module ADC(CLOCK_50, rst, search_clk,/* compare,*/ pwm_out, bs_out, disp_out, dummy_input);
	input CLOCK_50;
	input rst;
	input search_clk;
	//input compare;
	wire compare;
	output pwm_out;
	output unsigned[7:0] bs_out, disp_out;
	input unsigned[7:0]dummy_input;
	
	assign compare = (dummy_input > bs_out);
	
	BinarySearch bs(search_clk, rst, bs_out, disp_out, compare);
	PWM pwm(bs_out, CLOCK_50, pwm_out, rst );
	
endmodule