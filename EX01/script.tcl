vlib work

vcom decoder_scancode_ascii_map.vhd
vcom decoder_scancode_ascii_golden.vhd
vcom decoder_testbench.vhd

vsim -novopt -wlf /sim/decoder -wlfdeleteonquit work.decoder_testbench

add wave sim:/*

run 500 ns