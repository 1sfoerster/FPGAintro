

module if_sequential(
   input [1:0] select, // 2 switches on the left
   input [3:0] c, // 4 switches on the right
   output reg [1:0] LED
);

    // circuit 1 this is similar to case, can get hard to read	
    always_comb begin
        if (select==2'b00) LED[0] = c[0]; 
        else if (select==2'b01) LED[0] = c[1];
        else if (select==2'b10) LED[0] = c[2]; 
        else LED[0] = c[3];
    end
    
    //circuit 4 .. this does the same thing
    always_comb LED[1] = c[select];
    
endmodule
        