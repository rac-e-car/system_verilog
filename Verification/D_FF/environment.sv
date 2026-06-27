class environment;
  
  generator gen;
  driver dri;
  monitor mon;
  scoreboard scb;
  
  virtual dff_inf inf;
  
  mailbox gen2drive;
  mailbox mon2scb;
  
  function new (virtual dff_inf inf);
 
  this.inf = inf;
    
  gen2drive = new();
  mon2scb = new();
  
    gen = new(gen2drive);
    dri = new(inf, gen2drive);
    mon = new(inf, mon2scb);
    scb = new(mon2scb);
    
  endfunction
  
  task pre_test();
    dri.reset();
  endtask
  
  task test();
    fork
    gen.main();
    dri.main();
    mon.main();
    scb.main();
    join_any
  endtask
  
  task post_test();
    wait(gen.ended.triggered);
    wait(gen.repeat_count == dri.no_of_transactions);
    wait(gen.repeat_count == scb.no_of_transactions);
  endtask
  
  task run();
    pre_test();
    test();
    post_test();
    $finish;
  endtask
  
endclass
    
  
