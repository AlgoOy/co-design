#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("lock", 1, hls_in, 0, "ap_hs", "in_data", 1),
	Port_Property("lock_ap_vld", 1, hls_in, 0, "ap_hs", "in_vld", 1),
	Port_Property("lock_ap_ack", 1, hls_out, 0, "ap_hs", "in_acc", 1),
	Port_Property("pass", 1, hls_in, 1, "ap_hs", "in_data", 1),
	Port_Property("pass_ap_vld", 1, hls_in, 1, "ap_hs", "in_vld", 1),
	Port_Property("pass_ap_ack", 1, hls_out, 1, "ap_hs", "in_acc", 1),
	Port_Property("brush", 1, hls_in, 2, "ap_hs", "in_data", 1),
	Port_Property("brush_ap_vld", 1, hls_in, 2, "ap_hs", "in_vld", 1),
	Port_Property("brush_ap_ack", 1, hls_out, 2, "ap_hs", "in_acc", 1),
};
const char* HLS_Design_Meta::dut_name = "turnstile";
