module thirtyTwobitHexTo16LEDs(
    input clk,
    input reset,
    input stop_start,
    input [2:0] dp_selector, // decimal place selector
    output reg dp,
    output [7:0] anodes,
    output a,b,c,d,e,f,g
    );
    
    // clock stuff ... really two clocks .. one so can see counting on the display
    // another faster clock that displays 8 7seg displays fast enough that they blur, but slow enough to fully turn on and be bright
    integer divider_counter = 1000; //with 100,000,000Hz clock means 100000 times per second 
    integer divider_anode = 250000; //with 100,000,000Hz clock means 400Hz clock
    
    integer count_clk = 0; //this is the counter to be displayed by the 7 seg display
    integer anode_clk = 0; //this is the clock that is to cause a 3 bit counter to to change 50 times a second
    
    reg [2:0] segment = 0; //this is what chooses what is displayed on which segment 
    integer c_input=451263789; //this creates a variable called c_input with 32 bits that has 1 added to it by a clock
              //in hex is 1AE5 BD2D
              //in decimal is 451,263,789
              //in binary is 0001 1010 1110 0101 1011 1101 0010 1101

    //first clock controlling how fast numbers seem to count on the 8 segments
    always_ff @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1) begin
            count_clk <= 0;
            c_input <=0;
        end
        else if(stop_start==0) begin
            if (count_clk == divider_counter-1) begin
                count_clk <= 0;
                c_input <= c_input + 1;
                end         
            else count_clk <= count_clk + 1;
        end
        else count_clk <= count_clk;
    end
    //second clock controlling how fast the 8 displays are turned on one at a time, too fast grow dim, too slow they flicker      
    always_ff @ (posedge(clk), posedge(reset))
    begin
        if (reset == 1) anode_clk <=0 ;
        else if (anode_clk == divider_anode-1) begin
            anode_clk <=0 ;
            if ((segment+1)==dp_selector) dp<=0; else dp<=1; // had to fiddle with this code, no idea why it works this way
            segment <= segment+1;
        end         
        else anode_clk<=anode_clk + 1;
    end
    
    //anode expansion
    wire nanodes; //not anodes
    assign anodes = ~(1 << segment); // is a decoder .. anode_select 3 bits could be 0,1,2,3,4,5,6,7 ..     
    
    //hex selector
    wire [3:0] hex_to_display;    
    assign hex_to_display = c_input[4*segment +: 4]; // 3 bits of anode_select, grab 4 bits of c_input and put them in hex_to_display
   
    //7-Seg Convertor .. intial values come from a spreadsheet analysis
    integer ac=16'h2812, bc=16'hd860, cc=16'hd004, dc=16'h8692, ec=16'h02ba, fc=16'h208e,gc=16'h1083;
    assign a = ac[hex_to_display]; // all these are muxes, hex_to_display selects one of the constants 16 bits
    assign b = bc[hex_to_display];
    assign c = cc[hex_to_display];
    assign d = dc[hex_to_display];
    assign e = ec[hex_to_display];
    assign f = fc[hex_to_display];
    assign g = gc[hex_to_display];   
        
endmodule

