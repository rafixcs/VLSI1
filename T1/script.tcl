vlib work

vcom rcv_fsm.vhd
vcom fsm_tb.vhd

vsim -novopt -wlf /sim/decoder -wlfdeleteonquit work.fsm_tb

add wave sim:/*

run 2000 ns
