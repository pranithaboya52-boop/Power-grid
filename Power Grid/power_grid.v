module power_grid (
    input  [15:0] voltage,
    input  [15:0] current,
    input  [15:0] frequency,
    output reg normal,
    output reg over_voltage,
    output reg over_current,
    output reg frequency_fault,
    output reg grid_fault
);

always @(*) begin
    over_voltage = (voltage > 16'd250);
    over_current = (current > 16'd100);
    frequency_fault = (frequency < 16'd49 || frequency > 16'd51);

    grid_fault = over_voltage | over_current | frequency_fault;
    normal = ~grid_fault;
end

endmodule