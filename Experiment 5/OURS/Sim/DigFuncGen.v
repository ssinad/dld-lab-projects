module DigFuncGen(sel, clk, rst, out);
	input clk, rst; 
	input [2:0] sel;
	output unsigned [7:0] out;
	reg unsigned [7:0] out;
	reg unsigned[7:0] count;
	reg [14:0] address;
	
	always@(posedge clk, posedge rst)
	begin
		if (rst)
			address <= 15'b0;
		else
			address <= address + 15'b1;
	end
	
	
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
	
	reg ud;
	reg[7:0] tri_count;
	always @(posedge clk, posedge rst)
	begin
		if (rst)
			ud = 1;
		else if ((ud && tri_count == 8'd252 ) || (!ud && tri_count == 8'd2 ))
		ud = ~ud;
	end
	always @(posedge clk, posedge rst)
	begin
		if (rst)
			tri_count <= 8'b0;
		else if (ud)
			tri_count <= tri_count + 8'd2;
		else
			tri_count <= tri_count - 8'd2;
	end

	
	always @(*)
		begin
			out <= count;
			case (sel)
			3'b0:
				out <= {~sin_n[15], sin_n[14:8]};
			3'b1:
				out <= {8{count[0]}};
			3'b010:
				out <= tri_count;	
			3'b011:
				out <= count;
			//3'b100:
			//	out <= mem_data;
			default:
				out <= count;
			endcase
		end
	endmodule