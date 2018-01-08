module wr_adr_gen(wren, count, trig, rst_trig, clk, rst);

output wren, rst_trig;
output [9:0] count;
input trig, clk, rst;
wire count_fin;

reg [9:0] count;

ctrl cu(clk, rst, trig, rst_trig, wren, count_fin);

assign count_fin = (count == 639);

always @(posedge clk , posedge rst)
	begin
	if (rst)
		count <= 0;
	else if (count == 639)
		count <= 0;
	else if (wren)
		count <= count + 1;
	end
	
endmodule