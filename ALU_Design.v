`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2024 05:59:05 PM
// Design Name: 
// Module Name: ALU_Design
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [63:0] a,
    input [63:0] b,
    input en,
    input [2:0] opcode,
    output reg [64:0] y,
    output reg ack
);
integer i;
parameter VECTOR_SIZE = 4; // Define the size of the vector

// Define vector inputs and outputs
reg [63:0] va [0:VECTOR_SIZE-1];
reg [63:0] vb [0:VECTOR_SIZE-1];
reg [64:0] vy [0:VECTOR_SIZE-1];

always @* begin
    // Populate vector inputs
    for (i = 0; i < VECTOR_SIZE; i = i + 1) begin
        va[i] = a;
        vb[i] = b;
    end

    // Execute operations on vector inputs
    for (i = 0; i < VECTOR_SIZE; i = i + 1) begin
        if (en == 1'b1) begin
            case (opcode)
                3'd1: vy[i] = va[i] + vb[i];
                3'd2: vy[i] = va[i] - vb[i];
                3'd3: vy[i] = va[i] ^ vb[i];
                3'd4: vy[i] = va[i] & vb[i];
                3'd5: vy[i] = va[i] | vb[i];
                3'd6: vy[i] = ~(va[i] & vb[i]);
                3'd7: vy[i] = ~(va[i] | vb[i]);
                // Other cases...
                default: vy[i] = 65'dz;
            endcase
        end else begin
            vy[i] = 65'dz;
        end
    end

    // Calculate vector result
    y = vy[VECTOR_SIZE-1];
    for (i = VECTOR_SIZE-2; i >= 0; i = i - 1) begin
        y = {vy[i], y};
    end

    // Set acknowledgment signal
    ack = en;
end

endmodule

