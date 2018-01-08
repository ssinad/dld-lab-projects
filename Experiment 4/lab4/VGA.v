module VGA(VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B, CLOCK_50, SW0);
input CLOCK_50;
input [7:0] SW0;
output VGA_HS, VGA_VS, VGA_R, VGA_G, VGA_B;
wire r1, r2;
wire r_in, g_in, b_in;
wire[9:0] x,y;

wire[14:0] adr;
wire[2:0] rgbi;
asghar img_mem(
	adr_pic,
	!CLOCK_50,
	rgb_pic);

	wire[7:0] font_data;
	wire[10:0] adr_text;
	wire [2:0] rgb_pic;
	wire[14:0] adr_pic;
	
font_rom (!CLOCK_50, adr_text, font_data);
RGB_GEN rgen(x, y, rgb_pic, {r_in, g_in, b_in}, adr_pic, adr_text, font_data);


VGA_CTRL ins1(r_in, g_in, b_in, CLOCK_50, SW0[7], x, y, VGA_HS,  VGA_VS, VGA_R, VGA_B, VGA_G);
endmodule
