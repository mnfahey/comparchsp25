// Fade

// Fade

module fadeR #(
    parameter INC_DEC_INTERVAL = 12000,     // CLK frequency is 12MHz, so 12,000 cycles is 1ms
    parameter INC_DEC_MAX = 200,            // Transition to next state after 200 increments / decrements, which is 0.2s
    parameter PWM_INTERVAL = 1200,          // CLK frequency is 12MHz, so 1,200 cycles is 100us
    parameter INC_DEC_VAL = PWM_INTERVAL / INC_DEC_MAX
)(
    input logic clk, 
    output logic [$clog2(PWM_INTERVAL) - 1:0] pwm_valueR
);

    // Define state variable values
    localparam PWM_INC = 1'b0;
    localparam PWM_DEC = 1'b1;

    // Declare state variables
    logic current_stateR = PWM_INC;
    logic next_stateR;

    // Declare counter variable for the PWM value
    logic [$clog2(PWM_INTERVAL) - 1:0] pwm_countR = 0;

    // Declare variables for timing state transitions
    logic [$clog2(INC_DEC_INTERVAL) - 1:0] countR = 0;
    logic [$clog2(INC_DEC_MAX) - 1:0] inc_dec_countR = 0;
    logic time_to_inc_decR = 1'b0;
    logic time_to_transitionR = 1'b0;

    initial begin
        pwm_valueR = 0;
    end

    // Register the next state of the FSM
    always_ff @(posedge time_to_transitionR)
        current_stateR <= next_stateR;

    // Compute the next state of the FSM
    always_comb begin
        next_stateR = 1'bx;
        case (current_stateR)
            PWM_INC:
                next_stateR = PWM_DEC;
            PWM_DEC:
                next_stateR = PWM_INC;
        endcase
    end

    // Implement counter for incrementing / decrementing PWM value
    always_ff @(posedge clk) begin
        if (countR == INC_DEC_INTERVAL - 1) begin
            countR <= 0;
            time_to_inc_decR <= 1'b1;
        end
        else begin
            countR <= countR + 1;
            time_to_inc_decR <= 1'b0;
        end
    end

    // Increment / Decrement PWM counters as appropriate given current state
    always_ff @(posedge time_to_inc_decR) begin
        case (current_stateR)
            PWM_INC:
                pwm_valueR <= pwm_valueR + INC_DEC_VAL;
            PWM_DEC:
                pwm_valueR <= pwm_valueR - INC_DEC_VAL;
        endcase
    end

    // Implement counter for timing state transitions
    always_ff @(posedge time_to_inc_decR) begin
        if (inc_dec_countR == INC_DEC_MAX - 1) begin
            inc_dec_countR <= 0;
            time_to_transitionR <= 1'b1;
        end
        else begin
            inc_dec_countR <= inc_dec_countR + 1;
            time_to_transitionR <= 1'b0;
        end
    end

endmodule


module fadeG #(
    parameter INC_DEC_INTERVAL = 12000,     // CLK frequency is 12MHz, so 12,000 cycles is 1ms
    parameter INC_DEC_MAX = 200,            // Transition to next state after 200 increments / decrements, which is 0.2s
    parameter PWM_INTERVAL = 1200,          // CLK frequency is 12MHz, so 1,200 cycles is 100us
    parameter INC_DEC_VAL = PWM_INTERVAL / INC_DEC_MAX
)(
    input logic clk, 
    output logic [$clog2(PWM_INTERVAL) - 1:0] pwm_valueG
);

    // Define state variable values
    localparam PWM_INC = 1'b0;
    localparam PWM_DEC = 1'b1;

    // Declare state variables
    logic current_stateG = PWM_INC;
    logic next_stateG;

    // Declare counter variable for the PWM value
    logic [$clog2(PWM_INTERVAL) - 1:0] pwm_countG = 0;

    // Declare variables for timing state transitions
    logic [$clog2(INC_DEC_INTERVAL) - 1:0] countG = 0;
    logic [$clog2(INC_DEC_MAX) - 1:0] inc_dec_countG = 67;
    logic time_to_inc_decG = 1'b0;
    logic time_to_transitionG = 1'b0;

    initial begin
        pwm_valueG = 0;
    end

    // Register the next state of the FSM
    always_ff @(posedge time_to_transitionG)
        current_stateG <= next_stateG;

    // Compute the next state of the FSM
    always_comb begin
        next_stateG = 1'bx;
        case (current_stateG)
            PWM_INC:
                next_stateG = PWM_DEC;
            PWM_DEC:
                next_stateG = PWM_INC;
        endcase
    end

    // Implement counter for incrementing / decrementing PWM value
    always_ff @(posedge clk) begin
        if (countG == INC_DEC_INTERVAL - 1) begin
            countG <= 0;
            time_to_inc_decG <= 1'b1;
        end
        else begin
            countG <= countG + 1;
            time_to_inc_decG <= 1'b0;
        end
    end

    // Increment / Decrement PWM counters as appropriate given current state
    always_ff @(posedge time_to_inc_decG) begin
        case (current_stateG)
            PWM_INC:
                pwm_valueG <= pwm_valueG + INC_DEC_VAL;
            PWM_DEC:
                pwm_valueG <= pwm_valueG - INC_DEC_VAL;
        endcase
    end

    // Implement counter for timing state transitions
    always_ff @(posedge time_to_inc_decG) begin
        if (inc_dec_countG == INC_DEC_MAX - 1) begin
            inc_dec_countG <= 0;
            time_to_transitionG <= 1'b1;
        end
        else begin
            inc_dec_countG <= inc_dec_countG + 1;
            time_to_transitionG <= 1'b0;
        end
    end

endmodule



module fadeB #(
    parameter INC_DEC_INTERVAL = 12000,     // CLK frequency is 12MHz, so 12,000 cycles is 1ms
    parameter INC_DEC_MAX = 200,            // Transition to next state after 200 increments / decrements, which is 0.2s
    parameter PWM_INTERVAL = 1200,          // CLK frequency is 12MHz, so 1,200 cycles is 100us
    parameter INC_DEC_VAL = PWM_INTERVAL / INC_DEC_MAX
)(
    input logic clk, 
    output logic [$clog2(PWM_INTERVAL) - 1:0] pwm_valueB
);

    // Define state variable values
    localparam PWM_INC = 1'b0;
    localparam PWM_DEC = 1'b1;

    // Declare state variables
    logic current_stateB = PWM_INC;
    logic next_stateB;

    // Declare counter variable for the PWM value
    logic [$clog2(PWM_INTERVAL) - 1:0] pwm_countB = 0;

    // Declare variables for timing state transitions
    logic [$clog2(INC_DEC_INTERVAL) - 1:0] countB = 0;
    logic [$clog2(INC_DEC_MAX) - 1:0] inc_dec_countB = 133;
    logic time_to_inc_decB = 1'b0;
    logic time_to_transitionB = 1'b0;

    initial begin
        pwm_valueB = 0;
    end

    // Register the next state of the FSM
    always_ff @(posedge time_to_transitionB)
        current_stateB <= next_stateB;

    // Compute the next state of the FSM
    always_comb begin
        next_stateB = 1'bx;
        case (current_stateB)
            PWM_INC:
                next_stateB = PWM_DEC;
            PWM_DEC:
                next_stateB = PWM_INC;
        endcase
    end

    // Implement counter for incrementing / decrementing PWM value
    always_ff @(posedge clk) begin
        if (countB == INC_DEC_INTERVAL - 1) begin
            countB <= 0;
            time_to_inc_decB <= 1'b1;
        end
        else begin
            countB <= countB + 1;
            time_to_inc_decB <= 1'b0;
        end
    end

    // Increment / Decrement PWM counters as appropriate given current state
    always_ff @(posedge time_to_inc_decB) begin
        case (current_stateB)
            PWM_INC:
                pwm_valueB <= pwm_valueB + INC_DEC_VAL;
            PWM_DEC:
                pwm_valueB <= pwm_valueB - INC_DEC_VAL;
        endcase
    end

    // Implement counter for timing state transitions
    always_ff @(posedge time_to_inc_decB) begin
        if (inc_dec_countB == INC_DEC_MAX - 1) begin
            inc_dec_countB <= 0;
            time_to_transitionB <= 1'b1;
        end
        else begin
            inc_dec_countB <= inc_dec_countB + 1;
            time_to_transitionB <= 1'b0;
        end
    end

endmodule

