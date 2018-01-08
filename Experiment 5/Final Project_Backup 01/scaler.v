module scaler(in_scaler, volt_per_div, out_scaler);
	input[7:0] in_scaler;
	input [1:0] volt_per_div;
	output reg [7:0] out_scaler;
	always@(*)
	begin
		case(volt_per_div)
		2'b00:
			out_scaler=in_scaler;
		2'b01:
			out_scaler={1'b0,in_scaler[7:1]};
		2'b10:
			out_scaler={2'b0,in_scaler[7:2]};
		2'b11:
			out_scaler={3'b0,in_scaler[7:3]};
		endcase
	end
endmodule