// Code your design here
module d_ff (dff_inf.dut inf);
  
  always@(posedge inf.clk) begin
    if(inf.reset)
      
  	inf.q <= 0;
    else
    inf.q <= inf.d;
    
  end
  
endmodule
