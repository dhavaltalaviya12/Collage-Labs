class PrintOdd extends Thread{
    int num1;
    PrintOdd(int a1){
        this.num1 = a1;
    }
    public void run(){
        try {
            for(int i=1 ; i<=20 ; i++){
                if(i%2!=0){
                    System.out.println("Odd Number = "+i);
                }
                Thread.sleep(1000);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

class PrintEven extends Thread{
    int num2;
    PrintEven(int a2){
        this.num2 = a2;
    }
    public void run(){
        try {
            for(int i=1 ; i<=20 ; i++){
                if(i%2==0){
                    System.out.println("Even Number = "+i);
                }
                Thread.sleep(1000);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

public class ThreadOddEvenNum {
    public static void main(String[] args) {
        Thread t1 = new PrintOdd(20);
        Thread t2 = new PrintEven(20);
        t1.start();
        t2.start();
    }
}
