/ CptS 260 - Homework 6, Question 1
//
// This module implements the sequential circuit from question 1.
// It has two positive edge-triggered D-flip-flops and combinational
// logic to produce the output Z.
//

module homework6_q1 (
    // Inputs
    input  logic A,
    input  logic B,
    input  logic C, // Clock
    // Output
    output logic Z
);

    // Internal registers to hold the state of the flip-flops
    // Qa is driven by input A, Qb is driven by input B
    logic Qa_reg, Qb_reg;

    // This block describes the behavior of the two D-flip-flops.
    // At each positive edge of the clock 'C', the registers are updated.
    always_ff @(posedge C) begin
        Qa_reg <= A;
        Qb_reg <= B;
    end

    // This block describes the combinational logic for the output Z.
    // Z is a function of the inputs and the state of the flip-flops.
    // Z = (A AND Qb) OR (B AND Qa)
    assign Z = (A & Qb_reg) | (B & Qa_reg);

endmodule


//
// Testbench for the Question 1 circuit
//
// This testbench generates the clock and the input waveforms for A and B
// as depicted in the homework PDF to test the circuit's behavior.
//

module homework6_q1_tb;

    // Signals to connect to the DUT (Device Under Test)
    logic A, B, C, Z;

    // Instantiate the device under test
    homework6_q1 dut (
        .A(A),
        .B(B),
        .C(C),
        .Z(Z)
    );

    // Clock generation process
    // Creates a clock with a 10ns period (5ns high, 5ns low)
    initial begin
        C = 0;
        forever #5 C = ~C;
    end

    // Input stimulus process
    // This process drives the inputs A and B to match the waveform diagram.
    initial begin
        // Initial state
        A = 0; B = 1;
        #10; // First rising edge at 5ns, wait until after

        // After 1st rising edge
        A = 1; B = 0;
        #10;

        // After 2nd rising edge
        A = 0; B = 0;
        #10;

        // After 3rd rising edge
        A = 1; B = 0;
        #10;

        // After 4th rising edge
        A = 0; B = 1;
        #10;

        // After 5th rising edge
        A = 1; B = 1;
        #10;
        
        // After 6th rising edge
        A = 0; B = 0;
        #20;
        
        // End the simulation
        $finish;
    end

    // Optional: Monitor changes to signals
    initial begin
        $monitor("Time=%0t ns, A=%b, B=%b, Z=%b", $time, A, B, Z);
    end

endmodule
