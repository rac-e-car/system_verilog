// Code your testbench here
// or browse Examples
typedef struct packed {
  logic [7:0] quantity;
  bit [39:0] snack_name;
  bit [15:0] consumed;
} snack_time_s;



 module packed_struct;
  
    snack_time_s theeni;
      
      initial begin
    
    theeni.quantity = 5;
    theeni.snack_name = "Bytes";
    theeni.consumed = 3;
    
        $display("\n========norukku theeni nostalgia========");
    $display("\n---packed array with typedef---");
        $display("snack time --> snack name: %0s", theeni.snack_name);
        $display("snack time --> snack quantity bought: %0d", theeni.quantity);
        $display("snack time --> snack consumed: %0d", theeni.consumed);
        $display("snack time --> snack total size: %0d", $bits(theeni) );  
  end
endmodule
