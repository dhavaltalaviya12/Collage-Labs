// Replace a character in given string

#include<stdio.h>

void main(){
    char s[5],c1,c2;
    printf("Enetr string : ");
    gets(s);
    printf("Character you want to replace : ");
    start:
    scanf("%c ",&c1);
    printf("New charcter :  ");
    scanf("%c",&c2);
    int count=0;
    for (int i = 0; s[i]!='\0'; i++)
    {
        if (s[i]==c1)
        {
            s[i]=c2;
            count++;
        }
    }
    if (count==0)
    {
        printf("Enter a correct character : ");
        goto start;
    }
    puts(s);
}