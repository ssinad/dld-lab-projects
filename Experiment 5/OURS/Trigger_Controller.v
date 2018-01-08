module trig(level, sample, slope, mode, rst, clk, trig_en, asghar, norm_trig);
	parameter auto_top = 15;
	input unsigned [7:0] level, sample;
   input slope, mode, rst, clk;
	output trig_en;
	output [19:0] asghar;
	output norm_trig;
	reg unsigned [19:0] asghar;
	reg unsigned [7:0] prev, prev2;
	always@(posedge clk, posedge rst)
		if(rst)
			prev=0;
		else
			prev=sample;
	
	always@(posedge clk, posedge rst)
		if(rst)
			prev2=0;
		else
			prev2=prev;
	
	wire norm_trig = (slope && prev2<level && prev>=level) || (~slope && prev2>level && prev<=level);
	assign trig_en = norm_trig || (mode && asghar == auto_top - 1);//slope(-)=0, slope(+)=1, auto = 1 norm = 0
	always@(posedge clk)
		if(rst || asghar == auto_top - 1 || norm_trig)
			asghar = 0;
		else
			asghar = asghar+1;
endmodule