module oscilloscpoe( clk, rst, slope, mode, sel, level, time_per_div, volt_per_div, R_out, B_out, G_out, H_sync, V_sync);

input clk, rst;
input slope, mode;
input [7:0] level;
input [1:0] time_per_div, volt_per_div;
input [2:0] sel; 

//assign clk = CLOCK_50;

wire[7:0] data_out, adc_sample;
wire wren, clk, clk_out;
wire R_in, G_in, B_in;
output R_out, B_out, G_out, H_sync, V_sync;
wire [9:0] x, y, wraddress;
wire trigger, rst_trig, func_clk;

wire [7:0] out_ss;

VGA_CTRL i2(R_in, G_in, B_in, clk, rst, x, y, H_sync, V_sync, R_out, B_out, G_out);
DigFuncGen fg1(sel, func_clk, rst, adc_sample);
rgb_gen i3(x, y, data_out, {R_in, G_in, B_in});
time_division i5(clk, rst, time_per_div, clk_out, func_clk);
wr_adr_gen i6(wren, wraddress, trigger, rst_trig, clk_out, rst);
sampler_scaller i7(clk_out, rst, volt_per_div, adc_sample, out_ss);
trig_ctrl i8(level, adc_sample, slope, mode, rst, clk, rst_trig, trigger);
//trig_ctrl (level, sample,     slope, mode, rst, clk, rst_trig, trigger);

 
  storage_mem i4(
	!clk,
	out_ss,
	x,
	wraddress,
	wren,
	data_out);
 endmodule