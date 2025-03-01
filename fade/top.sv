`include "fade.sv"
`include "pwm.sv"


// Fade top level module

module top #(
    parameter PWM_INTERVAL = 1200       // CLK frequency is 12MHz, so 1,200 cycles is 100us
)(
    input logic     clk, 
    output logic    RGB_R,
    output logic    RGB_G,
    output logic    RGB_B
);

    logic [$clog2(PWM_INTERVAL) - 1:0] pwm_valueR;
    logic pwm_outR;
    logic [$clog2(PWM_INTERVAL) - 1:0] pwm_valueG;
    logic pwm_outG;
    logic [$clog2(PWM_INTERVAL) - 1:0] pwm_valueB;
    logic pwm_outB;

    //red
    fadeR #(
        .PWM_INTERVAL   (PWM_INTERVAL)
    ) u0R (
        .clk            (clk), 
        .pwm_valueR      (pwm_valueR)
    );

    pwmR #(
        .PWM_INTERVAL   (PWM_INTERVAL)
    ) u1R (
        .clk            (clk), 
        .pwm_valueR      (pwm_valueR), 
        .pwm_outR        (pwm_outR)
    );

    //green

    fadeG #(
        .PWM_INTERVAL   (PWM_INTERVAL)
    ) u0G (
        .clk            (clk), 
        .pwm_valueG      (pwm_valueG)
    );

    pwmG #(
        .PWM_INTERVAL   (PWM_INTERVAL)
    ) u1G (
        .clk            (clk), 
        .pwm_valueG      (pwm_valueG), 
        .pwm_outG        (pwm_outG)
    );

    //blue
    fadeB #(
        .PWM_INTERVAL   (PWM_INTERVAL)
    ) u0B (
        .clk            (clk), 
        .pwm_valueB      (pwm_valueB)
    );

    pwmB #(
        .PWM_INTERVAL   (PWM_INTERVAL)
    ) u1B (
        .clk            (clk), 
        .pwm_valueB      (pwm_valueB), 
        .pwm_outB        (pwm_outB)
    );
  
    assign {RGB_R} = ~pwm_outR;
    assign {RGB_G} = ~pwm_outG;
    assign {RGB_B} = ~pwm_outB;
    //assign {RGB_R, RGB_B} = 2'b00;

endmodule


