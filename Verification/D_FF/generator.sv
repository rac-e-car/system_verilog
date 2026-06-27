class generator;
  
  rand transaction trans;
  int repeat_count;
  mailbox gen2drive;
  event ended;
  
  function new (mailbox gen2drive);
    this.gen2drive = gen2drive;
  endfunction
    
    task main();
      
      repeat (repeat_count) begin
        trans = new();
        
        if(!trans.randomize() ) $fatal("Gen/Driv randomization failed");
        trans.display("Generator");
        gen2drive.put(trans);
      end
      -> ended;
    endtask
  
endclass
        
        
        
