`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2021 07:17:37 PM
// Design Name: 
// Module Name: parent_array
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


module parent_array(
	input CLOCK,
	input RESET,
	input [7:0] DATA[8][8],
	output [7:0] OUT_DATA[8]
    );

genvar i;
generate
	for(i=0;i<8;i=i+1) begin
		array array_inst(
			.clock(CLOCK),
			.reset(RESET),
			.data(DATA[i]),
			.out_data(OUT_DATA[i])
		);
	end
endgenerate


endmodule
