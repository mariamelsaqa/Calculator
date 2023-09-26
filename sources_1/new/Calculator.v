module calc(input [8:0]B, output reg [14:0] result, output reg dot);
genvar i;
reg [3:0] Digit1 = 4'b0000;
reg [3:0] Digit2 = 4'b0000;
reg [3:0] Digit3 = 4'b0000;
reg [3:0] Digit4 = 4'b0000;

reg [6:0]firstpart;
reg [6:0]secondpart;

always @ (B)
begin
if(B[0] == 1'b1)
begin 
if (Digit1 != 4'd9)
begin
Digit1 = Digit1 + 4'd1;
end
else if (Digit1 == 4'd9)
begin
Digit1 = 4'd0;
end
end

if(B[1] == 1'b1)
begin 
if (Digit2 != 4'd9)
begin
Digit2 = Digit2 + 4'd1;
end
else if (Digit2 == 4'd9)
begin
Digit2 = 4'd0;
end
end

if(B[2] == 1'b1)
begin 
if (Digit3 != 4'd9)
begin
Digit3 = Digit3 + 4'd1;
end
else if (Digit3 == 4'd9)
begin
Digit3 = 4'd0;
end
end

if(B[3] == 1'b1)
begin 
if (Digit4 != 4'd9)
begin
Digit4 = Digit4 + 4'd1;
end
else if (Digit4 == 4'd9)
begin
Digit4 = 4'd0;
end
end
firstpart = Digit2 + (Digit1 * 4'b1010);
secondpart = Digit4 + (Digit3 *4'b1010);
result = secondpart + (firstpart *7'b1100100);
dot = 0;

if (B[4] == 1'b1)
begin
result = firstpart + secondpart;
dot = 1;
end

if (B[5] == 1'b1)
begin
dot = 1;
if(firstpart < secondpart) begin
result = (secondpart - firstpart);
result[14] = 1'b1;
end
else
begin
result = firstpart - secondpart;
end
end

if (B[6] == 1'b1)
begin
dot = 1;
result = firstpart * secondpart;
end

if (B[7] == 1'b1)
begin
dot = 1;
result = firstpart / secondpart;
end


if(B[8] == 1'b1)
begin
dot = 0;
result = secondpart + (firstpart *7'b1100100);
end
end

endmodule