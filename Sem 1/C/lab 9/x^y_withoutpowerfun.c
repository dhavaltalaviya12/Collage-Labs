//Calculate 𝑥𝑦 without using power function

#include<stdio.h>

void main()
{
    int x,y,ans=1,i=1;
    printf("enter value of x and y:");
    scanf("%d %d",&x,&y);
    while(i<=y)
    {
        ans=ans*x;
        i++;
    }

    printf("%d",ans);

}
