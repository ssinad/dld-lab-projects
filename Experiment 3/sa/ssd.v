module ssd(in, ones, tens, hundreds);
	input[8:0] in;
	output[3:0] ones, tens, hundreds;
	assign ones=in%9'd10;
	assign tens=(in/9'd10)%4'd10;
	assign hundreds=(in/9'd100)%4'd10;
endmodule