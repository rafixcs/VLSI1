vlib work

vcom reg_bank.vhd
vcom reg_bank_tb.vhd

vsim -novopt -wlf /sim/decoder -wlfdeleteonquit work.reg_bank_tb

add wave sim:/*

run 3000 ns
