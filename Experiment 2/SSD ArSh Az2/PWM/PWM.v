module PWM(duty, clk_in, out, rst );
	input unsigned [7:0] duty;
	input clk_in, rst;
	output out;
	reg unsigned [7:0]  count; 
	always@(posedge clk_in, posedge rst)
	begin
		if (rst)
			count <= ~8'b0;
		else
			count = count + 8'b1;
	end
	assign out =(count < duty)? 1'b1 : 1'b0;
endmodule