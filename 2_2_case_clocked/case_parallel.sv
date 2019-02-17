

module case_parallel(
   input [1:0] select,
   input [3:0] c,
   output reg [1:0] LED
);

    // circuit 1 identical to if
    always_comb begin
		case (select)
			2’b00 : LED[0] = c[0];
			2’b01 : LED[0] = c[1];
			2’b10 : LED[0] = c[2];
			2’b11 : LED[0] = c[3];
		endcase
    end
    
    //circuit 2 .. this does the same thing
    always_comb LED[1] = c[select];
    
endmodule
        