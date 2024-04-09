// Print given number in reverse order.

#include<stdio.h>

void main(){
	int rev=0,n;
	printf("enter a number : ");
	scanf("%d",&n);
	while(n!=0){
		rev=(rev*10)+(n%10);
		n=n/10;
	}
	printf("%d",rev);
}
