module ADC(CLOCK_50, SW0, SW1, IN, OUT, HEX, CATHODE, LEDG, LEDR );

input CLOCK_50;
input [0:0] SW0;
input [7:0] SW1;
input[9:9] IN;
output[7:7] OUT;

wire rst, compare, pwm_out;

assign rst = SW0[0];
assign compare = IN[9];
assign OUT[7] = pwm_out;


wire [7:0] disp_out, bs_out, dummy;
wire [7:0] H_out, T_out, O_out;
wire [3:0] H, T, O;
reg [14:0] count;
wire[1:0] Sel;

output [7:0] HEX, LEDG, LEDR;
output [3:0] CATHODE;

ADC_bin adc(CLOCK_50, rst, compare, pwm_out, bs_out, disp_out/*, disp_out*/);
bin2bcd b2b({disp_out, 1'b0}, H, T, O);

bin2ss hc(H, H_out[6:0]);
bin2ss tc(T, T_out[6:0]);
bin2ss oc(O, O_out[6:0]);

assign H_out[7] = 1'b1;
assign T_out[7] = 1'b0;
assign O_out[7] = 1'b0;
assign LEDR[7] = compare;
assign LEDG = bs_out;
//assign disp_out = SW1;

always @(posedge CLOCK_50, posedge rst)
begin
	if (rst)
		count <= 15'd0;
	else
		count <= count + 15'd1;
end

assign Sel = count[14:13];

switcher sw( Sel, O_out, T_out, H_out, HEX, CATHODE);

endmodule