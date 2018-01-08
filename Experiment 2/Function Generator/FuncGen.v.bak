module Square_pwm(clk, rst, out);
	wire [7:0] select;
	output out;
	input rst, clk;
	Square sq(clk, rst, select);
	PWM pwm(select, clk, out, rst );
	endmodule