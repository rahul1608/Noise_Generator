module tb_top;

	// Inputs
	reg CLK_100MHZ;
	reg reset;

	// Outputs
	wire [15:0] X0;
	wire [15:0] X1;
	wire  valid;

	//waveform generator
	localparam FALSE = 1'b0;
	localparam TRUE = 1'b1;
	reg      start;

initial
begin
   start = FALSE;
   $write("Starting sim");
   CLK_100MHZ = 1'b0;
   reset = 1'b1;	

   #1000;
  
   reset = 1'b0;
   start = TRUE;
   
   #10000
   $write("Simulation has finished");
   $stop;
end
 top_module sin_cos (CLK_100MHZ, reset, X0, X1, valid);

parameter CLK100_SPEED = 10;  // 100Mhz = 10nS

initial
begin
  CLK_100MHZ = 1'b0;
  $display ("CLK_100MHZ started");
  #5;
  forever
  begin
    #(CLK100_SPEED/2) CLK_100MHZ = 1'b1;
    #(CLK100_SPEED/2) CLK_100MHZ = 1'b0;
  end
end
endmodule