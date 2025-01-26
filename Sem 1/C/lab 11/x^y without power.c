//Calculate x^y without using power function. 

#include<stdio.h>

void main()
{
    int x,y,ans=1,i=1;
    printf("enter value of x and y:");
    scanf("%d %d",&x,&y);
    for (i = 1; i <= y; i++)
    {
        ans=ans*x;
    }

    printf("%d",ans);

}
