class scoreboard;
  
  int no_of_transactions;
  mailbox mon2scb;
  
  function new (mailbox mon2scb);
		this.mon2scb = mon2scb;
  endfunction
  
  task main();
    transaction trans;
    forever begin
      mon2scb.get(trans);
      if(trans.q == trans.d)
        $display("Expected results match");
      else
        $error("Results dont match | exp(%0d)|actual(%0d) |", trans.d, trans.q);
      no_of_transactions++;
      
      trans.display("-----scoreboard------");
    end
  endtask
endclass
      
