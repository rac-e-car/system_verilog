
  union {
    int reg_no;
    bit[39:0] value;
    logic [3:0] nos;
  } operation_override;
  
  module union_party;
    
    initial begin
      
    #5;
      operation_override.reg_no = -123;
      $display("\nThe values half initialized by me hehe is %0p", operation_override);
      
      #5;
      operation_override.value = "truce";
      operation_override.nos = 4;
      
      $display("\n=====Un-Packed union=====");
      $display("The values of the unpacked union is %0p", operation_override);
      $display("The size of this unpacked union is %0d", operation_override);
      
    end 
  endmodule
