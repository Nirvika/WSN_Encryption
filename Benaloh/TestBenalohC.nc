#include "Benaloh.h"
#include "math.h"

module TestBenalohC{
        uses interface Boot;
        uses interface Benaloh;
}

implementation{

uint32_t in = {0x12};
uint32_t in2= {0x10};
uint32_t out,out2 ;


event void Boot.booted()
        {

          uint32_t g1={0x01};
          uint32_t z1={0x02};

          uint32_t p = 7;
          uint32_t q = 5;
          uint32_t y = 2;
          uint32_t g,z,x,f,h,d;

      g=call Benaloh.encrypt(in,y,p,q,out);
      z=call Benaloh.encrypt(in2,y,p,q,out2);
          dbg("Boot", "%02x \n", g);
          dbg("Boot", "%02x \n", z);
   
      h=call Benaloh.decrypt(g1,y,p,q,x);
      d=call Benaloh.decrypt(z1,y,p,q,f);      
          dbg("Boot", "%02x \n",h);
          dbg("Boot", "%02x \n",d);     

        }
}



