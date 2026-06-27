class monitor;
  
  virtual dff_inf inf;
  mailbox mon2scb;
  
  function new (virtual dff_inf inf, mailbox mon2scb);
    this.inf = inf;
    this.mon2scb = mon2scb;
  endfunction
  
  task main();
    forever begin
    transaction trans;
    trans = new();
    @(posedge inf.clk);
    trans.d = inf.d;
    @(posedge inf.clk);
    trans.q = inf.q;
      @(posedge inf.clk);
    mon2scb.put(trans);
    trans.display("--------Monitor--------");
    end
  endtask
  
endclass
