module text_addr_gen(
x_base, 
y_base,  
curr_x, 
curr_y, 
adr, 
enable,
offset_x,
text,
length
);
	
	//parameter text = "Hello World!";
	parameter size = 80;//$len(text); 
	input[size << 3 - 1 : 0] text;
	input [6:0] length;
	
	input [9:0] x_base, y_base, curr_x, curr_y;

	output [10:0] adr;
	//reg unsigned [7:0] is_char;
	output wire [2:0] offset_x;
	output enable;
	//This module is not free
	//You have to pay for it
endmodule