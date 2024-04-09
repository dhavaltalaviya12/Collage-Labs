//Find out sum of first and last digit of a given number.

#include<stdio.h>
void main(){
	int n,a,b;
	printf("enter a number : ");
	scanf("%d",&n);
	a=n%10;
	while(n!=0){
		b=n%10;
		n=n/10;
	}
	printf("%d",a+b);
}
