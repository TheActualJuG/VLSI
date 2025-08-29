module ALU #(parameter BUS_WIDTH = 8) ( // 8 bit arch.
	
	input [BUS_WIDTH-1:0] a, b,
	input cin,
	input [3:0] opcode,
	output reg [BUS_WIDTH-1:0] y, // result
	output reg cout, borrow, invalid_op,
	output zero, parity
	);

	// opcode
	localparam OP_ADD = 1; // A + B
	localparam OP_ADD_CIN = 2; // A + B + Cin
	localparam OP_SUB = 3; // A - B
	localparam OP_INC = 4; // Increment A
	localparam OP_DEC = 5; // Decrement A
	localparam OP_AND = 6; // Bitwise AND 
	localparam OP_NOT = 7; // Bitwise NOT
	localparam OP_RL = 8; // Rotate Left
	localparam OP_RR = 9; // Rotate Right

	always @(*) begin
		y = 0; cout = 0; borrow = 0; invalid_op = 0;
		
		case(opcode)
			OP_ADD : begin {cout, y} = a+b; end
			OP_ADD_CIN : begin {cout, y} = a+b+cin; end
			OP_SUB : begin {borrow, y} = a-b; end
			OP_INC : begin {cout, y} = a+1'b1; end
			OP_DEC : begin {borrow, y} = a-1'b1; end
			OP_AND : begin y = a&b; end
			OP_NOT : begin y = ~a; end
			OP_RL :	begin y ={a[BUS_WIDTH-2:0], a[BUS_WIDTH-1]}; end
			OP_RR : begin y = {a[0], a[BUS_WIDTH-1:1]}; end
			default: begin invalid_op = 1; end
		endcase
	end

	assign parity = ^y;
	assign zero = (y == 0);	

endmodule