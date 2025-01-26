class PrintStr1 implements Runnable{
    String str1;
    PrintStr1(String a1){
        this.str1 = a1;
    }
    public void run(){
        try {
            while(true){
                System.out.println(str1);
                Thread.sleep(1000);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

class PrintStr2 implements Runnable{
    String str2;
    PrintStr2(String a2){
        this.str2 = a2;
    }
    public void run(){
        try {
            while(true){
                System.out.println(str2);
                Thread.sleep(3000);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

public class ThreadDemo{
    public static void main(String[] args) {
        Runnable a1 = new PrintStr1("Good Morning");
        Thread t1 = new Thread(a1);
        t1.start();
        Runnable a2 = new PrintStr2("Good Afternoon");
        Thread t2 = new Thread(a2);
        t2.start();
    }
}