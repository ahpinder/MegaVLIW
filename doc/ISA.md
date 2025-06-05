# Instruction Set Architecture (ISA) for MegaVLIW Processor

MegaVLIW uses a custom RISC ISA optimized for simplicity and vector / DSP performance.
Most instructions are similar to RISC-V equivalents.

## VLIW format

MegaVLIW executes mutltiple (typically 4) instructions in parallel following the Very Long Instruction Word (VLIW) paradigm.

## Instructions
```
ADD RD RS1 RS2   # RD = RS1 + RS2
ADDI RD RS1 IMM   # RD = RS1 + IMM
SUB RD RS1 RS2   # RD = RS1 - RS2
```

## Registers

To start, there are 32 32-bit registers, R0-R31
