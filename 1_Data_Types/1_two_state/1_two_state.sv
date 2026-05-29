module state_2;
  
  bit [3:0] bitt;
  byte bytee;
  int intt;
  shortint short_intt;
  longint long_intt;

  
  initial begin
    $display ("The size of the variable bitt = %0d", $bits(bitt) );
    $display ("The size of the variable bytee = %0d", $bits(byte) );
    $display ("The size of the variable intt = %0d", $bits(intt) );
    $display ("The size of the variable long_intt = %0d", $bits(long_intt) );
    $display ("The size of the variable short_intt = %0d", $bits(short_intt) );
    $display ("====================================================");
    //before initialization
    $display ("Default value of the variable bitt = %0d", bitt );
    $display ("Default value of the variable bytee = %0d", bytee );
    $display ("Default value of the variable intt = %0d", intt );
    $display ("Default value of the variable long_intt = %0d", long_intt );
    $display ("Default value of the variable short_intt = %0d", short_intt );
    
    //initializing values
    #10;
    bitt = 1;
    bytee = 254;
    intt = -456;
    short_intt = 512;
    long_intt = "OkkaalaOlii...";    
    
    $display ("====================================================");
    $display ("Initialized value of the variable bitt = %0d", bitt );
    $display ("Initialized value of the variable bytee = %0d", bytee );
    $display ("Initialized value of the variable intt = %0d", intt );
    $display ("Initialized value of the variable long_intt = %0d", long_intt );
    $display ("Initialized value of the variable short_intt = %0d", short_intt );
    
    #20; $finish;
    
    
    
              end
              endmodule
