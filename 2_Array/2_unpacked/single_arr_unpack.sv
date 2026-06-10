module unpacked_array;
  
    int fries [3];
    byte tries [5];
    string s;
    
    initial begin
      
      foreach (fries[i]) begin
        fries[i] = $urandom_range(10,100);
      end
      
      tries = '{8'h65,8'h61,8'h67,8'h6c,8'h65};
      
      $display("\n============unpacked array=============");
      
        $display(" ");
      
      foreach (fries[i]) begin
        $display("The value in element %0d is %0b", i, fries[i]);
      end
      
      $display(" ");
      
      foreach (tries[i]) begin
        $display("The value in element %0d is %0b", i, tries[i]);
      end
      
        $display(" ");
      
      foreach(tries[i]) begin
        s = {s,tries[i]};
      end
      
             $display("the string value of tries is %0s", s);
    end
  
endmodule
