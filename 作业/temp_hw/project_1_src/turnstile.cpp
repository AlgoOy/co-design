#include "turnstile.h"
void turnstile(ap_int<1> *lock, ap_int<1> *pass, ap_int<1> *brush){
#pragma HLS INTERFACE mode=ap_hs port=brush
#pragma HLS INTERFACE mode=ap_hs port=pass
#pragma HLS INTERFACE mode=ap_hs port=lock
#pragma HLS INTERFACE mode=ap_ctrl_hs port=return
    if(*lock == 1 && *brush == 1){
        *lock = 0;
        *brush = 0;
    }
    else if(*lock == 0 && *pass == 1){
        *lock = 1;
        *pass = 0;
    }
}
