#include "Pailier.h"
#include "math.h"
#include "stdlib.h"

module TestPailierC{
        uses interface Boot;
        uses interface Pailier;
        
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


uint64_t lcm(uint64_t a ,uint64_t b){
uint64_t u= ((a*b)/ gcd(a,b));
return u;
}



event void Boot.booted()
  {
     uint64_t in1=1;
     uint64_t in2=2;
     uint64_t out1,out2,g;   

     uint64_t p = 5;
     uint64_t q = 3;

     uint64_t *c ;
     uint64_t e,l,y; 

     uint64_t n=(p*q);

     uint64_t squ = pow(n,2);  
     uint64_t x,f,h,d, a,z1,i,a1,h1,g1,inv;
    uint64_t A[n];
  
   
c=(uint64_t*)malloc(sizeof(uint64_t)*10);



if ( gcd((p*q), ((p-1)*(q-1))) == 1){
   dbg("Boot", "**Condition for gcd of n and -1 is true \n"); 

  
     l = lcm( (p-1),(q-1) );
     dbg("Boot", "%ld\n",l);
     e = 2;  /* SET THIS VALUE */
     *c = pow(e,l);
     y = ((*c) % squ);

   /*   dbg("Boot", "%ld\n",y);PRINT */

       a = ((y-1)/n );
  /*    dbg("Boot", "%ld\n",a);PRINT */

        if ( gcd( a, n ) == 1){
         dbg("Boot", "**Condition for gcd of L and n is true \n");   
          g=e ;
      /*  dbg("Boot","**value of g is %ld\n",g); PRINT */

                  
           
             z1= a ;   /* ASSIGN z1 =a*/
        /*     dbg("Boot","** z1 s %ld \n",z1); PRINT */


               for(i=1; i <= (n-1) ; i++)
                {
                  g1 = gcd(i,n);
              
                  if ( g1 ==1){                 
                 A[i] = i;  
                      
                   
        /*   dbg("Boot","ARRAY FOR An A[] IS %ld \n", A[i]); PRINT */

                    }
                  }
  
             for(i=1 ;i<= (n-1) ;i++)
                  {
                if (z1 != A[i])
                 {
                   a1 = 1;
                  }
                 }

          for(i=1 ;i<= (n-1) ;i++)
              {
               if (z1 == A[i])
               {
                  a1 = 2;
                }
               }

switch(a1)
{
case 1:

{
 dbg("Boot","Enter another number whic is coprime with n \n");
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
    dbg("Boot","**tHE INVERSE OF z1 IS %ld \n " ,i);
          }
        }
 break;
}
}

     
            
              
      out1 =call Pailier.encrypt(in1,g,n,out1);
      out2 =call Pailier.encrypt(in2,g,n,out2);
         dbg("Boot", " encryption in in1 %ld \n", out1);
          dbg("Boot", "encryption in in2 %ld \n", out2);

      h1=call Pailier.decrypt(out1,g,h,p,q,x);
      d=call Pailier.decrypt(out2,g,h,p,q,f);
          dbg("Boot", "decryption is %ld \n",h1);
          dbg("Boot", "decryption is %ld \n",d);

}
}

else
  {
  dbg("Boot", "**Check values**\n\n");
   }
}
}

