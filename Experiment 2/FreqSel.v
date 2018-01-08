module FreqSel(sel, clk_in, clk_out, rst);
	input clk_in, rst;
	output reg clk_out;
	input[1:0] sel;
	reg[11:0] i;
	always @(posedge clk_in or posedge rst)
	begin
		if (rst)
			i <= 12'd0;
		else
			i <= i + 12'd1;
	end
	always @(sel, i)
		begin
			clk_out <= i[11];
			case (sel)
				2'b00:
					clk_out <= i[11];
				2'b01:
					clk_out <= i[10];
				2'b10:
					clk_out <= i[9];
				2'b11:
					clk_out <= i[8];
			endcase
		end
endmodule