module mux4x1_6bit_tb;

    // Inputs
    reg [5:0] in0;
    reg [5:0] in1;
    reg [5:0] in2;
    reg [5:0] in3;
    reg [1:0] sel;

    // Output
    wire [5:0] out;

    // Instantiate the Unit Under Test (UUT)
    mux4x1_6bit uut (
        .in0(in0), 
        .in1(in1), 
        .in2(in2), 
        .in3(in3), 
        .sel(sel), 
        .out(out)
    );

    // Test sequence
    initial begin
        // Monitor values for debugging
        $monitor("sel=%b, in0=%b, in1=%b, in2=%b, in3=%b, out=%b", sel, in0, in1, in2, in3, out);
        
        // Test case 1: Select in0
        in0 = 6'b000001; in1 = 6'b000010; in2 = 6'b000011; in3 = 6'b000100;
        sel = 2'b00; // Select in0
        #10;

        // Test case 2: Select in1
        sel = 2'b01; // Select in1
        #10;

        // Test case 3: Select in2
        sel = 2'b10; // Select in2
        #10;

        // Test case 4: Select in3
        sel = 2'b11; // Select in3
        #10;

        // Test case 5: Check default case (not typically used)
        sel = 2'bxx; // Invalid case, but will default to 6'b000000
        #10;

        // Finish the simulation
        $finish;
    end

endmodule


