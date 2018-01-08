module Grid(x_in, y_in, is_grid);

input [9:0] x_in, y_in;
output is_grid;
	assign is_grid = (x_in % 40 == 0) || (y_in % 40 == 0);

endmodule