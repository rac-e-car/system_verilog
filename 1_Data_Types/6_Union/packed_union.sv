// Code your testbench here
// or browse Examples
module union_pack;
  
  typedef union packed {
    byte a;
    byte b;
  } p_union_u;
  
  p_union_u u1,u2;

  initial begin
    
    u1.a = {4'hA,4'hB};
    u2.b = {u1.a[5:0],2'b00};
  
    $display ("\n===============packed union=================");
    $display ("The value of the packed union is: %0h %0h %0h\n", u1.a, u1.b, u2.b);
  
  end
endmodule
  
