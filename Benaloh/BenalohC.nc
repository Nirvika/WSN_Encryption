#include "Benaloh.h"
#include "math.h" 


module BenalohC{
      provides interface Benaloh;
      uses interface Boot;
}

implementation{
uint32_t u = 3;
uint32_t gcd(uint32_t a, uint32_t b)
 {
  if (a==0)
  {
  return b;
  }

  else
  {
   while (!b == 0)
      {
        if (a>b)
        {
          a=(a-b);
         }
        else
        {
         b=(b-a);
        }
      } 
   return a;
   }

  } 



event void Boot.booted(){ 
  uint32_t p, q, y;

 if ( ((p-1) % R_SIZE) == 0 ) {
    dbg("Boot", "(p-1)% R condition is correct " );
 
        if ( gcd(R_SIZE, ((p-1)/R_SIZE)) ==1 ) {
           dbg("Boot","GCD condition for p and R is correct");
    
            if( gcd((q-1),R_SIZE) == 1 ) {
                                        
               uint32_t k = (((p)-1) * ((q)-1)/ R_SIZE);
               uint32_t l = pow((y),k);
               uint32_t m = (l % (p*q)) ; 
                 
               dbg("Boot", "GCD condition for q and r is correct") ;
             
                 if (m != 1 ){               
                                
                    dbg("Boot", "PUBLIC KEY -- y and n");

                    dbg("Boot", "PRIVATE KEY --  p and q");
                     
                                           
                  }   
              }     
        }
}


else {
     dbg("Boot", "check values for p and q"); 
     }
 }  

command uint32_t Benaloh.encrypt(uint32_t in , uint32_t y, uint32_t p, uint32_t q , uint32_t out){


  uint32_t i = pow( y, in);
  uint32_t j = pow(u, R_SIZE);
  uint32_t s = (i*j);
  uint32_t f = ((p) * (q)) ;
   out = ((s)%(f));
   return out; 
}




command uint32_t Benaloh.decrypt(uint32_t in,uint32_t y, uint32_t p, uint32_t q , uint32_t out){

  uint32_t i = pow( y, in);
  uint32_t j = pow( u, R_SIZE);
  uint32_t w = (i *j);
  uint32_t s = ((( p) - 1)* ((q)-1)/R_SIZE);
  uint32_t f = ( (p) * (q) );
  uint32_t g = pow(w,s);
   out = ((g)%(f)) ;  
return out;  

}

}





