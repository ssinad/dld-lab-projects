module rgb_gen(data_in, x_in, y_in, rgb_out);
	wire is_data;
	output reg [2:0] rgb_out;
	input [9:0] y_in, x_in;
	input[7:0] data_in;
	assign is_data = (y_in + data_in == 367);
	wire is_grid;
	Grid grid(x_in, y_in, is_grid);
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