program test(dff_inf inf);
  
  environment env;
  
  initial begin
    
  env = new(inf);
    env.gen.repeat_count = 4;
    env.run();
  end
  
endprogram
  
