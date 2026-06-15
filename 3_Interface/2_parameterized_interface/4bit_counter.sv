//interface block

interface count_itf #(parameter N=4);
  
  logic clk, reset;
  logic [N-1:0] counter;
  
  modport count_des 
  (
    input clk, reset,
    output counter
    );
  
  modport count_tbe
  (
    input  counter,
    output clk,reset
    );
  
endinterface

//design block
module counter_4 (count_itf.count_des inf);
  
  always @(posedge inf.clk) begin  
    if (inf.reset)
      inf.counter <= 0;
      else
    inf.counter <= inf.counter + 1;
  end

endmodule

//testbench block

module count_tb (count_itf.count_tbe inf);
  initial begin
    $display ("=========counter with parameterized interface============");
    
    $monitor ("The counter's value at %0t is %0d", $time, inf.counter);
    
    inf.clk = 0;
    forever #5 inf.clk = ~inf.clk;
  end
  
  initial begin
    
    inf.reset = 1;
#10;
    inf.reset = 0;
   
#170;
	$finish;
  end
endmodule

//top module for counter
module top_count;
  count_itf inf();
  
  counter_4 dut (inf);
  
  count_tb tb (inf);
  
endmodule

/* output
=========counter with parameterized interface============
The counter's value at 0 is x
The counter's value at 5 is 0
The counter's value at 15 is 1
The counter's value at 25 is 2
The counter's value at 35 is 3
The counter's value at 45 is 4
The counter's value at 55 is 5
The counter's value at 65 is 6
The counter's value at 75 is 7
The counter's value at 85 is 8
The counter's value at 95 is 9
The counter's value at 105 is 10
The counter's value at 115 is 11
The counter's value at 125 is 12
The counter's value at 135 is 13
The counter's value at 145 is 14
The counter's value at 155 is 15
The counter's value at 165 is 0
The counter's value at 175 is 1
$finish called from file "testbench.sv", line 40.
$finish at simulation time                  180 
*/


