#include "turnstile.h"

ap_int<1> lock = 1;
ap_int<1> pass = 1;
ap_int<1> brush = 1;

int main(){
    turnstile(&lock, &pass, &brush);
    turnstile(&lock, &pass, &brush);
    return 0;
}