module final_module(
CLOCK_50, 
SW0, 
SW1, 
PB,
VGA_HS,
VGA_VS,
VGA_R,
VGA_G,
VGA_B
);

input CLOCK_50;
input [7:0] SW0, SW1;
input [0:0] 
PB;
output VGA_HS,
VGA_VS,
VGA_R,
VGA_G,
VGA_B;
//oscilloscpoe( clk, rst,		 slope, mode, 	sel,		 level, time_per_div, volt_per_div, R_out, B_out, G_out, H_sync, V_sync);
oscilloscope(CLOCK_50, SW0[0], SW0[1], SW0[2], 0, SW1[7:0], SW0[4:3], SW0[6:5], VGA_R, VGA_B, VGA_G, VGA_HS, VGA_VS);
endmodule