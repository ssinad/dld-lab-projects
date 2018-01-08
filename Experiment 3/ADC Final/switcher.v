module switcher( Sel, Ones, Tens, Hundreds, Anodes, Cathodes);// 00 01 10 11
		input [1:0] Sel;
		input [7:0] Ones, Tens, Hundreds;
		output reg [7:0] Anodes;
		output reg [3:0] Cathodes;
		
		always @(*)
		begin
			case (Sel)
			2'b00:
				Anodes <= Hundreds;
			2'b01:
				Anodes <= Tens;
			2'b10:
				Anodes <= Ones;
			2'b11:
				Anodes <= 8'h3F;
			endcase
		end
		
		always @(*)
		begin
			case (Sel)
			2'b00:
				Cathodes <= 4'b1110;
			2'b01:
				Cathodes <= 4'b1101;
			2'b10:
				Cathodes <= 4'b1011;
			2'b11:
				Cathodes <= 4'b0111;
			endcase
		end
endmodule