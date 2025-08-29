`timescale 1ns/1ns

module testbench_ALU();

	parameter BUS_WIDTH = 8;
	reg [3:0] opcode;
	reg [BUS_WIDTH-1:0] a,b;
	reg cin;
	wire [BUS_WIDTH-1:0] y;
	wire cout;
	wire borrow;
	wire zero;
	wire parity;
	wire invalid_op;

	ALU #(.BUS_WIDTH(BUS_WIDTH)) uut(
		.a(a),
		.b(b),
		.cin(cin),
		.opcode(opcode),
		.y(y),
		.cout(cout),
		.borrow(borrow),
		.zero(zero),
		.parity(parity),
		.invalid_op(invalid_op)
	);

	// simple stimulus, NOT THE ACTUAL STRESS TEST
	initial begin
		$monitor("elapsed_time: %0d", $time, "opcode=%d, a=%d, b=%d, cin=%d, y=%d, cout=%b, borrow=%b, zero=%b, parity=%b, invalid_op=%b",
			  opcode, a,b,cin,y, cout,borrow,zero,parity,invalid_op);
	
		$display("Test of invalid");
		opcode = 0; a = 0; b = 0; cin = 0; #1;
		$display("\nTest OP_ADD");
		opcode = 1; a = 9; b=33; cin=0; #1;
		$display("\nTest OP_ADD_CARRY"); 
		opcode = 2; a=24; b=53; cin=1; #1;
		$display("\nTest OP_SUB");
		opcode = 3; a=9; b=33; cin=0; #1;
		$display("\nTest OP_INC");
		opcode = 4; a = 34; #1;
		$display("\nTest OP_DEC");
		opcode = 5; a = 35; #1;
		$display("\nTest OP_AND");
		opcode = 6; a=8'b01101100; b=8'b00111100; cin=0; #1;
		$display("\nTest OP_NOT");
		opcode = 7; a=8'b11111111; #1;
		$display("\nTest OP_RL");		
		opcode = 8; a=8'b00110101; #1;
		$display("\nTest OP_RR");
		opcode = 9; a=8'b00110101; #1;
	end
endmodule
