module vender_moore(J,Y,clk,reset,open);
//Moore FSM for a vender
input J,Y,clk,reset;
output open;
reg [2:0] state;
parameter S0=3'b000,S5=3'b001,S10=3'b010,S15=3'b011,S20=3'b100;
//Define the vender block
always @(J or Y or state or reset)
	if(reset) state<=S0;
	else
		case(state)
			S0:if(J) state<=S5;
				else if(Y) state<=S10;
				else state<=S0;
			S5:if(J) state<=S10;
				else if(Y) state<=S15;
				else state<=S5;
			S10:if(J) state<=S15;
				else if(Y) state<=S20;
				else state<=S10;
			S15:state<=S15;
			S20:state<=S20;
		endcase
//Define output during S3
assign open=(state==S15|| state==S20);
endmodule