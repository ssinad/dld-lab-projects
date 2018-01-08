module Square(clk, rst, out);
	input clk, rst; 
	output unsigned [7:0] out;
	reg unsigned[18:0] count;
	
	always@(posedge clk, posedge rst)
	begin
		if (rst)
			count <= 19'b0;
		else
			count <= count + 19'b1;
	end
	assign out = count[18:11];
	endmodule