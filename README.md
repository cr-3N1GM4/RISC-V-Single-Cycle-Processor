# RISC-V Single-Cycle Processor

A synthesizable 32-bit RISC-V processor implemented in Verilog, supporting a subset of the RV32I instruction set architecture (ISA).

The processor follows a single-cycle datapath design where each instruction completes in one clock cycle. The design includes a modular datapath, control unit, instruction/data memory, register file, ALU, and a verification testbench.

---

## Features

* 32-bit RISC-V processor
* Single-cycle datapath architecture
* RV32I instruction subset support
* Arithmetic and logical operations
* Memory load/store instructions
* Branch instruction support
* Modular Verilog implementation
* Synthesizable hardware design
* Functional verification through simulation

---

## Supported Instructions

### R-Type

* ADD
* SUB
* AND
* OR
* XOR
* SLL
* SRL
* SRA
* SLT
* SLTU

### I-Type

* ADDI
* Immediate arithmetic operations

### S-Type

* SW

### B-Type

* BEQ

### Memory Operations

* LW
* SW

---

## Processor Architecture

```text
                +----------------+
                | Program Counter|
                +-------+--------+
                        |
                        v
                +----------------+
                | Instruction Mem|
                +-------+--------+
                        |
                        v
                +----------------+
                | Control Unit   |
                +-------+--------+
                        |
         +--------------+--------------+
         |                             |
         v                             v
+----------------+          +----------------+
| Register File  |          | Immediate Gen  |
+--------+-------+          +--------+-------+
         |                           |
         +------------+--------------+
                      |
                      v
                +------------+
                |    ALU     |
                +------+-----+
                       |
                       v
                +------------+
                | Data Memory|
                +------+-----+
                       |
                       v
                Write Back
```

---

## Repository Structure

```text
RISCV-SingleCycle-Processor/
│
├── riscvsinglecycle.v      # Top-level CPU integration
├── PC1.v                   # Program Counter
├── IMR.v                   # Instruction Memory
├── registerfile.v          # Register File
├── ALU.v                   # Arithmetic Logic Unit
├── controlunit.v           # Control Logic
├── extDm.v                 # Immediate Generator
├── datamem.v               # Data Memory
│
├── program.mem             # Instruction Memory Image
├── DataMemory.mem          # Data Memory Initialization
│
├── tb_try3.v               # Verification Testbench
│
└── README.md
```

---

## Major Components

### Program Counter

* Maintains instruction address
* Supports sequential execution and branch targets

### Instruction Memory

* Fetches instructions from memory
* Uses hexadecimal program initialization

### Control Unit

* Decodes instruction opcodes
* Generates control signals for datapath operation

### Register File

* 32 general-purpose registers
* Dual-read, single-write architecture

### ALU

Supports:

* Arithmetic operations
* Logical operations
* Comparisons
* Shift operations

### Immediate Generator

* Extracts immediates from instruction formats
* Supports R, I, S, and B type instructions

### Data Memory

* Handles load/store operations
* Interfaces directly with ALU-generated addresses

---

## Verification

The processor was verified using a dedicated Verilog testbench featuring:

* Clock generation
* Reset sequencing
* Instruction execution tracing
* Register write monitoring
* Program memory initialization
* Data memory validation

---

## Running the Simulation

### Compile

```bash
iverilog -o cpu *.v
```

### Execute

```bash
vvp cpu
```

### Generate Waveforms

```bash
iverilog -o cpu *.v
vvp cpu
gtkwave dump.vcd
```

---

## Learning Outcomes

* Computer Architecture
* RISC-V ISA
* Verilog HDL Design
* Datapath Design
* Control Logic Implementation
* Hardware Verification
* Processor Design
* Digital System Design

---

## Future Improvements

* Multi-cycle architecture
* Five-stage pipelining
* Hazard detection unit
* Data forwarding
* Branch prediction
* Cache hierarchy
* Full RV32I support

---

## Author

Charvit Rajani

B.Tech Electronics and Communication Engineering
Indian Institute of Technology Guwahati
