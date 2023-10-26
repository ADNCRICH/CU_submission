set_property PACKAGE_PIN L1 [get_ports {led[3]}]
set_property PACKAGE_PIN P1 [get_ports {led[2]}]
set_property PACKAGE_PIN N3 [get_ports {led[1]}]
set_property PACKAGE_PIN P3 [get_ports {led[0]}]
set_property PACKAGE_PIN W5 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -period 10.000 -name myClock -waveform {0.000 5.000} [get_ports -filter { NAME =~  "*" && DIRECTION == "IN" }]

set_property PACKAGE_PIN V14 [get_ports l7]
set_property IOSTANDARD LVCMOS33 [get_ports l7]
