//Check whether the given number is palindrome or not.

#include<stdio.h>

void main(){
	int rev=0,n,num;
	printf("enter a number : ");
	scanf("%d",&n);
	num=n;
	while(n!=0){
		rev=(rev*10)+(n%10);
		n=n/10;
	}
	
	if(rev==num){
		printf("your number is palindrome");
	}
	else{
		printf("your number is not palindrome");
	}
}
