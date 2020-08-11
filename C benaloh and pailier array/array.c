#include<stdio.h>
#include<math.h>


int gcd(int a, int b)
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


void main()
{

int q,i,a,h,n,j,g;
n=667;
int  Z[n];


for(i=1;i<= n-1 ; i++)
{
 g = gcd(i,n); 
if ( g ==1)
{

     Z[i]=i;
    printf("ARRAY FOR Zn Z[%d] IS %d \n", i,i );
  }
}


printf(" **enter  a no, coprime with n , whose inverse is needed \n ");
{
scanf("%d", &q);
}


for(i=1 ;i<= (n-1) ;i++)
 {
     if (q != Z[i])
     {
         a = 1;
       }
         }

for(i=1 ;i<= (n-1) ;i++)
 {
     if (q == Z[i])
      {
       a = 2;
      }
   }


switch(a)
{
case 1:
 
{
 printf("Enter another number whic is coprime with n \n");
    break;
}

case 2:
{
for(i=1 ;i<= (n-1) ;i++)
        {
         h = ((q*i) % n ); 
               
          if (h ==1)
          {
    printf("**tHE INVERSE OF %d IS %d \n " ,q,i);
          }
        }
 break; 
}
}


};

         









