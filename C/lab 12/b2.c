#include<stdio.h>
void main(){
	float i,j,n,a,mul=1,sum=1;
	scanf("%f",&n);
	for(i=1;i<=n;i++){
		for(j=1;j<=i;j++){
			mul=mul*j;
		}
		a=(1/mul);
		sum=sum+a;
	}
	printf("%f",sum);
}
