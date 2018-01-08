module grid(x_in, y_in, is_grid);
input[9:0] x_in, y_in;
output is_grid;
assign is_grid = (x_in % 80 == 79 || y_in % 80 == 79);
endmodule