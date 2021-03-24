`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2021 06:58:51 PM
// Design Name: 
// Module Name: test_array
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


module test_array();

localparam STEP 	= 8;
localparam TEST_TIME = (8);

reg CLOCK;
reg RESET;

always begin
	CLOCK = 0; #(STEP/2);
	CLOCK = 1; #(STEP/2);
end


logic [7:0] DATA[8][8];
logic [7:0] OUT_DATA[8];


parent_array parent_array_inst(
	.CLOCK(CLOCK),
	.RESET(RESET),
	.DATA(DATA),
	.OUT_DATA(OUT_DATA)
);


initial begin
	int i,j;
	for(i=0;i<8;i++) begin
		for(j=0;j<8;j++) begin
			DATA[i][j] <= i*8 + j;
		end
	end
	RESET = 1'b1;
	#STEP;
	RESET = 1'b0;
	#TEST_TIME;
	for(i=0;i<8;i++) begin
		$display (OUT_DATA[i]);
		
	end

	$finish;
end

endmodule
