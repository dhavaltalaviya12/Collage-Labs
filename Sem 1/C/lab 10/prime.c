//Find whether the given number is prime or not

#include<stdio.h>
void main(){
	int n,i=2,count=0,a;
	printf("enter a number : ");
	scanf("%d",&n);
	while(i<n){
		a=n%i;
		if(a==0){
			count++;
		}
		i++;
	}
	if(count==0){
		printf("number is prime");
	}
	else{
		printf("number is not prime");
	}
}
