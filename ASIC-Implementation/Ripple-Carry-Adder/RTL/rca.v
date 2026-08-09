`timescale 1ns/1ps

module RCA #(parameter WIDTH = 4)(
    output [WIDTH:0] sum,
    input  [WIDTH-1:0] a, b,
    input clk, rst, cin
);

wire [WIDTH-1:0] a_reg, b_reg;
wire cin_reg;
wire [WIDTH:0] carry, sum_reg;

// Input registers
register #(WIDTH) R_a (
    .clk(clk),
    .rst(rst),
    .reg_in(a),
    .reg_out(a_reg)
);

register #(WIDTH) R_b (
    .clk(clk),
    .rst(rst),
    .reg_in(b),
    .reg_out(b_reg)
);

register #(1) R_cin (
    .clk(clk),
    .rst(rst),
    .reg_in(cin),
    .reg_out(cin_reg)
);

// Output register
register #(WIDTH+1) R_sum (
    .clk(clk),
    .rst(rst),
    .reg_in(sum_reg),
    .reg_out(sum)
);

// Carry connections
assign carry[0] = cin_reg;
assign sum_reg[WIDTH] = carry[WIDTH];

// Generate Full Adders
genvar i;

generate
    for (i = 0; i < WIDTH; i = i + 1) begin : FAgen

        FA FA0 (
            .A(a_reg[i]),
            .B(b_reg[i]),
            .Cin(carry[i]),
            .S(sum_reg[i]),
            .Cout(carry[i+1])
        );

    end
endgenerate

endmodule
