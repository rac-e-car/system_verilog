// Code your testbench here
// or browse Examples

/*
str.len()
str.getc(index);
str.putc(index, char);
str.substr(i,j);
str.compare(s);
str.icompare(s);
str.toupper();
str.tolower();
*/

module strings;
  
  string s1 = "fruit";
  string s2 = "vegetable";
  
  string s3 = "Fruit";
  string s4 = "Vegetable";
  
  initial begin
    
    #5;
    $display("\nlength of the string1 %0s is = %0d", s1, s1.len() );
    $display("The 3rd letter of string2 %0s is = %0c", s2, s2.getc(2) );
    s1.putc(1,"l");
    $display("Adding the character at 2nd position to string %0s", s1 );
    $display("Extracted %0s characters from string %0s", s2.substr(1,3), s2 );
    $display("case sensitive comparision of the strings - %0d", s3.compare(s4) );
    $display("Case IN-sensitive comparision of the strings - %0d", s4.compare(s3) );
    $display("Changing %0s to upper case - %0s", s1, s1.toupper() );
    $display("Changing %0s to lower case - %0s", s1, s1.tolower() );
    $display("Contactinating the two strings %0s and %0s to %0s",s1,s2,{s1,s2} );
    
    #5;
    $finish;
  end
endmodule
