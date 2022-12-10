module sequence_moore(zero,one,clk,reset,out);
	input zero,one,clk,reset;
	output out;
	reg [1:0] state;
	parameter S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
	always @(posedge zero or posedge one or posedge state or posedge reset)
	if(reset) state<=S0;
	else
		case(state)
			S0:if(zero) state<=S0;
				else if(one) state<=S1;
					else state<=S0;
			S1:if(zero) state<=S0;
				else if(one) state<=S2;
					else state<=S1;
			S2:if(zero) state<=S0;
				else if(one) state<=S3;
					else state<=S2;
			S3:if(zero) state<=S0;
				else if(one) state<=S3;
					else state<=S3;
		endcase
	assign out=(state==S3)?1:0;
endmodule 