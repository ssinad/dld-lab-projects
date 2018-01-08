module DigFuncGen(sel, clk, rst, out);
	input clk, rst; 
	input [2:0] sel;
	output unsigned [7:0] out;
	reg unsigned [7:0] out;
	reg unsigned[7:0] count;
	
	always@(posedge clk, posedge rst)
	begin
		if (rst)
			count <= 8'b0;
		else
			count <= count + 8'b1;
	end
	
	reg signed[15:0]  sin_n_1, cos_n_1, sin_n_2, cos_n_2;
	wire signed[15:0]  sin_n, cos_n;
	
	always@(posedge clk, posedge rst)
	begin
		
		if (rst)
			sin_n_1 <= 16'd510;
		else
			sin_n_1 <= sin_n;
	end
	
	always@(posedge clk, posedge rst)
	begin

		if (rst)
			sin_n_2 <= 16'd0;
		else
			sin_n_2 <= sin_n_1;
	end
	
	always@(posedge clk, posedge rst)
	begin
		
		if (rst)
			cos_n_1 <= 16'd29700;
		else
			cos_n_1 <= cos_n;
	end
	
	always@(posedge clk, posedge rst)
	begin
		if (rst)
			cos_n_2 <= 16'd30000;
		else
			cos_n_2 <= cos_n_1;
	end
	
	assign sin_n = sin_n_2 + {cos_n_1[15], cos_n_1[15], cos_n_1[15], cos_n_1[15], cos_n_1[15], cos_n_1[15:5]};
	assign cos_n = cos_n_2 - {sin_n_1[15], sin_n_1[15], sin_n_1[15], sin_n_1[15], sin_n_1[15], sin_n_1[15:5]};
	
	always @(*)
		begin
			out <= count;
			case (sel)
			3'b0:
				out <= sin_n[15:8] + 8'd128;
			3'b1:
				out <= {8{count[0]}};
			3'b010:
				;	
			3'b011:
				out <= count;
			3'b100:
				;
			default:
				out <= count;
			endcase
		end
	endmodule