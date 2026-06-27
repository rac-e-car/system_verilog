`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "random_test.sv"

module tb_top;
  
  bit reset, clk;
  
  always #5 clk = ~clk;
  
  initial begin
    reset = 1;
    #5;
    reset = 0;
  end
  
  dff_inf inf(clk,reset);
  
  test t1 (inf);
  
  d_ff dut (inf.dut);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
