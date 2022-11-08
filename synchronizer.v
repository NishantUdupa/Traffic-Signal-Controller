/*This module provides the synchronization   *
 *necessary to prevent metastability when    *
 *transitioning from an asynchronous to a    *
 *synchronous domain. In other words, when   *
 *we bring an input signal in from the FPGA  *
 *board into a clocked domain, we must do    *
 *this buffering!                            */
 `timescale 1ns /1ps
module synchronizer(
     output wire OutSignal, 
     input wire InSignal, 
     input wire Clk
);

     /*intermediate nets*/
     reg buff0, buff1, buff2;
     
     always@(posedge Clk)
            begin
               buff0 <= InSignal;
               buff1 <= buff0;
               buff2  <= buff1;
            end
      
     assign OutSignal = buff2;
    
endmodule