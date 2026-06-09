//rwo dimensional packed array
module packed_in_packed;
  
  bit [2:0] [7:0] asci;
  
  initial begin
    
    asci = {8'h74, 8'h72, 8'h79};
    
    $display("\n=========packed multi dimension==========");
    
    $display(" ");
    
    foreach (asci[i]) begin
      $display("The array's value in element %0d is %0b", i , asci[i]);
    end
    
    $display ("The string value of asci is '%0s'", asci); //prints 'try'
  end
endmodule
