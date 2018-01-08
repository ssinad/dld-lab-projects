module shift_add_3(in, out);
	input unsigned[3:0] in;
	output unsigned[3:0] out;
	wire lt;
	assign lt = in < 4'd5;
	assign out = (lt)? in : in + 4'd3;
endmodule