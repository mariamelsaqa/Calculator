module Splitter (input [14:0] result, output reg[3:0] digit1,output reg[3:0]digit2,output reg[3:0]digit3,output reg[3:0]digit4);
always @ (result)
begin
if(result[14] == 1)
begin
digit4 = 4'b1010;
end
else
begin
digit4 = (result[13:0]/10'b1111101000) % 4'b1010;
end
digit1 = result[13:0] % 4'b1010;
digit2 = (result[13:0]/4'b1010) % 4'b1010;
digit3 = (result[13:0]/7'b1100100) % 4'b1010;
end
endmodule