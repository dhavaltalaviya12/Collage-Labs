#include<stdio.h>

void main()
{
    int a,i=1,b;
    printf("enter number:");
    scanf("%d",&a);
    while (i<=a)
    {
        if (a%i==0)
        {
            printf("%d\n",i);
        }
        i++;
        
    }
    
}