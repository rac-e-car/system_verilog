/*
abc.num()
abc.size()
abc.delete(index)
abc.exists(index)
abc.first(index)
abc.last(index)
abc.next(index)
abc.prev(index)
*/

//coded with different possibilities of indexing with specific data types
//for now ignoring class key



module associative_array;
  
// indexing by data types
  int rate_the_movie [string];
  logic [7:0] share [bit[3:0]];
  
// indexing by unspecified integer
  string mem [*];
  
// indexing with struct and enum  
  typedef enum {ajith, irfan, kiran, bharath} batch_12;
  int mark_outta_50 [batch_12];
  
  typedef struct {
    byte bookmarks;
    shortint tabs;
  } surfing;
  
  string browser [surfing];
  surfing surf;  
  
// declaring with default values
  bit [31:0] slang [string] = '{
    "Rolling on the floor laughing" : {8'h41,8'h53,8'h41,8'h50},
    "As soon as possible" : {8'h52, 8'h4f, 8'h46, 8'h4c}
  							   };
  
  initial begin
    //string type
    rate_the_movie = '{"truman show": 8, "godfather": 9, "dune": 8};
    
    $display("\n===========/Playing with Associative array/===========");
    $display("\nArray declared with string type is %0p", rate_the_movie);
    
    //fixed sized integer
    share = '{12: 200, 9: 100, 6: 24, 3: 12};
    $display("\nfixed int array values are %0p", share);
    
    //any integral
    mem = '{1: "vaa", 2:"vaa", 3:"pakkam", 4: "vaa"};
    $display("\n* type values are %0p", mem);
    
    //enum key
    mark_outta_50 [ajith] = 45;
    mark_outta_50 [irfan] = 46;
    mark_outta_50 [bharath] = 46;
    mark_outta_50 [kiran] = 50;
    $display ("\nenum key values are %0p", mark_outta_50);
    
    //struct key
    
    surf.bookmarks = 10;
    surf.tabs = 12;
    browser [surf] = "Brave";
        
    surf.bookmarks = 5;
    surf.tabs = 6;
    browser [surf] = "Edge";
    
    $display ("\nstruct key values are %0p", browser);
    
    //default values
    $display ("\ndefault initialized array values are %0s and %0s\n", slang["Rolling on the floor laughing"], slang["As soon as possible"]);
    
  end
endmodule

/*===========/Playing with Associative array/===========

Array declared with string type is '{"dune":8, "godfather":9, "truman show":8} 

fixed int array values are '{0x3:'hc, 0x6:'h18, 0x9:'h64, 0xc:'hc8} 

* type values are '{0x1:"vaa", 0x2:"vaa", 0x3:"pakkam", 0x4:"vaa"} 

enum key values are '{ajith:45, irfan:46, kiran:50, bharath:46} 

struct key values are '{'{bookmarks:10, tabs:12}:"Brave", '{bookmarks:5, tabs:6}:"Edge"} 

default initialized array values are ASAP and ROFL
*/
