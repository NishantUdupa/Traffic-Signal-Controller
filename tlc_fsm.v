`timescale 1ns / 1ps
`default_nettype none

// This is a behavioral description of the 
// traffic light controller FSM

module tlc_fsm(
    output reg [2:0] state, // output for debugging
    output reg RstCount, // use an always block
    /* another always block for these as well */
    output reg [1:0] highwaySignal, farmSignal, 
    input wire [30:0] Count, // n = 31 as computed earlier
    input wire Clk, Rst // clock and reset
);

	// define states    
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101,
              Srst = 3'b110;
			  
	// define light colors
    parameter green = 2'b00,
              yellow = 2'b01,
              red = 2'b10;
    
    // determine intermediate nets
    reg[2:0] nextState;
              
    // finite state logic
    always@(state or Count)
    case(state)
        Srst: begin
                nextState = S0;
            end
        S0: begin
                if(Count == 50000000)
                    nextState = S1; // go to next state
                else 
                    nextState = S0; // return to state
            end
        S1: begin
                if(Count == 1500000000)
                    nextState = S2; // go to next state
                else 
                    nextState = S1; // return to state
            end
        S2: begin
                if(Count == 150000000)
                    nextState = S3; // go to next state
                else
                    nextState = S2; // return to state
            end
        S3: begin
                if(Count == 50000000)
                    nextState = S4; // go to next state
                else
                    nextState = S3; // return to state
            end
        S4: begin
                if(Count == 750000000)
                    nextState = S5; // go to next state
                else
                    nextState = S4; // return to state
            end
        S5: begin
                if(Count == 150000000)
                    nextState = S0; // go to next state
                else
                    nextState = S5; // return to state
            end
        default: begin
                    nextState = S0; //start at state s0
                end
    endcase
    
    // logic for output signals
    always@(state or Count)
        case(state)
            Srst: begin
                    highwaySignal = red;
                    farmSignal = red;
                    RstCount = 1;
                  end
            S0: begin 
                    highwaySignal = red;
                    farmSignal = red;
                    if(Count == 50000000)
                        RstCount = 1;   // counter is reset
                    else 
                        RstCount = 0;
                end
            S1: begin 
                    highwaySignal = green;
                    farmSignal = red;
                    if(Count == 1500000000)
                        RstCount = 1;   // counter is reset
                    else 
                        RstCount = 0;
                end
            S2: begin 
                    highwaySignal = yellow;
                    farmSignal = red;
                    if(Count == 150000000)
                        RstCount = 1;   // counter is reset
                    else 
                        RstCount = 0;
                end
            S3: begin 
                    highwaySignal = red;
                    farmSignal = red;
                    if(Count == 50000000)
                        RstCount = 1;   // counter is reset
                    else 
                        RstCount = 0;
                end
            S4: begin 
                    highwaySignal = red;
                    farmSignal = green;
                    if(Count == 750000000)
                        RstCount = 1;   // counter is reset
                    else 
                        RstCount = 0;
                end
            S5: begin 
                    highwaySignal = red;
                    farmSignal = yellow;
                    if(Count == 150000000)
                        RstCount = 1;   // counter is reset
                    else 
                        RstCount = 0;
                end
            default: begin
                        highwaySignal = red; //set initial light colors
                        farmSignal = red; 
                        RstCount = 1;  //counter is reset
                     end
        endcase
        
    // synchronous logic for holding the state
    always@(posedge Clk)
        if(Rst) // if rst is 1, state is reset
            state <= Srst;
        else
            state <= nextState; // if rst = 0, go to next state
                
endmodule //end the module