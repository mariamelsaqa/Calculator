module Final(input [8:0]B,input clk, output [6:0] mux_out, output [3:0] decoder_out);
wire[14:0] w;
wire [3:0] d1;
wire [3:0] d2;
wire [3:0] d3;
wire [3:0] d4;

calc c (.B(B),.result(w));
Splitter S (.result(w), .digit1(d1), .digit2(d2), .digit3(d3), .digit4(d4));
Display (.digit1(d1), .digit2(d2), .digit3(d3), .digit4(d4),.clk(clk), .mux_out (mux_out), .decoder_out(decoder_out));
endmodule