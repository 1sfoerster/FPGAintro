

module NoneBlocking(
    input clk, //this is the left most switch, have to toggle to see circuit work
    input a, //this is the right most switch, watch a move through b and c
    output reg b, // what is it's initial value ?
    output reg c
    );
    always_ff @ (posedge clk) begin
        b<=a; //temporary b is filled with original a
        c<=b; //temporary c is filled with original b
    end //at the end b is filled with temp b, c is filled with temp c
endmodule
