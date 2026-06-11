module dynamic_array;
  
  int data [];
  int data_2 [];
  byte tata [];
  string s;
  
  initial begin
    //allocate memory for data and assign values
    data = new [5];
    data = '{23,34,45,56,67};
    
    //allocate memory for tata and assign values
    tata = new [4];
    tata = '{8'h6B,8'h69,8'h74,8'h65};
    
    //display each element
    
    $display("\n===============dynamic array===============");
    
    foreach (data[i]) begin
      $display("The value in data[%0d] is %0d",i,data[i]);
             end
             
     s= "";     
    foreach (tata[i]) begin
      s= {s,tata[i]};
             end
      $display("String value of the tata = %0s", s);
    
    //print size of the array
    $display("The size of both the arrays data & tata is %0d & %0d",data.size(), tata.size() );
    
    //copying array data1 to data2
    data_2 = new[5] (data);
    $display("\ncopied data values to data2");
    foreach (data_2[i]) begin
      $display("The value of data2[%0d] is %0d",i,data_2[i]);
    end
    
    //delete an array's values
    data.delete();
    $display("Deleted values of 'data', its size now is %0d", data.size() );
    
    //out of bound access
    $display("\nout of bound access of data2 and tata is %0d and %0d",data_2[200],tata[33]);
         
         end
         endmodule

/*

===============dynamic array===============
The value in data[0] is 23
The value in data[1] is 34
The value in data[2] is 45
The value in data[3] is 56
The value in data[4] is 67
String value of the tata = kite
The size of both the arrays data & tata is 5 & 4

copied data values to data2
The value of data2[0] is 23
The value of data2[1] is 34
The value of data2[2] is 45
The value of data2[3] is 56
The value of data2[4] is 67
Deleted values of 'data', its size now is 0

out of bound access of data2 and tata is 0 and 0
*/
