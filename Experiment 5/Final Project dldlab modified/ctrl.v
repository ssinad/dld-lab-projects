module ctrl(clk, rst, trig, rst_trig, wren, count_fin);
input clk, rst, trig, count_fin;
output reg rst_trig, wren;

reg [1:0] ps, ns;

always @(posedge clk,  posedge rst)
begin
	if (rst)
		ps <= 0;
	else
		ps <= ns;
end

always @(*)
begin
ns <= 0;
case (ps)
	2'b00:
		if (trig)
			ns <= 1;
		else
			ns <= 0;
	2'b01:
		if (count_fin)
			ns <= 2;
		else
			ns <= 1;
	2'd2:
		ns <= 0;
endcase
end

always @(ps)
begin
wren = 0; rst_trig = 0;
case (ps)
	1:
	wren = 1;
	2:
	rst_trig = 1;
endcase
end
endmodule