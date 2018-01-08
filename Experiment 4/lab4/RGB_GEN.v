module RGB_GEN(x, y, rgb_pic, rgbo, adr_pic, adr_text, font_data);

input unsigned[9:0]x, y;
input[2:0]rgb_pic;
output [2:0]rgbo;
input[7:0] font_data;
output reg[10:0] adr_text;
output unsigned[14:0]adr_pic;

parameter pic_x = 240, pic_y = 180, text_x =100, text_y = 400;

wire in_pic;
reg is_char[1:5];
reg[2:0] rgbo;

assign in_pic=(x>=pic_x && x<pic_x + 160) && (y>=pic_y && y<pic_y + 120);

integer i;

always @(*)
begin
for (i = 1; i<= 5; i = i + 1)
	is_char[i] = (x>=text_x + (i - 1)*8 && x<text_x + i * 8) && (y>=text_y + 0 && y<text_y+ 16);
end

wire[2:0] offset_x; wire[3:0] offset_y; 
wire[7:0] pic_ofs_x, pic_ofs_y;

assign offset_x = ~(x - text_x);
assign offset_y = (y - text_y);

assign pic_ofs_x = (x - pic_x); 
assign pic_ofs_y = (y - pic_y);
assign adr_pic = pic_ofs_x * 120 + pic_ofs_y;

always@(*)
begin
	rgbo = 3'b0; 
	adr_text = 0;
	case ({in_pic, is_char[1], is_char[2], is_char[3], is_char[4], is_char[5]})
	6'b100000:
	begin
	rgbo = {rgb_pic[0], rgb_pic[1], rgb_pic[2]};
	end
	6'b010000:
	begin
		rgbo ={3{font_data[offset_x]}};
		adr_text = 11'h310 + offset_y;
	end
	6'b001000:
	begin
		rgbo ={3{font_data[offset_x]}};
		adr_text = 11'h5F0 + offset_y;
	end
	6'b000100:
	begin
		rgbo ={3{font_data[offset_x]}};
		adr_text = 11'h300 + offset_y;
	end
	6'b000010:
	begin
		rgbo ={3{font_data[offset_x]}};
		adr_text = 11'h5F0 + offset_y;
	end
	6'b000001:
	begin
		rgbo ={3{font_data[offset_x]}};
		adr_text = 11'h380 + offset_y;
	end
	
	endcase
end

/*
assign adr=(x%160)*120+y%120;
assign rgbo= {rgbi[0], rgbi[1], rgbi[2]};

assign r1=(x<320);
assign r2=(y<240);
always @(r1,r2)
begin
case ({r1,r2})
2'b00:
 {r_in,b_in,g_in}=3'b100;
2'b01:
{r_in,b_in,g_in}=3'b010;
2'b10:
{r_in,b_in,g_in}=3'b001;

2'b11:
{r_in,b_in,g_in}=3'b101;

endcase
end
*/

endmodule
