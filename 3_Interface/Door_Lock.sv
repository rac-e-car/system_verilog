
//==============interface==============

interface lock_inf #(parameter N=16);
  
  //declare signals for DUT TB connection
  
  //input signals
  logic [3:0] enter;
  logic enter_valid;
  
  //control signals
  logic clk, reset;
  
  //output signals
  logic unlock, alarm;

  
    //clocking block
  clocking cb @(posedge clk);
    default input #1step output #0;
    
    input alarm, unlock;
    output reset, enter, enter_valid;
        
  endclocking
  
  //functions (for testbench to check status)
  function bit is_unlocked();
    return unlock;
    $display("=== UNLOCKED ===");
  endfunction
  
  function bit is_alarm();
    return alarm;
    $display("/// ALARM ON ///");
  endfunction
  
  //task (for testbench to drive digits)
  //task enter_digit(input logic [3:0] digit, output logic [3:0] e);
  
  task enter_digit(input logic [3:0] digit);
  	cb.enter <= digit;
    cb.enter_valid <= 1;
    @(cb);
    cb.enter_valid <= 0;
  endtask
  
  //modoports
  modport dut(input reset, clk, enter, enter_valid, output alarm, unlock);
  modport tb (clocking cb);
  
endinterface


//=================testbench=====================
    module alarm_tb (lock_inf.tb inf);
      
      lock_inf intf();
      
      lock_dut dut_pass (intf);
      alarm tb_pass (intf);
      
      initial begin
        $display("\n++++ Lock Powered ON ++++");
        
        inf.clk = 0;
  forever #5 inf.clk = ~inf.clk;
      end
      
      initial begin
        
        inf.reset = 1;
        
      #10;
        inf.reset = 0;
      #10; 
        inf.enter_valid = 1;
        inf.enter_digit(4'hA);
        inf.enter_digit(4'h4);
        inf.enter_digit(4'hD);
        inf.enter_digit(4'h9);
        
      end
    endmodule
        
//===========================================================
    
//========Design code for password lock

module lock_dut (lock_inf.dut inf);
  
  reg [15:0] valid_password = 16'hA4D9;
  reg [15:0] enter_password;
  reg [1:0] failed_count;
  reg [2:0] digit_count;
  
  always_ff @(posedge inf.clk) begin
    if(inf.reset) begin
      enter_password <= 0;
      inf.unlock <= 0 ;
      inf.alarm <= 0;
      failed_count <= 0;
      digit_count <= 0;
    end
    
    else if(inf.enter_valid) begin
      
      if(digit_count < 4) begin
      enter_password <= enter_password << 4 | inf.enter;
      digit_count <= digit_count + 1;
      end
    end
      
    if(digit_count == 4) begin
        
      if(enter_password == valid_password) begin
        inf.unlock <= 1;
        failed_count <= 0;
      end 
        
        else begin
          failed_count <= failed_count+1;
          
          if(failed_count == 2)
          	inf.alarm <= 1;
        end
      end
       digit_count <= 0;
       enter_password <= 0;
    end
        
  
endmodule
