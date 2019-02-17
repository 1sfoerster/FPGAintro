	//circuit 1 .. traditional if
    always_comb begin
        if (select_long==2'b00) LED[4] = c[0]; 
        else if (select_long==2'b01) LED[5] = c[1];
        else if (select_long==2'b10) LED[6] = c[2]; 
        else LED[7] = c[3];
    end
    
    //circuit 4 .. this does the same thing    