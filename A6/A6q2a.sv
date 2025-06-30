//
// CptS 260 - Homework 6, Question 2a
//
// This module implements the circuit from question 2a.
// It is a single D-flip-flop with its inverted output fed back to its
// input, effectively creating a T-flip-flop or a frequency divider by 2.
//

module homework6_q2a (
    // Inputs
    input  logic Clock,
    // Outputs
    output logic Q
);

    // This block describes the behavior of the flip-flop.
    // At each positive edge of the clock, Q is updated with its inverted value.
    // The 'Q <= ~Q' statement creates the toggle behavior.
    always_ff @(posedge Clock) begin
        Q <= ~Q;
    end

    // Define the initial state of Q as 0, as specified in the assignment.
    initial begin
        Q = 1'b0;
    end

endmodule


//
// Testbench for the Question 2a circuit
//
// This testbench generates a clock and monitors the output Q to verify
// that it toggles at half the frequency of the clock.
//

module homework6_q2a_tb;

    // Signals to connect to the DUT
    logic Clock;
    logic Q;

    // Instantiate the device under test
    homework6_q2a dut (
        .Clock(Clock),
        .Q(Q)
    );

    // Clock generation process
    // Creates a clock with a 10ns period
    initial begin
        Clock = 0;
        forever #5 Clock = ~Clock;
    end

    // Simulation control process
    initial begin
        // Run simulation for 100ns to observe several toggle cycles
        #100;
        $finish;
    end

    // Monitor changes to the output signal
    initial begin
        // Dump waves to a file for viewing in a waveform viewer like GTKWave
        $dumpfile("q2a_waves.vcd");
        $dumpvars(0, homework6_q2a_tb);
        
        // Also print to console
        $monitor("Time=%0t ns, Clock=%b, Q=%b", $time, Clock, Q);
    end

endmodule
