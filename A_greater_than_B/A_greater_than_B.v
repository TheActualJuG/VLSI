`timescale 1ns/1ns

// structural (gate level)
module structural(input [1:0] a, input [1:0] b, output f);

    wire wire0, wire1, wire2;
        and and0(wire0, a[0], (~b[1]), (~b[0]));
        and and1(wire1, a[1], a[0], (~b[0]));
        and and2(wire2, a[1], (~b[1]));
        or (f, wire0, wire1, wire2);

endmodule


// dataflow
module dataflow(input [1:0] a, input [1:0] b, output f);

    assign f = (a[0] & (~b[1]) & (~b[0])) | (a[1] & a[0] & (~b[0])) | (a[1] & (~b[1]));

endmodule


// behavioral
module behavioral(input [1:0] a, input [1:0] b, output reg f);

always @(*) begin
    f = a > b;
end

endmodule