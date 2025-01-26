//Print digits of given number.

#include<stdio.h>

void main(){
	int n,a,i=0;
	printf("enter a number : ");
	scanf("%d",&n);
	while(n!=0){
		a=n%10;
		n=n/10;
		i++;
	}
		printf("%d",i);
}
