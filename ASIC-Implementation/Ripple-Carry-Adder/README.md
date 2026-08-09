# Ripple Carry Adder – RTL to ASIC Implementation

A parameterized Ripple Carry Adder (RCA) designed using Verilog HDL and explored through RTL simulation and ASIC implementation.

## Overview

The Ripple Carry Adder is built using multiple Full Adder modules connected in a ripple-carry structure. The design is parameterized so that the bit width can be changed.

## Design Structure

```text
Inputs (A, B, Cin)
        |
        v
 Input Registers
        |
        v
 Full Adder Chain
 FA0 → FA1 → FA2 → FA3
        |
        v
 Output Register
        |
        v
       Sum

       ## RTL Files

- `rca.v` – Top-level parameterized Ripple Carry Adder
- `fa.v` – Full Adder module
- `register.v` – Parameterized register module
- `rca_tb.v` – Testbench for simulation

## ASIC Implementation

The RTL design was synthesized using Cadence Genus, and Clock Tree Synthesis (CTS) was explored using Cadence Innovus.

### Implementation Flow

```text
Verilog RTL
    ↓
RTL Simulation
    ↓
Synthesis
    ↓
Timing Constraints
    ↓
Clock Tree Synthesis (CTS)

## Timing

- Clock Period: 5 ns
- Clock Frequency: 200 MHz

## Tools

- Verilog HDL
- Xilinx Vivado
- Cadence Genus
- Cadence Innovus

## Repository Structure

```text
Ripple-Carry-Adder/
├── RTL/
│   ├── rca.v
│   ├── fa.v
│   └── register.v
│
├── Testbench/
│   └── rca_tb.v
│
└── ASIC/
    ├── Synthesis/
    │   └── run.tcl
    ├── Constraints/
    │   └── constraint_top.sdc
    └── CTS/
        └── cts.tcl
