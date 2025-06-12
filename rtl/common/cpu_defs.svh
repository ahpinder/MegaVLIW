`ifndef CPU_DEFS_H
`define CPU_DEFS_H

typedef enum logic[5:0] {
    NOP = 6'b00000,
    ADD = 6'b00001,
    SUB = 6'b00010,
    AND = 6'b00011,
    OR = 6'b00100,
    XOR = 6'b00101
} opcode_t;

typedef struct packed {
    opcode_t  opcode;  // Operation type
    logic [4:0]  rs1;     // Source register 1
    logic [31:0] rs1_val; // Source register 1 value
    logic [4:0]  rs2;     // Source register 2
    logic  [31:0] rs2_val; // Source register 2 value
    logic [4:0]  rd;      // Destination register
    logic        alu_op;  // ALU enable
    logic        mem_op;  // Memory enable
} instruction_t;


`endif