module BCD (in, dot, temp);
input wire [3:0] in;
//input wire en;
input dot;
output reg [7:0] temp;
//assign in = 4'b0000; 

            always @(*) begin
            //if (en==1) begin
                case(in)
                    4'b0000:
                    temp = 8'b00000001;
                    4'b0001:
                    temp = 8'b01001111;
                    4'b0010:
                    temp = 8'b00010010;
                    4'b0011:
                    temp = 8'b00000110;
                    4'b0100:
                    temp = 8'b01001100;
                    4'b0101:
                    temp = 8'b00100100;
                    4'b0110:
                    temp = 8'b00100000;
                    4'b0111:
                    temp = 8'b00001111;
                    4'b1000:
                    temp = 8'b00000000;
                    4'b1001:
                    temp = 8'b00000100;
                    4'b1010:
                    temp = 8'b01111110;
                    4'b1011:
                    temp = 8'b01100000;
                    4'b1100:
                    temp = 8'b00110001;
                    4'b1101:
                    temp = 8'b01000010;
                    4'b1110:
                    temp = 8'b00110000;
                    4'b1111:
                    temp = 8'b00111000;
                
                endcase
           //end
           if( dot ==1'b1)
           begin
           temp[7] = 1;
           end
           else if ( dot == 1'b0)
           begin
           temp[7] = 0;
           end
end //for the always block
endmodule