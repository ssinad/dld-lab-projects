module BinarySearch( clk, rst, middle, out, compares);
	input clk, compares, rst;
	output reg [7:0] out;
	output[7:0] middle;
	wire done;
	reg unsigned [7:0] upper_bound, lower_bound;
	
	always @(posedge rst, posedge clk)
		begin
			if (rst)
				out <= 8'd127;
			else if (done)
				out <= middle;
		end
	
	assign middle = {1'b0, upper_bound[7:1]} + {1'b0, lower_bound[7:1]};	
	
	always @(posedge rst, posedge clk)
		begin
			if (rst)
				upper_bound <= ~8'b0;
			else if(done)
				upper_bound <= ~8'b0;
			else if (!compares)
				upper_bound <= middle;
		end
	
	always @(posedge rst, posedge clk)
		begin
			if (rst)
				lower_bound = 8'b0;
			else if(done)
				lower_bound = 8'b0;
			else if (compares)
				lower_bound = middle;
		end
		
	assign done = (lower_bound + 8'd1 == upper_bound) || (lower_bound + 8'd2 == upper_bound);
	
endmodule