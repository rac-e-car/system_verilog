module array_packed;
  
  bit [3:0] a;
  logic [7:0] b;
  reg [15:0] c;
  
  initial begin
    
    a = 4'd12;
    b = 8'hA4;
    c = 16'hBEEF;
    
    $display ("\n============packed array============");
    
    foreach (a[i]) begin
      $display ("The value from the array 'a' element %0d is %0b", i , a[i]);
    end
    
    $display(" ");
    
    foreach (b[i]) begin
      $display ("The value from the array 'b' element %0d is %0b", i , b[i]);
    end
    
    $display("");
    
    foreach (c[i]) begin
      $display ("The value from the array 'c' element %0d is %0b", i , c[i]);
    end
    
  end
endmodule
