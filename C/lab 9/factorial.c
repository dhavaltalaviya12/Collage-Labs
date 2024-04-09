#include<stdio.h>

void main()
{
    int a,n=1,i=1;
    printf("enter a value of a:");
    scanf("%d",&a);
    while (i <= a)
    {
        n=n*i;
        i++;
    }
     printf("%d",n);
}
