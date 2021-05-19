onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /fsm_tb/clk
add wave -noupdate -radix hexadecimal /fsm_tb/rst
add wave -noupdate -radix hexadecimal /fsm_tb/data_sr
add wave -noupdate -radix hexadecimal /fsm_tb/sync
add wave -noupdate -radix hexadecimal /fsm_tb/data_plen_out
add wave -noupdate -radix hexadecimal /fsm_tb/data_pl
add wave -noupdate -radix hexadecimal /fsm_tb/sm_state
add wave -noupdate -radix hexadecimal /fsm_tb/test_byte
add wave -noupdate -radix hexadecimal /fsm_tb/test_byte_send
add wave -noupdate -radix hexadecimal /fsm_tb/index
add wave -noupdate -radix hexadecimal /fsm_tb/already_rst
add wave -noupdate -radix hexadecimal /fsm_tb/cuv/sm_state
add wave -noupdate -radix hexadecimal /fsm_tb/cuv/v_buffer
add wave -noupdate -radix hexadecimal /fsm_tb/cuv/v_payload_buff
add wave -noupdate -radix hexadecimal /fsm_tb/cuv/b_payload_get
add wave -noupdate -radix hexadecimal /fsm_tb/cuv/i_counter_payload
add wave -noupdate -radix hexadecimal /fsm_tb/cuv/i_count_aligment
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1701 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 232
configure wave -valuecolwidth 78
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1460 ns} {1988 ns}
