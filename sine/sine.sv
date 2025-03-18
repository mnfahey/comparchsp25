`include "memory.sv"
`include "sine_tb.sv"

module state_switch #(
    parameter max = 128
)(
    input logic clk,
    output logic [9:0] data
);

    logic [0:0] direction = 1; // 1 = increasing, 0 = decreasing
    logic [0:0] shift = 0; // 0 = below, 1 = above
    logic [1:0] state = 0;
    logic [6:0] address = 0;
    logic [6:0] counter = 0;
    logic [8:0] data_9;

    memory memory_mod (
        .clk            (clk), 
        .read_address   (address), 
        .read_data      (data_9)
    );

    always_ff @(posedge clk) begin
        if (counter == max - 1) begin
            counter <= 0;
            state <= state + 1;
        end
        else begin
            counter <= counter + 1;
        end
    end

    always_comb @(posedge clk) begin
        case (state) 
            2'd0: begin
                direction = 1;
                shift = 0;
            end
            2'd1: begin
                direction = 0;
                shift = 1;
            end
            2'd2: begin
                direction = 1;
                shift = 1;
            end
            2'd3: begin
                direction = 0;
                shift = 0;
            end
        endcase
    end

    always_ff @(posedge clk) begin
        if (direction == 1) begin
            address <= counter;
        end
        if (direction == 0) begin
            address <= 7'd127 - counter;
        end
    end

    always_ff @(posedge clk) begin
        if (shift == 0) begin
            data <= data_9 - 10'd512;
        end
        if (shift == 1) begin
            data <= data_9 + 10'd512;
        end
    end

    always_ff @(posedge clk) begin
        if (counter == 7'd127) begin
            state <= state + 1;
        end
    end

endmodule

// Sine top-level module

module top #(
    parameter max = 128
)(
    input logic     clk, 
    output logic    _9b,    // D0
    output logic    _6a,    // D1
    output logic    _4a,    // D2
    output logic    _2a,    // D3
    output logic    _0a,    // D4
    output logic    _5a,    // D5
    output logic    _3b,    // D6
    output logic    _49a,   // D7
    output logic    _45a,   // D8
    output logic    _48b    // D9
);

    logic [9:0] out;
    
    state_switch #(
        .max  (max)
    ) u2 (
        .clk(clk),
        .data(out)
    );

    assign {_48b, _45a, _49a, _3b, _5a, _0a, _2a, _4a, _6a, _9b} = out;

endmodule