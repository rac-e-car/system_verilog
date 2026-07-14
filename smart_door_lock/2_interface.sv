// ==============================================================
// ==========================INTERFACE===========================
// ==============================================================

interface lock_inf 
  #(parameter int DIGIT_WIDTH = 4,
    parameter int NUM_DIGITS = 4
   ) 
  (input bit clk);
  
  localparam int PASSWORD_WIDTH = DIGIT_WIDTH * NUM_DIGITS;
  	
  //declare signals
  
  logic enter_valid;
  logic [DIGIT_WIDTH-1:0] enter;
  logic reset;
  logic unlock, alarm;
  
  //clocking block
  
  clocking cb @(posedge clk);
    default input #1step output #1;
    
    input unlock, alarm;
    output reset, enter_valid, enter;
  endclocking
  
  //declaring modports
  
  modport dut(input clk, enter_valid, enter, reset, 
              output unlock, alarm);
  
  modport tb(clocking cb, input clk);
  
  //function to get the nibble
  
    function automatic logic [DIGIT_WIDTH-1:0] get_nibble 
      (input logic [PASSWORD_WIDTH-1:0] pwd,
    input int i);
      return pwd[i*DIGIT_WIDTH +: DIGIT_WIDTH];
  endfunction
    
  //task to get the pwd digit, 
    task automatic get_digit (input logic [DIGIT_WIDTH-1:0] digit);
      @(negedge clk);
      enter<=digit;
      enter_valid<=1;
      @(posedge clk);
      
      @(negedge clk);
      enter_valid<=0;
    endtask
    
    //to get the password
    
    task automatic send_pwd (input logic [PASSWORD_WIDTH-1:0] pwd);
      for(int i=NUM_DIGITS-1; i>=0; i--)
        get_digit(get_nibble (pwd,i) );
      @(posedge clk);
      @(posedge clk);
    endtask
    
    //reset task
    
    task automatic reset_begin ();
      @(negedge clk);
      reset <= 1;
      enter_valid <= 0;
      
      @(posedge clk);
      @(negedge clk);
      reset <= 0;
      @(posedge clk);
    endtask
    
    endinterface
