module sequence_mealy(zero,one,clk,reset,out);
	input zero,one,clk,reset;
	output out;
	reg [1:0] state,nstate;
	reg out;
	parameter S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
	always @(zero or one or state or reset)
	if(reset)begin nstate<=S0;out<=0;end 
	else case(state)
		S0:begin
			out<=0;
			if(zero) nstate<=S0;
			else if(one) nstate<=S1;
			else nstate<=S0;
		end
		S1:begin 
			out<=0;
			if(zero) nstate<=S0;
			else if(one) nstate<=S2;
			else nstate<=S1;
		end
		S2:begin
			if(zero)begin out<=0;nstate<=S0;end
			else if(one)begin out<=1;nstate<=S3;end
			else nstate<=S2;
		end
		S3:begin
			if(zero)begin out<=0;nstate<=S0;end
			else if(one)begin out<=1;nstate<=S3;end
			else nstate<=S3;
		end
	endcase 
	always @(posedge clk) state<=nstate;
endmodule 