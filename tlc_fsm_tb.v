`timescale 1ns / 1ps



module tlc_fsm_tb;

	// Inputs
	reg [30:0] Count;
	reg Clk;
	reg Rst;

	// Outputs
	wire [2:0] state;
	wire RstCount;
	wire [1:0] highwaySignal;
	wire [1:0] farmSignal;

	// Instantiate the Unit Under Test (UUT)
	tlc_fsm uut (
		.state(state), 
		.RstCount(RstCount), 
		.highwaySignal(highwaySignal), 
		.farmSignal(farmSignal), 
		.Count(Count), 
		.Clk(Clk), 
		.Rst(Rst)
	);
     
     /*generate clock*/
     always
          #5 Clk = ~Clk;

	initial begin
		// Initialize Inputs
		Clk = 0;
		Rst = 1;
          
          #10;
          Rst = 0; //release reset
          #3000;
          $stop;

	end
     
         /*describe Counter with asyncrhonous reset*/
    always@(posedge Clk )
        if(RstCount)
            Count <= 0;
        else
            Count <= Count + 1;

      
endmodule

