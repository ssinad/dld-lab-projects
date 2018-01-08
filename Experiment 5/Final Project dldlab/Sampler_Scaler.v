module sampler_scaller(clk, rst, volt_per_div, in, out_ss);
input clk, rst;
input [1:0] volt_per_div;
input[7:0] in;
output reg[7:0] out_ss;
wire [7:0] out_scaler;
scaler i1(in, volt_per_div, out_scaler);
always @(posedge clk, posedge rst)
if (rst)
out_ss=0;
else
out_ss=out_scaler;

//time_division i2(clk_in, rst, time_per_div, clk_out);


endmodule