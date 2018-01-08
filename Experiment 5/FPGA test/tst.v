module tst(clk, rst, enable, adr, offset_x, x, y, char, text, char_index);
	output[2:0] offset_x;
	output[10:0] adr;
	output enable;
	input clk, rst;
	output wire [9:0] x, y, char_index;
	output [7:0] char;
	output [100:0] text;
	assign text = "Hello World!";
	/*input[31:0] n;
	input[16:0] div;
	output[16:0] rem;
	
	assign rem = n % div;
	
	output wire[7:0] text;
	assign text = "2";
	*/	
	VGA_CTRL(1'b0, 1'b0, 1'b0, clk, rst, x, y, H_sync, V_sync, R_out, B_out, G_out);
	 text_addr_gen#("Hello World!", 12)(
		50, 
		0,  
		x, 
		y, 
		adr, 
		enable,
		offset_x,
		char,
		char_index
		//text
		);
endmodule