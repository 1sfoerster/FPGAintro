`timescale 1ns / 1ps


module if_a(
    input [1:0] a, //right most switches SW[0] SW[1]
    input [1:0] b, //SW[2], SW[3]
    input select, // lst switch on the left
    output reg [3:0] LED // right most LED[0]
    );

    //circuit 1 .. traditional if 
    always_comb if (select) LED[0] = a[0]; else LED[0]=b[0];
    always_comb if (select) LED[1] = a[1]; else LED[1]=b[1];
    
    //circuit 2 .. this does the same thing
	always_comb LED[3:2] = select ? a : b; // if select=1 then a else b
	
endmodule
