module trig_ctrl(level, sample, slope, mode, rst, clk, rst_trig, trigger);
	parameter auto_top = 1000000;
	input unsigned [7:0] level, sample;
   input slope, mode, rst, clk;

	reg unsigned [19:0] asghar;
	reg unsigned [7:0] prev, prev2;
	output reg trigger;
	input rst_trig;
	
	always@(posedge clk, posedge rst)
		if(rst)begin
			prev=0;
			prev2=0;
			end
		else
		begin
			prev<=sample;
			prev2 <= prev;
	end
	
	always@(posedge clk, posedge rst_trig, posedge rst)
		if(rst_trig || rst)begin
			trigger = 0;
			end
		else if (trig_en)
		begin
			trigger = 1;
	end
	wire trig_en;
	
	wire norm_trig = (slope && prev2<=level && prev>level) || (!slope && prev2>level && prev<=level);
	assign trig_en = norm_trig || (mode && asghar == auto_top - 1);//slope(-)=0, slope(+)=1, auto = 1 norm = 0
	always@(posedge clk)
		if(rst || asghar == auto_top - 1 || norm_trig)
			asghar=0;
		else
			asghar=asghar+1;
endmodule