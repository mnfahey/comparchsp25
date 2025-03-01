// PWM generator to fade LED

module pwmR #(
    parameter PWM_INTERVAL = 1200       // CLK frequency is 12MHz, so 1,200 cycles is 100us
)(
    input logic clk, 
    input logic [$clog2(PWM_INTERVAL) - 1:0] pwm_valueR, 
    output logic pwm_outR
);

    // Declare PWM generator counter variable
    logic [$clog2(PWM_INTERVAL) - 1:0] pwm_countR = 0;

    // Implement counter for timing state transitions
    always_ff @(posedge clk) begin
        if (pwm_countR == PWM_INTERVAL - 1) begin
            pwm_countR <= 0;
        end
        else begin
            pwm_countR <= pwm_countR + 1;
        end
    end

    // Generate PWM output signal
    assign pwm_outR = (pwm_countR > pwm_valueR) ? 1'b0 : 1'b1;

endmodule

module pwmG #(
    parameter PWM_INTERVAL = 1200       // CLK frequency is 12MHz, so 1,200 cycles is 100us
)(
    input logic clk, 
    input logic [$clog2(PWM_INTERVAL) - 1:0] pwm_valueG, 
    output logic pwm_outG
);

    // Declare PWM generator counter variable
    logic [$clog2(PWM_INTERVAL) - 1:0] pwm_countG = 0;

    // Implement counter for timing state transitions
    always_ff @(posedge clk) begin
        if (pwm_countG == PWM_INTERVAL - 1) begin
            pwm_countG <= 0;
        end
        else begin
            pwm_countG <= pwm_countG + 1;
        end
    end

    // Generate PWM output signal
    assign pwm_outG = (pwm_countG > pwm_valueG) ? 1'b0 : 1'b1;

endmodule

module pwmB #(
    parameter PWM_INTERVAL = 1200       // CLK frequency is 12MHz, so 1,200 cycles is 100us
)(
    input logic clk, 
    input logic [$clog2(PWM_INTERVAL) - 1:0] pwm_valueB, 
    output logic pwm_outB
);

    // Declare PWM generator counter variable
    logic [$clog2(PWM_INTERVAL) - 1:0] pwm_countB = 0;

    // Implement counter for timing state transitions
    always_ff @(posedge clk) begin
        if (pwm_countB == PWM_INTERVAL - 1) begin
            pwm_countB <= 0;
        end
        else begin
            pwm_countB <= pwm_countB + 1;
        end
    end

    // Generate PWM output signal
    assign pwm_outB = (pwm_countB > pwm_valueB) ? 1'b0 : 1'b1;

endmodule