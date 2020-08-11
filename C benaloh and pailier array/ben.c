
#include<stdio.h>
#include <math.h> 

#define r 3
#define u 3

unsigned long int gcd(unsigned long int a, unsigned long int b)
 {
  if ( a == 0)
  {
  return b;
  }

  else
  {
   while (b != 0)
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


unsigned long int encrypt(unsigned long int in ,unsigned long int y, unsigned long int p,unsigned long  int q , unsigned long int out){

  unsigned long int i,j,s,f ;
   i = pow(y,in) ;
   j = pow(u,r);
   s = (i*j);
   f = ((p) * (q)) ;
  out = ((s)%(f));
   return out;
}

unsigned long int decrypt(unsigned long int in ,unsigned long int y, unsigned long int p,unsigned long int q , unsigned long int out){

   unsigned long int i,j,w,s,f,g ;
   i = pow(y,in);
   j = pow(u,r);
   w = (i *j);
   s = ((( p) - 1)* ((q)-1)/r);
   f = ( (p) * (q) );
   g =  pow(w,s);
  out = ((g)%(f)) ;
 return out;

 }


void main()
{
unsigned long int  p, q, y;
printf("Enter values for p,q,y ");
scanf("%ld\n%ld\n%ld",&p,&q,&y);


if ( ((p-1) % r) == 0 ) {
printf("(p-1)% R condition is correct\n ");
     
   unsigned long int l;    
    l= ( gcd(r, (p-1)/r) );    
    if ( l == 1 ) {
    printf("GCD condition for p and R is correct \n");
    
     unsigned long int o;
      o = gcd((q-1),r);
      if( o == 1 ) {
        printf("GCD condition for q and r is correct \n");
              unsigned long int k = (((p)-1) * ((q)-1)/r);
               printf("k value is %ld \n" ,k);

               unsigned long int l  = pow(y,k);
               printf("l is %ld \n" ,l);

               unsigned long int m = (l % (p*q)) ;
               printf("m is %ld\n",m );

          if (m != 1){
           printf("public n private keys r final ");
 
            unsigned long int in3,in2,g,z;
            unsigned long int out3,out2;
             printf("enter inputs in2 \n and in3");
               scanf("%ld\n %ld",&in2,&in3 );
                  
                g= encrypt(in2,y,p,q,out2);
                z= encrypt(in3,y,p,q,out3); 
                printf("***out for in2 is %ld \n",g);
                printf("***out is in3 %ld \n",z);
                /* { 
                  printf("***out is %ld \n",out2);
                 } 
                 
 
                 encrypt(in3,y,p,q,out3);
                 {     
                  printf("***out is %ld \n",out3);
                 }*/
                 
             unsigned long int h,d,x,t,out4,out5 ;
            printf("enter values out4 n out5");
             scanf("%ld\n %ld",&out4,&out5);
               
               h=decrypt(out4,y,p,q,x);
               d=decrypt(out5,y,p,q,t);
              printf("***deout is %ld \n",h);
              printf("***deout is %ld \n",d);

              /*decrypt(out4,y,p,q,x);
                 {
               printf("***deout is %ld \n",x);
                 } 

                
              decrypt(out5,y,p,q,t);
                 {
               printf("***deout is %ld \n",t);
                 }*/

              }
             }
           }
         }

else 
printf("check values\n");



} 


