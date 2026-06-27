class transaction;
  
  rand bit d;
  bit q;
  
  
  function void display (string name);
    $display("%s",name);
    $display("----------------------");
    $display("d = %0b",d);
    $display("----------------------");
    $display("q = %0b",q);
    $display("----------------------");
  endfunction
endclass
    
