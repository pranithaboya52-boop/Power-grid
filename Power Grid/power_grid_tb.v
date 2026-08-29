`timescale 1ns/1ps

module power_grid_tb;

reg [15:0] voltage;
reg [15:0] current;
reg [15:0] frequency;

wire normal;
wire over_voltage;
wire over_current;
wire frequency_fault;
wire grid_fault;

power_grid uut (
    .voltage(voltage),
    .current(current),
    .frequency(frequency),
    .normal(normal),
    .over_voltage(over_voltage),
    .over_current(over_current),
    .frequency_fault(frequency_fault),
    .grid_fault(grid_fault)
);

initial begin
    $dumpfile("power_grid.vcd");
    $dumpvars(0, power_grid_tb);

    $display("Voltage Current Frequency | Normal OV OC FreqFault GridFault");

    // Normal condition
    voltage = 230;
    current = 80;
    frequency = 50;
    #10;

    // Over-voltage condition
    voltage = 270;
    current = 80;
    frequency = 50;
    #10;

    // Over-current condition
    voltage = 230;
    current = 120;
    frequency = 50;
    #10;

    // Frequency fault
    voltage = 230;
    current = 80;
    frequency = 47;
    #10;

    // Multiple faults
    voltage = 270;
    current = 120;
    frequency = 47;
    #10;

    $finish;
end

always @(*) begin
    #1;
    $display("%d       %d       %d       |   %b     %b  %b     %b       %b",
             voltage, current, frequency,
             normal, over_voltage, over_current,
             frequency_fault, grid_fault);
end

endmodule