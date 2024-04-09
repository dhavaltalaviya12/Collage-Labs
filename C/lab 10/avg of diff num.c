//Find the sum and average of different numbers which are accepted by user as many as user wants.

#include<stdio.h>
void main(){
	int n=0,i,sum=0,a;
	float avg;	
		printf("enter number : ");
		scanf("%d",&a);
		while(n<a){
			scanf("%d",&i);
			sum=sum+i;
			n++;
		}
		avg=(sum/n);
		printf("Sum : %d\n",sum);
		printf("avg : %f",avg);
}
