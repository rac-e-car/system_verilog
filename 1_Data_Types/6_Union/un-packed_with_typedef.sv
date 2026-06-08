  module union_party;  

typedef union {
    int reg_no;
    bit[3:0] value;
    logic [3:0] nos;
} union_u;
    
    union_u o1;
    
    initial begin
      
    #5;
      o1.reg_no = 32'hBBBB_CCCC;
      $display("\nThe values half initialized is %0h", o1.reg_no);
      $display("lower 4 bits 1 is %0h",o1.nos);
      $display("lower 4 bits 2 is %0h",o1.value);
      
      #5;
      //operation_override.value = "truce";
      //operation_override.nos = 4;
      
      o1.value = 4'hA;
      o1.nos = 4'hA;
      $display("\n=====Un-Packed union=====");
      $display("The values of the unpacked union is %0h", o1.reg_no);
      $display("The lower bits of this union 1 is %0h", o1.value);
      $display("The lower bits of this union 2 is %0h", o1.nos);
    end 
  endmodule
