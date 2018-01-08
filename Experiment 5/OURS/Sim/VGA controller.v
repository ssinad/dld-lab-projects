module VGA_CTRL(R_in, G_in, B_in, clk, rst, x, y, H_sync, V_sync, R_out, B_out, G_out);
input R_in, G_in, B_in, clk, rst;
output H_sync, V_sync, R_out, B_out, G_out;
output [9:0]x, y; 
reg clkp;
reg unsigned [9:0] x,y;
wire AR;
always@(posedge clk, posedge rst)
if(rst)
clkp=1;
else
clkp=~clkp;
assign R_out=(AR)?R_in:0;
assign G_out=(AR)?G_in:0;
assign B_out=(AR)?B_in:0;
assign AR= (x<640 && y<480);
always@(posedge clkp, posedge rst)
if(rst)
x=0;
else if(x==799)
x=0;
else
x=x+1;
always@(posedge clkp, posedge rst)
if(rst)
y=0;
else if(y==524)
y=0;
else if (x==699)
y=y+1;
assign H_sync=!(x<=755 && x>=659);
assign V_sync=!(y<=495 && y>=494);
endmodule
