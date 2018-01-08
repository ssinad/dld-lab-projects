module bin2bcd(A, H, T, O);
	input[8:0] A;
	output[3:0] H, T, O;
	
	wire [3:0] qw1, qw2, qw3;
	wire [7:0] ow1, ow2, ow3;
	
	shift_add_3 sa0({1'b0, A[8:6]}, qw1[3:0]);
	shift_add_3 sa1({qw1[2:0], A[5]}, qw2[3:0]);
	shift_add_3 sa2({qw2[2:0], A[4]}, qw3[3:0]);
	
	shift_add_3 sa3({1'b0, qw1[3], qw2[3], qw3[3]}, ow1[7:4]);
	shift_add_3 sa4({qw3[2:0], A[3]}, ow1[3:0]);
	
	shift_add_3 sa5(ow1[6:3], ow2[7:4]);
	shift_add_3 sa6({ow1[2:0], A[2]}, ow2[3:0]);
	
	shift_add_3 sa7(ow2[6:3], ow3[7:4]);
	shift_add_3 sa8({ow2[2:0], A[1]}, ow3[3:0]);
	
	assign H = {1'b0, ow1[7], ow2[7], ow3[7]};
	assign T = ow3[6:3];
	assign O = {ow3[2:0], A[0]};
endmodule