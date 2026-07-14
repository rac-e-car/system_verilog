// =============================================================
// =============================DESIGN==========================
// =============================================================


module lock_dut #(parameter int MAX_FAILS = 3) (lock_inf.dut inf);
  
  localparam int PASSWORD_WIDTH = inf.NUM_DIGITS * inf.DIGIT_WIDTH;
  localparam int FAIL_CNT = ($clog2(MAX_FAILS +1) );
  localparam int DIGIT_CNT = ($clog2(inf.NUM_DIGITS +1) );
  
  localparam logic [PASSWORD_WIDTH-1:0] valid_pwd = 16'hE1C8;
  
  typedef enum logic [1:0] {
    PHA_COLLECT = 2'b00,
    PHA_EVAL = 2'b01,
    PHA_ALARM = 2'b10 
  } phase_lock;
  
  typedef struct packed {
    logic [PASSWORD_WIDTH-1:0] enter_pwd;
    logic [FAIL_CNT:0] c_fail;
    logic [DIGIT_CNT-1:0] c_digit;
  } lock_regs;
  
  phase_lock phase;
  lock_regs lr;
  
  always_ff @(posedge inf.clk) begin
    //priority 1 is for reset
    
    if(inf.reset) begin
      inf.unlock <= 0;
      inf.alarm <= 0;
      lr <= 0;
      phase <= PHA_COLLECT;
    end
    
    else if (phase == PHA_EVAL) begin
      lr.c_digit <= 0;
      lr.enter_pwd <= 0;
	      
      if(lr.enter_pwd == valid_pwd) begin
     	inf.unlock <= 1;
        lr.c_fail <= 0;
        phase <= PHA_COLLECT;
      end
      
      else if(lr.c_fail == FAIL_CNT'(MAX_FAILS)) begin
        inf.alarm <= 1;
        inf.unlock <= 0;
        phase <= PHA_ALARM;
        
      end else begin
        inf.unlock <= 0;
        lr.c_fail <= lr.c_fail +1;
        phase <= PHA_COLLECT;
      end
    end
    
    else if(inf.enter_valid && phase == PHA_COLLECT) begin
      lr.enter_pwd <= lr.enter_pwd << 4 | inf.enter;
      lr.c_digit <= lr.c_digit + 1;
       
      if (lr.c_digit == DIGIT_CNT'(inf.NUM_DIGITS-1) )
        phase <= PHA_EVAL;
    end
  end 
endmodule
