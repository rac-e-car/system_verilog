module enum_play2;
  
  typedef enum {
    rahman,
    ilayaraja,
    yuvan,
    anirudh,
    harris,
    gvp,
    domyankar,
    sana,
    sean
  } MD_u;
  
  MD_u m1;
  MD_u m2;
  bit [4:0] mm;
  
  initial begin
  
  mm = m1.last() + m2.first();
    $display ("\n===========typedef enum============");
    $display ("\nThe sum of values of the first and last elements called with different inst is %0d", mm); //prints 8
  
  m1 = domyankar;
  m2 = gvp;
  mm = m1.next * m2.prev;
    $display ("The product of two type def elements picked from middle is %0d", mm); //prints 28
  
  end
endmodule
