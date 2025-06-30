// Define the timescale for simulation
`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Module: A6Q3FullAdder
// Description: Implements a single 1-bit full adder.
//              Adds three 1-bit inputs (a, b, cin) and produces a 1-bit sum
//              and a 1-bit carry-out (cout).
//////////////////////////////////////////////////////////////////////////////////
module A6Q3FullAdder (
    input  logic a,     // First input bit
    input  logic b,     // Second input bit
    input  logic cin,   // Carry-in bit from previous stage
    output logic sum,   // Sum output bit
    output logic cout   // Carry-out bit to next stage
);

    // Sum logic: sum is 1 if an odd number of inputs are 1
    // sum = a XOR b XOR cin
    assign sum = a ^ b ^ cin;

    // Carry-out logic: cout is 1 if at least two inputs are 1
    // cout = (a AND b) OR (a AND cin) OR (b AND cin)
    // This can also be written as: (a AND b) OR (cin AND (a XOR b))
    assign cout = (a & b) | (cin & (a ^ b));

endmodule // A6Q3FullAdder


//////////////////////////////////////////////////////////////////////////////////
// Module: four_bit_full_adder
// Description: Implements a 4-bit full adder by instantiating and chaining
//              four 1-bit full_adder modules.
//              Adds two 4-bit inputs (A, B) and a single carry-in (Cin),
//              producing a 4-bit sum (Sum), a final carry-out (Cout),
//              and an overflow indicator (Overflow).
//////////////////////////////////////////////////////////////////////////////////
module four_bit_full_adder (
    input  logic [3:0] A,     // First 4-bit input
    input  logic [3:0] B,     // Second 4-bit input
    input  logic       Cin,   // Initial carry-in for the LSB (least significant bit)
    output logic [3:0] Sum,   // 4-bit sum output
    output logic       Cout,  // Final carry-out from the MSB (most significant bit)
    output logic       Overflow // Indicates if an overflow occurred
);

    // Declare internal carry signals.
    // c_int[0] is carry-out from FA0, carry-in for FA1
    // c_int[1] is carry-out from FA1, carry-in for FA2
    // c_int[2] is carry-out from FA2, carry-in for FA3
    logic [2:0] c_int; // Array for internal carry bits

    // Instantiate four 1-bit full adders (FA)

    // FA0: Adds A[0], B[0], and the initial Cin
    // Produces Sum[0] and internal carry c_int[0]
    A6Q3FullAdder fa0 (
        .a(A[0]),
        .b(B[0]),
        .cin(Cin),
        .sum(Sum[0]),
        .cout(c_int[0])
    );

    // FA1: Adds A[1], B[1], and the carry-out from FA0 (c_int[0])
    // Produces Sum[1] and internal carry c_int[1]
    A6Q3FullAdder fa1 (
        .a(A[1]),
        .b(B[1]),
        .cin(c_int[0]),
        .sum(Sum[1]),
        .cout(c_int[1])
    );

    // FA2: Adds A[2], B[2], and the carry-out from FA1 (c_int[1])
    // Produces Sum[2] and internal carry c_int[2]
    A6Q3FullAdder fa2 (
        .a(A[2]),
        .b(B[2]),
        .cin(c_int[1]),
        .sum(Sum[2]),
        .cout(c_int[2])
    );

    // FA3: Adds A[3], B[3], and the carry-out from FA2 (c_int[2])
    // Produces Sum[3] and the final carry-out Cout
    A6Q3FullAdder fa3 (
        .a(A[3]),
        .b(B[3]),
        .cin(c_int[2]),    // Carry-in to MSB
        .sum(Sum[3]),
        .cout(Cout)        // Carry-out from MSB
    );

    // Overflow detection logic:
    
    assign Overflow = c_int[2] ^ Cout;

endmodule // four_bit_full_adder
