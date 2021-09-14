# inform Quartus that the clk port brings a 50MHz clock into our design so
# that timing closure on our design can be analyzed
create_clock -name clk -period "50MHz" [get_ports clk]
#create_generated_clock -name blink_clk -source [get_ports clk] -divide_by 524288 [get_nets {cnt[20]}]
# Set clock unertainty to suppress warning
derive_clock_uncertainty
# inform Quartus that the LED output port has no critical timing requirements
# it’s a single output port driving an LED, there are no timing relationships
# that are critical for this
set_false_path -from * -to [get_ports o*]