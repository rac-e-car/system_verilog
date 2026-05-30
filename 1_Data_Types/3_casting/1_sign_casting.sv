// Code your testbench here
// or browse Examples
module sign_casting;
  
  logic signed [7:0] sign1;
  logic unsigned [7:0] unsign1;
  
  logic signed [7:0] sign2;
  logic [7:0] unsign2;
  
  initial begin
  
  sign1 = -124;
  unsign1 = 24;
  
  $display ("\n==========original value============");
  $display ("Original value of signed number = %0d %0b", sign1,sign1);
    $display ("Original value of unsigned number = %0d %0b", unsign1,unsign1);
  
  #5;
  
  sign2 = signed'(unsign1);
  unsign2 = unsigned'(sign1);
  
  $display ("============casted sign value========= ");
  $display ("Unsigned to signed no. = %0d %0b", sign2,sign2);
    $display ("Signed to unsigned no. = %0d %0b", unsign2,unsign2);
  
  #5;
  $finish;
  end
endmodule
