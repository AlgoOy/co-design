#include "vender.h"

ap_int<3> sum = 0;
ap_int<2> cash = 1;
ap_int<2> tissue = 0;

int main(){
	while(tissue != 1){
		balance(&sum, cash, &tissue);
	}
	return 0;
}
