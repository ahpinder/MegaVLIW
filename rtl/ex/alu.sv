`include "common/cpu_defs.svh"

module alu (
    input logic clk,
    input logic rst,
    input instruction_t inst_in,
    output instruction_t inst_out,
    output logic [31:0] result_out
);
    logic [31:0] a;
    logic [31:0] b;
    logic [31:0] result;
    logic [31:0] add_res;
    logic [31:0] sub_res;
    logic [31:0] and_res;
    logic [31:0] or_res;
    logic [31:0] xor_res;
    instruction_t inst_out_ff;

    always_comb begin
        a = inst_in.rs1_val;
        b = inst_in.rs2_val;
        add_res = a + b;
        sub_res = a - b;
        and_res = a & b;
        or_res = a | b;
        xor_res = a ^ b;
    end

    always_ff @( posedge clk ) begin
        if (rst) begin
            case (inst_in.opcode)
                ADD: result <= add_res;
                SUB: result <= sub_res;
                AND: result <= and_res;
                OR: result <= or_res;
                XOR: result <= xor_res;
                default: result <= 32'b0;
            endcase
            inst_out_ff <= inst_in;
        end
        else begin
            result <= 32'b0;
            inst_out_ff <= '0;
        end
    end
    assign inst_out = inst_out_ff;
    assign result_out = result;

endmodule