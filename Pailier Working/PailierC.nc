#include "Pailier.h"
#include "math.h"
#include "stdlib.h"

uint64_t gcd(uint64_t a, uint64_t b);
uint64_t L(uint64_t x);
uint64_t lcm(uint64_t a ,uint64_t b);

module PailierC{
      provides interface Pailier;
      uses interface Boot;
}

implementation{
 
uint64_t gcd(uint64_t a, uint64_t b)
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

/*  LCM INCLUDED  */

uint64_t lcm(uint64_t a ,uint64_t b){
uint64_t u= ((a*b)/ gcd(a,b));
return u;
}




event void Boot.booted(){

  uint64_t p,h1,n,squ, q,g,c,e,l,y,y1,z1,i,a,h,g1,inv ;
  uint64_t *c1;
  uint64_t Z[n];


if ( gcd((p*q), ((p-1)*(q-1))) == 1){
   
   n = (p*q); 
     
     squ = pow(n,2);
     l = lcm( (p-1),(q-1) );
     e = 2;  /* SET THIS VALUE */
     c = pow(e,l);
     y = (c % squ);
    
       if ( gcd( ((y-1)/n), n ) == 1){
          g  = e ;
          z1 = ((y1-1)/n );

           for(i=1;i<= (n-1) ; i++)
            {
             g1 = gcd(i,n);
             if ( g1 ==1)
               {

                Z[i]= (i);
               
                 }
              }

          for(i=1 ;i<= (n-1) ;i++)
              {
              if (z1 != Z[i])
               {
                 a = 1;
                }
               }

         for(i=1 ;i<= (n-1) ;i++)
           {
            if (z1 == Z[i])
            {
            a = 2;
            }
           }


switch(a)
{
case 1:

{
   break;
}

case 2:
{
for(i=1 ;i<= (n-1) ;i++)
        {
         inv  = ((z1 * i) % n );

          if (inv ==1)
            {
             h =i;
               }
          }
 break;
}
}

}
}
 
else 
  {
  dbg("Boot", "Check values");
   }
 
} 


command uint64_t Pailier.encrypt(uint64_t in , uint64_t g, uint64_t n , uint64_t out){

  uint64_t  *m, *s;
 uint64_t squ ;
 s=(uint64_t*)malloc(sizeof(uint64_t)*10);  /*CHECK */
 m=(uint64_t*)malloc(sizeof(uint64_t)*5); /*CHECK */
  
 *m = pow(g,in)  ;
 /* dbg("Boot","**value of m in encryption is %lld \n", *m); PRINT */
 
 *s =  pow(R_SIZE,n) ; 
 /* dbg("Boot","**value of s in encryption  is %lld \n" , *s); PRINT */
 
 squ= pow(n,2);
  /* dbg("Boot","** square in %u  \n", squ); PRINT */
 
out= (( (*m) * (*s)) % squ);
 return out;
 
 free(s);
 free(m);
}


command uint64_t Pailier.decrypt(uint64_t de , uint64_t g,uint64_t h, uint64_t p,uint64_t q , uint64_t out){

  uint64_t *m1 ;
  uint64_t squ,a,w,n,l;
  n =(p*q);

  m1=(uint64_t*)malloc(sizeof(uint64_t)*6);  /*CHECK */

  squ = pow(n,2);
  l   = lcm(2,4 ) ;
  /* dbg("Boot", "** value of a lcm in decr  function %ld \n", l); PRINT */

 * m1 = pow(de,l);
  /*  dbg("Boot", "** value of a m1 function %lld \n", *m1); PRINT */

 a = (( (*m1) % squ)-1 );
  /* dbg("Boot", "** value of a function %ld \n", a); PRINT */

 w = (a/(n));
 /* dbg("Boot", "** value of w %ld \n", w); PRINT */

 out= (w * h) % (n);
 return out;

}
  
} /*THIS } IS FOR IMPLEMENTATION */       

      
