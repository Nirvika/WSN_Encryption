#include "math.h"

module TestCastC{


uses interface Boot;
uses interface Castelluccia;

}


implementation{



event void Boot.booted(){
int64_t m[4]= {1,3,5,6};
int64_t n = 179;
int64_t k =6;
int64_t c1;
int64_t m1;


c1=call Castelluccia.encrypt ( m,n,k,c1 );
dbg("Boot"," encryption is %d  \n" ,c1);

m1=call Castelluccia.decrypt(c1,n,k,m1);
dbg("Boot","decryption is %d \n" ,m1);
}
}
