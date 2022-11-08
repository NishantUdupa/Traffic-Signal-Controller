`timescale 1ns / 1ps

/* This module describes the top level traffic
   light controller module discussed in lab 11 */

module tlc_controller(
    output wire [1:0] highwaySignal, farmSignal, // connected to LEDs
    // output state for debugging
    output wire [3:0] JB,
    input wire Clk,
    // buttons provide input to our top level circuit
    input wire Rst, // use as reset
    input wire farmSensor // farmSensor for pt 2
);

// declare intermediate nets
wire RstSync;
wire RstCount;
reg [30:0] Count;
assign JB[3] = RstCount;

// instantiate the synchronizer module to synchronize the button inputs
synchronizer syncRst(RstSync, Rst, Clk);

// instantiate the FSM module
tlc_fsm FSM(
    .state(JB[2:0]), // state is wired up to JB
    .RstCount(RstCount),
    .highwaySignal(highwaySignal),
    .farmSignal(farmSignal),
    .Count(Count),
    .Clk(Clk),
    .Rst(RstSync),
    .farmSensor(farmSensor)
);

// describe Counter with a synchronous reset
always@(posedge Clk)
    begin
        if(RstCount)
            Count <= 0;
        else
            Count <= Count + 1;
    end

endmodule