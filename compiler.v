
set link_library {   *    lsi_10k.db }
set target_library {  lsi_10k.db  } 
read_file -format sverilog -rtl AWGN.sv
create_clock clk -period 100
set_input_delay -clock clk 0 [all_inputs]
set_output_delay -clock clk 0 [all_outputs]
compile
report_area -out 
report_timing
report_resources
write -f verilog -hier -out AWGN_NETLIST.v
quit