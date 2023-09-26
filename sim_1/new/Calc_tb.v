module calc_tb();
reg [8:0] B;
wire [13:0] result;
integer i,j;
calc c (.B(B), .result(result));

initial begin
for(i=0; i<=8; i=i+1) begin:test_loop
B[i]=0;
#1;
end
for(i=0; i<=3; i=i+1) begin :test_loop2
for(j=0; j<9; j=j+1) begin:nested
B[i]=1;
#1;
B[i]=0;
#1; //two numbers = 99
end
end
#50
//end of step 1
B[6] = 1; //multiplication
#50;
//end of step 2
B[6] = 0;
B[4] = 1; //addition
#50;
//end of step 3
B[4] = 0;
B[5] = 1; //subtraction
#50;
//end of step 4
B[5] = 0;
B[7] = 1; //Division
#50;
//end of step 5
B[7] = 0;
B[8] = 1; //Display
#50;
//end of step 6
B[8] = 0;
for(j=0; j<9; j=j+1) begin:step7
B[3] = 1;
#10;
B[3] = 0;
#10;
end //number = 9998
#50;
//end of step 7
B[5] = 1; //subtraction
#50;
//end of step 8
B[5] = 0;
B[7] = 1; //division
#50;
//end of step 9
B[7] = 0;
B[8] = 1; // display 9998
#50;
//end of step 10
B[8] = 0;
for(j=0; j<4; j=j+1) begin:dig1
B[0] = 1;
#1;
B[0] = 0;
#1;
end
for(j=0; j<3; j=j+1) begin:dig2
B[1] = 1;
#1;
B[1] = 0;
#1;
end
#50;
//end of step 11
B[5] = 1; //subtraction
#50;
//end of step 12
B[5] = 0;
B[7] = 1;
#50;
//end of step 13
B[7] = 0;
B[6] = 1; //multiplication
#50;
//end of step 14
B[6] = 0;
B[8] = 1;
#50;
//end of step 15
B[8] = 0;
for(j=0; j<2; j=j+1) begin:step16
B[2] = 1;
B[3] = 1;
#1;
B[2] = 0;
B[3] = 0;
#1;
end //number = 3210
#50;
//end of step 16
B[7] = 1;
#50;
//end of step 17
end
endmodule
