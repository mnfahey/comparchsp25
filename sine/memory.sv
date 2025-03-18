// Sample memory module

module memory_mod (
    input logic     clk,
    input logic     [6:0] read_address,
    output logic    [8:0] read_data
);

    // Declare memory array for storing 128 9-bit samples of a sine function
    logic [8:0] memory_9bit [0:127];

    initial begin
        $readmemh("sine.txt", memory_9bit);
    end

    assign read_data = memory_9bit[read_address];

endmodule