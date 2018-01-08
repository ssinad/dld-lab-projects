module bin2ss(in, out);

	input[3:0] in;
	output [6:0] out;
	reg [6:0] ss;
	
	assign out = ss;
	always @(in)
	begin
		case(in)
			4'b0:
				ss <= 7'h3F;
			4'b1:
				ss <= 7'h06;
			4'd2:
				ss <= 7'h5B;
			4'd3:
				ss <= 7'h4F;
			4'd4:
				ss <= 7'h66;
			4'd5:
				ss <= 7'h6D;
			4'd6:
				ss <= 7'h7D;
			4'd7:
				ss <= 7'h07;
			4'd8:
				ss <= 7'h7F;
			4'd9:
				ss <= 7'h6F;
			4'd10:
				ss <= 7'h77;
			4'd11:
				ss <= 7'h7C;
			4'd12:
				ss <= 7'h39;
			4'd13:
				ss <= 7'h5E;
			4'd14:
				ss <= 7'h79;
			4'd15:
				ss <= 7'h71;
		endcase
	end
endmodule