//     ============================================================
//     =========================TEST-BENCH=========================
//     ============================================================
    `timescale 1ns/1ps
    
    module lock_tb;
      
      localparam int DIGIT_WIDTH = 4;
      localparam int NUM_DIGITS = 4; 
      localparam int PASSWORD_WIDTH = DIGIT_WIDTH * NUM_DIGITS;
      localparam int MAX_FAILS = 3;
      
      localparam logic [PASSWORD_WIDTH-1:0] CORRECT_PASSWORD = 16'hE1C8;
      
      bit clk;
      initial clk = 0;
      always #5 clk = ~clk;
      
      lock_inf #(.DIGIT_WIDTH(DIGIT_WIDTH), .NUM_DIGITS(NUM_DIGITS)) tb_inf(clk);
        
      lock_dut #(.MAX_FAILS(MAX_FAILS) ) dut (tb_inf.dut);
    
      typedef struct {
        logic [PASSWORD_WIDTH-1:0] password;
        bit exp_unlock;
        bit exp_alarm;
      } test_case_def;
      
      test_case_def test_q[$];
      string test_name[$];
      bit result_log[string];
      event all_tests_done;
      
      int all_fail_count;
      int all_pass_count;
      
      function automatic string str_result(input bit passed);
       return passed ? "PASS" : "FAIL";
      endfunction
        
        task automatic check_output (
          input string name,
          bit exp_unlock,
          bit exp_alarm
        );
          bit passed;
        
          passed = (exp_unlock === tb_inf.unlock) && (exp_alarm === tb_inf.alarm);
          result_log[name] = passed;
          if(passed) all_pass_count ++;
          else 		 all_fail_count ++;
          $display ("[%0s] %0s ------------------- unlock[%0b]-(exp %0b) | alarm[%0b]-(exp %0b)", str_result(passed), name, tb_inf.unlock, exp_unlock, tb_inf.alarm, exp_alarm);
          
        endtask
        
      task automatic run_test (input string name, input test_case_def tc);
          tb_inf.send_pwd(tc.password);
          check_output(name, tc.exp_unlock, tc.exp_alarm);
        endtask
        
        function automatic void test_seq ();
          test_case_def tc;
          
          tc = '{CORRECT_PASSWORD, 1, 0};
          test_q.push_back(tc); test_name.push_back("Entered_correct_password");
          
          tc = '{16'h1234, 0, 0};
          test_q.push_back(tc); test_name.push_back("Wrong_attempt-1");
          
          tc = '{16'h1234, 0, 0};
          test_q.push_back(tc); test_name.push_back("Wrong_attempt-2");
          
          tc = '{16'h1234, 0, 0};
          test_q.push_back(tc); test_name.push_back("Wrong_attempt-3");
          
          tc = '{16'h1234, 0, 1};
          test_q.push_back(tc); test_name.push_back("ALARM ON - Wrong_attempt-4");
          
        endfunction
        
        initial begin
          
          $display("Started at time %0t",$time);
          repeat(5) @(posedge clk);
          $display("clk is toggling %0t", $time);
          
          
          
          tb_inf.reset = 1;
          tb_inf.enter = 0;
          tb_inf.enter_valid = 0;
          @(posedge clk);
         
          @(negedge clk);
          tb_inf.reset = 0;
          @(posedge clk);
          
          test_seq();
          
          fork
            
            begin: test_sequence
              
              tb_inf.reset_begin();
              check_output("After_reset", 0 , 0);
              
              foreach (test_q[i]) begin
                run_test(test_name[i], test_q[i]);
              end
              
              tb_inf.reset_begin();
              check_output("Cleared using reset", 0,0);
              
              tb_inf.get_digit(4'hE);
              tb_inf.get_digit(4'h1);
              tb_inf.get_digit(4'hC);
              tb_inf.reset_begin();
              
              tb_inf.send_pwd(CORRECT_PASSWORD);
              check_output ("correct_password_after_mid_reset", 1 , 0);
              
          
        	-> all_tests_done;
            end: test_sequence
            
            
            
             begin : timeout_watchdog
        for (int w = 0; w < 2000; w++) @(posedge clk);
        $error("TIMEOUT: simulation hung after 2000 cycles");
        
      end : timeout_watchdog
            
          join_any
          disable fork;
            
            $display("\n----------Result_Log [associative array]----------");
            foreach (result_log[name]) begin
              $display ("%s for %s", str_result(result_log[name]), name);
                        end
                        
                  $display("\n%0d test(s) PASSED | %0d test(s) failed, total tests = %0d",
                           all_pass_count, all_fail_count, all_pass_count + all_fail_count);
                        
                        if(all_fail_count == 0)
                          $display("ALL TEST CASES PASSED");
                        else
                          $display("%0d test case(s) failed", all_fail_count);
                        
            $finish;
                        end
                        
            
                        endmodule
