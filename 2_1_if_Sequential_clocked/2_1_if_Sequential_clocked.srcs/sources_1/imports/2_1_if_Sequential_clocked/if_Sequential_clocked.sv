

module if_sequential(
   input [1:0] select, // left most two switches
   input clk, //switch third from the left
   input [3:0] c, //four switches on the right
   output reg [1:0] LED // two led's on the left
);

    // circuit 1 this is similar to case, can get hard to read	
    always_ff @ (posedge clk) begin
        if (select==2'b00) LED[0] <= c[0];
        else if (select==2'b01) LED[0] <= c[1];
        else if (select==2'b10) LED[0] <= c[2]; 
        else LED[0] <= c[3];
    end
    
    //circuit 2 .. this does the same thing
    always_ff @ (posedge clk) LED[1] <= c[select];
    
endmodule
        