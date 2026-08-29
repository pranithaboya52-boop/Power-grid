# Power Grid Monitoring System

## Description
A Verilog-based Power Grid Monitoring System designed to monitor voltage, current, frequency, and detect abnormal grid conditions.

## Features
- Voltage monitoring
- Current monitoring
- Frequency monitoring
- Over-voltage detection
- Over-current detection
- Grid fault indication
- Simulation using Icarus Verilog and GTKWave

## Software Required
- VS Code
- Icarus Verilog
- GTKWave

## Project Files
- `power_grid.v` – Main Verilog design
- `power_grid_tb.v` – Testbench
- `simulation/power_grid.vcd` – Simulation waveform
- `expected_output.txt` – Expected simulation results

## Simulation
Compile the design and testbench using:

iverilog -o power_grid_sim power_grid.v power_grid_tb.v

Run the simulation:

vvp power_grid_sim

Generate waveform:

gtkwave power_grid.vcd

## Expected Result
The system indicates NORMAL operation when voltage, current, and frequency are within limits. It generates a FAULT indication when abnormal conditions such as over-voltage or over-current are detected.