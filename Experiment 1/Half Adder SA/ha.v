module HA(A, B, S, C);
	input A, B;
	output S, C;
	assign {C, S} = A + B;
endmodule