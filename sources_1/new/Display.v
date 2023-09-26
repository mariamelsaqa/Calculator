module Display(input [8:0]B,input clk,output [7:0] mux_out,output [3:0]decoder_out);
wire rst;
wire clk_out;
wire[7:0] ssd_out1,ssd_out2, ssd_out3, ssd_out4;
wire count;
wire[14:0] w;
wire [3:0] d1;
wire [3:0] d2;
wire [3:0] d3;
wire [3:0] d4;
wire dot;

calc c (.B(B),.result(w), .dot(dot));
Splitter S (.result(w), .digit1(d1), .digit2(d2), .digit3(d3), .digit4(d4));
Clock_Divider #(500000) cd(clk,0, clk_out);

BCD s1 (d4, 1'b1, ssd_out1);
BCD s3 (d3,1'b0, ssd_out2);
BCD s2 (d2,dot, ssd_out3);
BCD s4 (d1,1'b1, ssd_out4);

Binary_Counter  #(2) nc(clk_out, 0, 0, 0, count );
Decoder decod (count, decoder_out);
MUX our_mux (ssd_out1, ssd_out2, ssd_out3, ssd_out4, count, mux_out);

endmodule