module clk_div( clk_in, clk_out, rst );
	input clk_in, rst;
	output clk_out;
	reg [26:0] count;
	always @(posedge rst, posedge clk_in)
	begin
		if (rst)
		count <= 27'b0;
		else
		count <= count + 27'b1;
	end
	assign clk_out = count[25];
endmodule