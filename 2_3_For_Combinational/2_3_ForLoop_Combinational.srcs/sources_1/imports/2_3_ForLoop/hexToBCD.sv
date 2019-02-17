module ForLoop(
	input [7:0] binary,//right half of 16 switches
	output reg [3:0] Hundreds, // LED(8:6)
	output reg [3:0] Tens, //LED(5:3)
	output reg [3:0] Ones // LED(2:0)
	);
	//this shows the algorithm of converting 4 bits of hex to 5 bits of binary coded decmial
	//use switches to enter hex, look at LED's for decimal translation
	integer i;
	always_comb begin
		//set 100's 10's and 1's to 0
		Hundreds = 0;
		Tens = 0;
		Ones = 0;
		
		for (i=7; i>=0; i=i-1) begin
			//add 3 to columns >=5
			if (Hundreds >= 5) Hundreds = Hundreds + 3;
			if (Tens >= 5) Tens = Tens + 3;
			if (Ones >= 5) Ones = Ones + 3;
			
			//shift left one
			Hundreds = Hundreds << 1;
			Hundreds[0] = Tens[3];
			Tens = Tens << 1;
			Tens[0] = Ones[3];
			Ones = Ones << 1;
			Ones[0] = binary[i];
		end
	end
endmodule