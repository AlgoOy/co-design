
log_wave [get_objects -filter {type == in_port || type == out_port || type == inout_port || type == port} /apatb_turnstile_top/AESL_inst_turnstile/*]
set designtopgroup [add_wave_group "Design Top Signals"]
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set return_group [add_wave_group return(wire) -into $cinputgroup]
add_wave /apatb_turnstile_top/AESL_inst_turnstile/brush_ap_ack -into $return_group -color #ffff00 -radix hex
add_wave /apatb_turnstile_top/AESL_inst_turnstile/brush_ap_vld -into $return_group -color #ffff00 -radix hex
add_wave /apatb_turnstile_top/AESL_inst_turnstile/brush -into $return_group -radix hex
add_wave /apatb_turnstile_top/AESL_inst_turnstile/pass_ap_ack -into $return_group -color #ffff00 -radix hex
add_wave /apatb_turnstile_top/AESL_inst_turnstile/pass_ap_vld -into $return_group -color #ffff00 -radix hex
add_wave /apatb_turnstile_top/AESL_inst_turnstile/pass -into $return_group -radix hex
add_wave /apatb_turnstile_top/AESL_inst_turnstile/lock_ap_ack -into $return_group -color #ffff00 -radix hex
add_wave /apatb_turnstile_top/AESL_inst_turnstile/lock_ap_vld -into $return_group -color #ffff00 -radix hex
add_wave /apatb_turnstile_top/AESL_inst_turnstile/lock -into $return_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_turnstile_top/AESL_inst_turnstile/ap_start -into $blocksiggroup
add_wave /apatb_turnstile_top/AESL_inst_turnstile/ap_done -into $blocksiggroup
add_wave /apatb_turnstile_top/AESL_inst_turnstile/ap_idle -into $blocksiggroup
add_wave /apatb_turnstile_top/AESL_inst_turnstile/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_turnstile_top/AESL_inst_turnstile/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_turnstile_top/AESL_inst_turnstile/ap_clk -into $clockgroup
save_wave_config turnstile.wcfg
run all
quit

