`timescale 1ns/100ps
module traffic_tb;
	reg clk,reset;
	wire [2:0] nslight,ewlight;
	wire [5:0] count;
	always #10 clk=~clk;
	initial begin
		clk=0;
		reset=0;
		#20 reset=1;
    		#20 reset=0;
	end
	traffic
	traffic(.clk(clk),.reset(reset),.nslight(nslight),.ewlight(ewlight),.count(count));
endmodule