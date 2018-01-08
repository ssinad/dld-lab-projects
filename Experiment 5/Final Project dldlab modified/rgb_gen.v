module rgb_gen(x_in, y_in, data_in, rgb_out, addr, font_data, slope, mode, sel);
	input unsigned [7:0] data_in;
	input unsigned [9:0] x_in, y_in;
	output reg [2:0] rgb_out;
	input [7:0] font_data;
	output reg[10:0] addr;
	wire[10:0] addr_gen[1:6];
	input slope, mode;
	input[2:0] sel;
	
	wire is_data, is_grid;
	wire is_text[1:6];
	wire is_any_text;
	assign is_data = (y_in + data_in == 276);
	grid(x_in, y_in, is_grid);
	reg [2:0] offset_x;
	wire [2:0] offset_x_gen [1:6];
	
	text_addr_gen#(20) text1(
	280, 
	350,  
	x_in, 
	y_in, 
	addr_gen[1], 
	is_text[1],
	offset_x_gen[1],
	"Digital Oscilloscope",
	20
	);
	
	/*text_addr_gen#(8) text2(
	320, 
	370,  
	x_in, 
	y_in, 
	addr_gen[2], 
	is_text[2],
	offset_x_gen[2],
	"SSD ARSh"
	);*/
	
	reg [13 * 8 - 1 : 0] mode_txt;
	reg[4:0] mode_len;
	
	always @(mode)
	if (mode)
	begin
		mode_txt =  "Mode : Auto";
		mode_len = 11;
	end
	else
	begin
		mode_txt = "Mode : Normal";
		mode_len = 13;
	end
		
	text_addr_gen#(13) text3(
	300, 
	390,  
	x_in, 
	y_in, 
	addr_gen[3], 
	is_text[3],
	offset_x_gen[3],
	mode_txt,
	mode_len
	);
	
	reg [13 * 8 - 1 : 0] wav_txt;
	reg[4:0] wav_len;
	
	always @(sel)
	begin
	wav_txt = "No Wave";
	wav_len = 13; 
			case (sel)
			3'b0:
			begin
				wav_txt = "Sine Wave";
				wav_len = 9; 
			end
			3'b1:
			begin
				wav_txt = "Sawtooth Wave";
				wav_len = 13;
			end
			3'b010:
			begin
				wav_txt = "Triangle Wave";
				wav_len = 13;
			end	
			3'b011:
			begin
				wav_txt = "Square Wave";
				wav_len = 11;
			end
				endcase
	end
		
	text_addr_gen#(13) text2(
	300, 
	370,  
	x_in, 
	y_in, 
	addr_gen[2], 
	is_text[2],
	offset_x_gen[2],
	wav_txt,
	wav_len
	);
	
	reg [7 * 8 - 1 : 0] slope_txt;
	
	always @(slope)
	begin
		if (slope)
			slope_txt <= "Slope +";
		else
			slope_txt <= "Slope -";
	end
		
	text_addr_gen#(7) text4(
	320, 
	410,  
	x_in, 
	y_in, 
	addr_gen[4], 
	is_text[4],
	offset_x_gen[4],
	slope_txt,
	7
	);
	
	always @(*)
	begin
		addr = 0; offset_x = 0;
		casex({is_text[1], is_text[2], is_text[3], is_text[4]})
		4'b1000:
		begin
			addr = addr_gen[1];
			offset_x = offset_x_gen[1];
		end
		4'b0100:
		begin
			addr = addr_gen[2];
			offset_x = offset_x_gen[2];
		end
		4'b0010:
		begin
			addr = addr_gen[3];
			offset_x = offset_x_gen[3];
		end
		4'b0001:
		begin
			addr = addr_gen[4];
			offset_x = offset_x_gen[4];
		end
		endcase
	end
	
	assign is_any_text = is_text[1] ||  is_text[2] ||  is_text[3] ||  is_text[4];
	
	always @(*)
	begin
	rgb_out = 3'b0;
		casex ({is_data, is_any_text, is_grid })
			3'b1xx:
				rgb_out = 3'b111;
			3'b01x:
				rgb_out = {3{font_data[offset_x]}};
			3'b001:
				rgb_out = 3'b010;
		endcase
	end
endmodule