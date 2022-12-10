module turnstile_FSM (C,P,clk,reset,y);
//FSM for turnstile
input C,P,clk,reset;
output y;
reg state;
parameter S0=1'b0,S1=1'b1;
// Define the turnstile block
always @(posedge reset or posedge clk)
begin
	if(reset)
		state<=S0; //initial state
	else
		case(state)
			S0: if (C) state <=S1; else state <=S0;
			S1: if (P) state <=S0; else state <=S1;
		endcase
end
// Define output
assign y = state;
endmodule