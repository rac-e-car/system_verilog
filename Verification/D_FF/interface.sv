interface dff_inf (input bit clk, reset);
  
  //declaring the signals
  logic d;
  logic q;
  
  //clocking block
  clocking cb @(posedge clk);
    default input #1step output #1;
    input q;
    output d;
  endclocking
  
  //modports  
  modport dut (input clk, reset, d, output q);
  modport tb (input q, output d);
  
endinterface
