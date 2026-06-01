// Code your testbench here
// or browse Examples
struct {
  byte id;
  string emp_name;
  bit [15:0] salary_per_month;
} employee_details_s;

module first_struct;
  initial begin
  
    employee_details_s = '{24,"siva",250000};
  
    $display("\n=======Here comes the domeru========");
    $display("\n--unpacked struct without typedef--");
    $display ("Idho ungalukaaga: %p",employee_details_s);
    $display ("Size of the structure : %0d", $bits(employee_details_s) );
  end
    endmodule

//=====================================================================
    
  
