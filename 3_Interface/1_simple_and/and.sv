// interface here
interface and_if;
  logic a,b;
  logic y;
endinterface

//  design code here
module and_gate (and_if inf);
assign inf.y = inf.a & inf.b;
endmodule

//testbanch
module and_tb (and_if inf);

initial begin  

  $display("\n and gate with interface");
  $monitor("input a = %0b, input b = %0b, output y - %0b", inf.a,inf.b,inf.y);
  
#2;
  inf.a = 1'b1;
  inf.b = 1'b0;
#2;
  inf.a = 1'b0;
  inf.b = 1'b1;
#2;
  inf.a = 1'b1;
  inf.b = 1'b1;
  
end
endmodule

//top module
module and_top; 
  
  and_if inf();
  
  and_gate dut(inf);
  and_tb test(inf);
  
endmodule

/*
 and gate with interface
input a = x, input b = x, output y - x
input a = 1, input b = 0, output y - 0
input a = 0, input b = 1, output y - 0
input a = 1, input b = 1, output y - 1
*/

  
