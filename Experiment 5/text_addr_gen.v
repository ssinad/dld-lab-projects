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
	wire [3:0] offset_y;
	output enable;
	wire[9:0] d, char_index;
	wire[6:0] char_no;

	assign enable =(curr_x >= x_base && curr_x < x_base + (length << 3)) && (curr_y >= y_base && curr_y < y_base + 16); 

	assign offset_x = ~(d);
	assign offset_y = (curr_y - y_base);
	
	assign d = curr_x - x_base;
	
	assign char_no = d[9:3];
	
	assign char_index = (length - 1 - char_no) << 3;
	reg[7:0] char;
	integer i;
	always @(*)
		 for (i = 0; i < 8; i = i + 1)
			char[i] <= text[char_index + i];
		
	assign adr = (char << 4) + offset_y;
	
	/*always@(*)
	begin
	 
	case ({in_pic, is_char[1], is_char[2], is_char[3], is_char[4], is_char[5]})
	6'b010000:
	begin
		rgbo ={3{font_data[offset_x]}};
		adr = 11'h310 + offset_y;
	end
	6'b001000:
	begin

		adr = 11'h5F0 + offset_y;
	end
	6'b000100:
	begin
		adr = 11'h300 + offset_y;
	end
	6'b000010:
	begin

		adr = 11'h5F0 + offset_y;
	end
	6'b000001:
	begin
		adr = 11'h380 + offset_y;
	end
	endcase
	end*/
endmodule