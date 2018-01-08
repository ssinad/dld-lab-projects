module AmpSel(sel, in, out);
	input[7:0] in;
	output [7:0] out;
	reg [7:0] out;
	input[1:0] sel;

	always @(sel, in)
		begin
			out <= in;
			case (sel)
				2'b00:
					out <= in;
				2'b01:
					out <= {1'b0, in[7:1]};
				2'b10:
					out <= {2'b0, in[7:2]};
				2'b11:
					out <= {3'b0, in[7:3]};
			endcase
		end
		
endmodule