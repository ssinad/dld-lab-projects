module testcases(
clk, 
rst, 
slope, 
mode, 
level, 
time_per_div, 
volt_per_div, 
adc_sample, 
rst_trig, 
wren, 
trigger, 
clk_out, 
func_clk,
wraddress);

	input clk, rst;
	input slope, mode;
	input [7:0] level;
	input [1:0] time_per_div, volt_per_div;
	input [7:0] adc_sample;
	output rst_trig, wren, trigger, clk_out, func_clk;
	output [9:0] wraddress;

	//assign clk = CLOCK_50;

	wire[7:0] data_out, adc_sample;
	wire wren, clk, clk_out;
	wire R_in, G_in, B_in;
	//output R_out, B_out, G_out, H_sync, V_sync;
	wire [9:0] x, y, wraddress;
	wire trigger, rst_trig, func_clk;
	
	time_division i5(clk, rst, time_per_div, clk_out, func_clk);
	wr_adr_gen i6(wren, wraddress, trigger, rst_trig, clk_out, rst);
	sampler_scaller i7(clk_out, rst, volt_per_div, adc_sample, out_ss);
	trig_ctrl i8(level, adc_sample, slope, mode, rst, clk, rst_trig, trigger);
endmodule