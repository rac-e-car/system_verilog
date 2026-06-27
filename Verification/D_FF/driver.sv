class driver;
  
  int no_of_transactions;
  virtual dff_inf inf;
  mailbox gen2drive;
  
  function new (virtual dff_inf inf, mailbox gen2drive);
    
    this.inf = inf;
    this.gen2drive = gen2drive;
    
  endfunction
    
    task reset();
      wait(inf.reset);
      $display ("[Driver]---- Reset started");
      inf.d = 0;
      wait(!inf.reset)
      $display ("[Driver]---- Reset ended");
    endtask
    
    task main();
      forever begin
        transaction trans;
        gen2drive.get(trans);
        @(posedge inf.clk);
        inf.d = trans.d;
        @(posedge inf.clk);
        trans.q = inf.q;
        @(posedge inf.clk);
        trans.display("----Driver----");
        no_of_transactions++;
      end
    endtask
    
    endclass
        
      
      
