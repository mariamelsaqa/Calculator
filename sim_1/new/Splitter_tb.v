module Splitter_tb();
reg [14:0] result;
wire [3:0] digit1;
wire [3:0] digit2;
wire [3:0] digit3;
wire [3:0] digit4;

Splitter S(.result(result), .digit1(digit1), .digit2(digit2), .digit3(digit3), .digit4(digit4));

initial begin 
result = 14'd9801;
#100
result = 4'b0001;
result[14] = 1'b1;
end
endmodule