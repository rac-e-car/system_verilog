// Code your testbench here
// or browse Examples
module cast_data_types;
  
   int i1;
  shortint s1;
  longint l1;
  bit [3:0] b1;
  byte by1;
  
  reg [3:0] r1;
  wire [3:0] w1 = 4'd12;
  real rl1;
  logic [3:0] log1;
  string st1;
  integer ir1;
  
  //next set of variables to store the casted values
  
  int i2;
  shortint s2;
  longint l2;
  bit [3:0] b2;
  byte by2;
  
  reg [3:0] r2;
  wire [3:0] w2 = 4'd12;
  real rl2;
  logic [3:0] log2;
  string st2;
  integer ir2;
  
  initial begin
    
    i1=-45; s1=-10; l1=64'd45555; b1=4'd4; by1=-100;
    r1=4'd12; rl1=44; log1=981; st1="faaaa"; ir1=-98;
      
    #5;    
    $display("\n========values of datatypes BEFORE casting==========");	
    $display("Inintial value of type int = %0d | %0b", i1,i1);
    $display("Inintial value of type short_int = %0d | %0b", s1,s1);
    $display("Inintial value of type long_int = %0d | %0b", l1,l1);
    $display("Inintial value of type bit = %0d | %0b", b1,b1);
    $display("Inintial value of type byte = %0d | %0b", by1,by1);
    $display("Inintial value of type reg = %0d | %0b", r1,r1);
    $display("Inintial value of type wire = %0d | %0b", w1,w1);
    $display("Inintial value of type real = %0d | %0b", rl1,rl1);
    $display("Inintial value of type logic = %0d | %0b", log1,log1);
    $display("Inintial value of type string = %0s | %0b", st1,st1);
    $display("Inintial value of type integer = %0d | %0b", ir1,ir1);
    
    #5;
    i2=string'(i1); 
    s2=-logic'(s1);
    l2=real'(l1); 
    b2=reg'(b1);
    by2=integer'(by1);
    
    r2=shortint'(r1); 
    //w2=reg'(w1);
    rl2=longint'(rl1);
    log2=bit'(log1); 
    st2=byte'(st1); 
    ir2=int'(ir1);
    
    $display("\n========values of datatypes AFTER casting==========");	
    $display("Casted value of type int (to string) = %0s | %0b", i2,i2);
    $display("Casted value of type short_int (logic) = %0d | %0b", s2,s2);
    $display("Casted value of type long_int (real) = %0d | %0b", l2,l2);
    $display("Casted value of type bit (reg) = %0d | %0b", b2,b2);
    $display("Casted value of type byte (integer) = %0d | %0b", by2,by2);
    $display("Casted value of type reg (short_int) = %0d | %0b", r2,r2);
    //$display("Casted value of type wire = %0d | %0b", w2,w2);
    $display("Casted value of type real (long_int) = %0d | %0b", rl2,rl2);
    $display("Casted value of type logic (bit) = %0d | %0b", log2,log2);
    $display("Casted value of type string (byte) = %0d | %0b", st2,st2);
    $display("Casted value of type integer (int) = %0d | %0b", ir2,ir2);
    
    #5;
    $finish;
  end
endmodule
    
    
