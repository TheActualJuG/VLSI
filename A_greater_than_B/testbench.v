`timescale 1ns/1ns
`include "A_greater_than_B.v"

module testbench;

    reg [1:0] a;
    reg [1:0] b;
    wire f;

    structural uut0(
        .a(a),
        .b(b),
        .f(f)
    );

    dataflow uut1(
        .a(a),
        .b(b),
        .f(f)
    );

    behavioral uut2(
        .a(a),
        .b(b),
        .f(f)
    );

    integer i = 0, j = 0;
    initial begin
        
       // $monitor()

        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);

        for(i=0;i<4;i=i+1)begin
            a = i;
            for(j=0;j<4;j=j+1)begin
                b = j;
                #1;
            end
        end
        

    end
endmodule