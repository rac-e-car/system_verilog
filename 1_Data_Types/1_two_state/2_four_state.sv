// Code your testbench here
// or browse Examples
module state_four;
  
  reg [3:0] regg;
  logic [7:0] logicc;
  wire [15:0] wiree;
  integer integerr;
  time timee;
  real reall;
  
  
  initial begin
  
    $display ("\n==========Size of the types========================");
  $display ("Size of reg type = %0d", $bits(regg) );
  $display ("Size of wire type = %0d", $bits(wiree) );
    $display ("Size of the integer type = %0d", $bits(integerr) );
  $display ("Size of the logic type = %0d", $bits(logicc) );
  $display ("Size of the time type = %0d", $bits(timee) );
  
    
    $display ("\n===========Default value===========================");
  $display ("Initial value of reg type = %0d", regg );
    $display ("Initial value wire type = %0d", wiree );
    $display ("Initial value integer type = %0d", integerr );
  $display ("Initial value logic type = %0d", logicc );
  $display ("Initial value time type = %0d", timee );
    $display ("Initial value real type = %0d", reall );

    #10;
    
    regg = 4'd15;
  logicc = 250;
  integerr = 333;
  reall = 589;
  timee = $time;
    
  #10;
    
    $display ("\n=========After initilization=======================");
  $display ("Initialized value reg type = %0d", regg );
    $display ("Initialized value wire type = %0d", wiree );
    $display ("Initialized value integer type = %0d", integerr );
  $display ("Initialized value logic type = %0d", logicc );
    $display ("Initialized value time type = %0d", timee );
              $display ("Initialized value real type = %0d", reall );
  
$finish;
  end
assign #10 wiree = 16'd255;
endmodule
