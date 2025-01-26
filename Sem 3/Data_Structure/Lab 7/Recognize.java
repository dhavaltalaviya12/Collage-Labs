import java.util.Scanner;

public class Recognize{

    static int len;
    static int top=0;
    static char[] arr;
    public  void push(char ch){
        arr[top++]=ch;
    }

    public char pop(){
        if(top>=len/2){
            char temp=arr[--top];
            return temp;
        }
        return 0;
    }

    public  int check(char c,int i){
        if(c==arr[i]){
            return 1;
        }
        else{
            return 0;
        }
    }
    public static void main(String[] args) {
        Recognize obj=new Recognize();
        Scanner s = new Scanner(System.in);
        System.out.println("Enter a string to check palindrome");
        String str=s.next();
        len=str.length();
        arr=new char[len];
        for(int i=0;i<str.length();i++){
            obj.push(str.charAt(i));
        }

        for(int i=0;i<str.length()/2;i++){
            char ch=obj.pop();
            int temp=obj.check(ch,i);
            if(temp==1){
                continue;
            }
            else if(temp==0){
                System.out.println("Not a palindrome");
                return;
            }
            // if(obj.pop()!=str.charAt(i)){
            //     System.out.println("Not a palindrome");
            //     return;
            // }
        }

        System.out.println("Palindrome");
}


}
