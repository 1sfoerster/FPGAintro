

module Parallela(
    input [2:0] SW,
    output [2:0] LED
    );
    
    assign LED[0]=SW[0]&SW[1];
    assign LED[1]=LED[0];
    assign LED[2]=LED[1]|SW[2];
    
endmodule
