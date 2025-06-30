// CptS 260 - Homework 6, Question 2b
// This module implements a 2-bit Johnson (or twisted-ring) counter,
// It consists of
// two D-flip-flops where the inverted output of the last is fed back
// to the input of the first.
//

module homework6_q2b (
    // Inputs
    input  logic Clock,
    // Outputs
    output logic Q2 // The final output of the circuit
);

    // Internal register for the first flip-flop's output
    logic Q1;

    // This block describes the behavior of the two flip-flops.
    // At each positive edge of the clock, the state is updated.
    // Q1 gets the inverted value of Q2.
    // Q2 gets the previous value of Q1.
    // The use of '<=' non-blocking assignments ensures they update simultaneously.
    always_ff @(posedge Clock) begin
        Q1 <= ~Q2;
        Q2 <= Q1;
    end

    // Define the initial state of the registers as all zeros.
    initial begin
        Q1 = 1'b0;
        Q2 = 1'b0;
    end

endmodule


//
// Testbench for the Question 2b circuit
//
// This testbench generates a clock and monitors the final output Q2
// to verify the 4-state cycle of the Johnson counter.
//

module homework6_q2b_tb;

    // Signals to connect to the DUT
    logic Clock;
    logic Q2;
    // Internal signal to monitor Q1 for clarity
    wire Q1 = homework6_q2b_tb.dut.Q1;

    // Instantiate the device under test
    homework6_q2b dut (
        .Clock(Clock),
        .Q2(Q2)
    );

    // Clock generation process
    initial begin
        Clock = 0;
        forever #5 Clock = ~Clock;
    end

    // Simulation control
    initial begin
        // Run for 100ns to see multiple full cycles of the counter.
        #100;
        $finish;
    end

    // Monitor the state of the counter
    initial begin
        $dumpfile("q2b_waves.vcd");
        $dumpvars(0, homework6_q2b_tb);

        $monitor("Time=%0t ns, Clock=%b, State (Q1,Q2) = %b%b", $time, Clock, Q1, Q2);
    end

endmodule
