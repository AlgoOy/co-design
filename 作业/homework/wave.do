onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sequence_moore_tb/zero
add wave -noupdate /sequence_moore_tb/one
add wave -noupdate /sequence_moore_tb/clk
add wave -noupdate /sequence_moore_tb/reset
add wave -noupdate /sequence_moore_tb/out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17200 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 113
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1187900 ps}
