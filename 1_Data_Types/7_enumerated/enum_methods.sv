module enum_play;
  
  enum {
    badam = 2,
    pista,
    mundhiri,
    kadalai,
    paruppu = 8,
    payiru,
    masala,
    maavu = 13,
    oil
  } maligai_list;
  
  initial begin
    
    $display ("\n==========maligai list using enum methods==========\n");
    
    maligai_list = maligai_list.first();
    $display("The first element and value of maligai list is %0d | %0s", maligai_list.first(),maligai_list );
    
    maligai_list = maligai_list.last();
    $display("The last element and value of maligai list is %0d | %0s", maligai_list.last(), maligai_list );
    
    maligai_list = payiru;
    maligai_list = maligai_list.next();
    $display("The next element and value of maligai list is %0d | %0s", maligai_list.next(), maligai_list );
    
    maligai_list = maligai_list.prev();
    $display("The previous element and value of maligai list is %0d | %0s", maligai_list.prev(), maligai_list );
    
    maligai_list = pista;
    $display("The current element and value of maligai list is %0s | %0d", maligai_list.name(), maligai_list );

  end
endmodule
    
