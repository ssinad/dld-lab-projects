module rgb_gen(x_in, y_in, data_in, rgb_out);
	input unsigned [7:0] data_in;
	input unsigned [9:0] x_in, y_in;
	output reg [2:0] rgb_out;
	
	wire is_data, is_grid;
	assign is_data = (y_in + data_in == 276);
	grid(x_in, y_in, is_grid);
	
	always @(*)
	begin
	rgb_out = 3'b0;
		casex ({is_data, is_grid})
			2'b1x:
				rgb_out = 3'b111;
			2'b01:
				rgb_out = 3'b010;
		endcase
	end
endmodule