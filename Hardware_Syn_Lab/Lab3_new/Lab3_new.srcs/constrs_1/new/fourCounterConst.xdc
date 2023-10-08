set_property PACKAGE_PIN W4 [get_ports {anode[3]}]
set_property PACKAGE_PIN V4 [get_ports {anode[2]}]
set_property PACKAGE_PIN U4 [get_ports {anode[1]}]
set_property PACKAGE_PIN U2 [get_ports {anode[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {anode[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {out[6]}]
set_property PACKAGE_PIN U7 [get_ports {out[0]}]
set_property PACKAGE_PIN V5 [get_ports {out[1]}]
set_property PACKAGE_PIN U5 [get_ports {out[2]}]
set_property PACKAGE_PIN V8 [get_ports {out[3]}]
set_property PACKAGE_PIN U8 [get_ports {out[4]}]
set_property PACKAGE_PIN W6 [get_ports {out[5]}]
set_property PACKAGE_PIN W7 [get_ports {out[6]}]
set_property PACKAGE_PIN R2 [get_ports {sw[0]}]
set_property PACKAGE_PIN T1 [get_ports {sw[1]}]
set_property PACKAGE_PIN U1 [get_ports {sw[2]}]
set_property PACKAGE_PIN W2 [get_ports {sw[3]}]
set_property PACKAGE_PIN R3 [get_ports {sw[4]}]
set_property PACKAGE_PIN T2 [get_ports {sw[5]}]
set_property PACKAGE_PIN T3 [get_ports {sw[6]}]
set_property PACKAGE_PIN V2 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]

set_property PACKAGE_PIN W5 [get_ports clock]
set_property PACKAGE_PIN T18 [get_ports btnu]
set_property PACKAGE_PIN U18 [get_ports btnc]
set_property IOSTANDARD LVCMOS33 [get_ports btnu]
set_property IOSTANDARD LVCMOS33 [get_ports btnc]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -period 10.000 -name myClock -waveform {0.000 5.000} [get_ports clock]

