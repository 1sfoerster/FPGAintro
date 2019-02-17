

module Sequential_a(
    input a,
    output reg b,
    output reg c
    );
    always_latch begin
        b=a; //this blocks the execution of the next line until it is finished
        c=b;
    end
endmodule
