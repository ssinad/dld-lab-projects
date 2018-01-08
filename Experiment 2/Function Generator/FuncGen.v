module FuncGen(clk, rst, out, ampl, freq, func);

	wire [7:0] select, out_func;
	wire clk_out;
	output out;
	input rst, clk;
	input[1:0] ampl, freq;
	input[2:0]	func;
	
	AmpSel asel(ampl, out_func, select);
	FreqSel fsel(freq, clk, clk_out, rst);
	DigFuncGen dfg(func, clk_out, rst, out_func);
	PWM pwm(select, clk, out, rst);
	
	endmodule