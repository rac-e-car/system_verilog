// Code your testbench here
// or browse Examples
module enum_play;
  
  enum {
    badam,
    pista,
    mundhiri,
    kadalai,
    paruppu,
    payiru,
    masala,
    maavu,
    oil
  } maligai_list;
  
  initial begin
    
  $display ("\n==========maligai list using enum==========\n");
  
  maligai_list.first();
  
    for (integer i=0; i<9; i++) begin
    
    $display ("the default value of %0s is %0d", maligai_list.name(), maligai_list );
    maligai_list = maligai_list.next();
    
  end
  end
endmodule
