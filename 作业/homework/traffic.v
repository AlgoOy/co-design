module traffic(clk,reset,nslight,ewlight,count);
	input clk,reset;
	output nslight,ewlight,count;
	reg [1:0] state;
	reg [5:0] count;
	reg [2:0] nslight,ewlight;
	parameter SYEW=2'b00,SNS=2'b01,SYNS=2'b10,SEW=2'b11;
	parameter R=3'b100,Y=3'b010,G=3'b001;
	always @(posedge clk)begin
	if(reset)begin count<='d0;state<=SYEW;nslight<=Y;ewlight<=Y;end
	else case(state)
		SYEW:begin
			if(count == 'd0)begin count<='d40;state<=SNS;nslight=G;ewlight=R;end
			else begin count<=count-1;nslight=R;ewlight=Y;end
		end
		SNS:begin
			if(count == 'd5)begin count<=count-1;state<=SYNS;nslight=Y;ewlight=R;end
			else begin count<=count-1;nslight=G;ewlight=R;end
		end
		SYNS:begin
			if(count == 'd0)begin count<='d30;state<=SEW;nslight=R;ewlight=G;end
			else begin count<=count-1;nslight=Y;ewlight=R;end
		end
		SEW:begin
			if(count == 'd5)begin count<=count-1;state<=SYEW;nslight=R;ewlight=Y;end
			else begin count<=count-1;nslight=R;ewlight=G;end
		end
	endcase
	end
endmodule
