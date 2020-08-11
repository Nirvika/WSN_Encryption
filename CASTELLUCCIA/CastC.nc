#include "math.h"

module CastC{
      provides interface Castelluccia;
      uses interface Boot;
}

implementation{

event void Boot.booted(){


} 

command int64_t Castelluccia.encrypt(int64_t *m, int64_t n, int64_t k,int64_t c){
 int64_t a ;
int8_t i ;

a=0;

for(i=0; i<=3; i++)
{
  a = ((a)+m[i]) ;

 }
   dbg("Boot", "values of a  is %d \n ",a);
   c = ( (a+k) % n );
   return c; 
 }

command int64_t Castelluccia.decrypt(int64_t c, int64_t n,int64_t k ,int64_t m){

int64_t m2;
 if(c <= k)
{
 m2 = ((c - k) % n);
  
 m= m2+n;
return m;
}

else
{

m = ((c - k) % n);
   return m;

}

}
}
