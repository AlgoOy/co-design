#include "vender.h"
void balance(ap_int<3> *sum, ap_int<2> cash, ap_int<2> *tissue){
	if(*sum == 0){
		switch(cash){
		case 0:
			*sum = 0;
			break;
		case 1:
			*sum = 1;
			break;
		case 2:
			*sum = 2;
			break;
		}
	}
	else if(*sum == 1){
		switch(cash){
		case 0:
			*sum = 1;
			break;
		case 1:
			*sum = 2;
			break;
		case 2:
			*sum = 3;
			*tissue = 1;
			*sum = 0;
			break;
		}
	}
	else if(*sum == 2){
		switch(cash){
		case 0:
			*sum = 2;
			break;
		case 1:
			*sum = 3;
			*tissue = 1;
			*sum = 0;
			break;
		case 2:
			*sum = 4;
			*tissue = 1;
			*sum = 0;	//ÎŞÕÒÁã¹¦ÄÜ
			break;
		}
	}
}
