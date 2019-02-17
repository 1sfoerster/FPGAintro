`timescale 1ns / 1ps


module if_a(
    input a, //right most switch SW[0]
    input b, // next to the right SW[1]
    input c, // 2 from the right SW[2]
    output f // right most LED[0]
    );

	assign f = c ? b : a; // if c=0 then b else a

endmodule
