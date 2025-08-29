`timescale 1ns/1ns

module testbench();

	reg [3:0] in;
	wire a,b,c,d,e,f,g,dot;

	hex7_Seg_Disp_Decoder uut(
		.in(in),
		.a(a),
		.b(b),
		.c(c),
		.d(d),
		.e(e),
		.f(f),
		.g(g),
		.dot(dot)
	);

	integer i;
	initial begin
		$monitor($time, "in = $b, seven_seg_code = %7b, dot = $b", in, {a,b,c,d,e,f,g}, dot);
		
		for(i=0; i<16; i=i+1)begin
			in = i; #1;
		end
	end
endmodule
