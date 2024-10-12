import java.util.Scanner;

class MyQueue{
    int n;
    int[] arr;
    int r;
    int f;

    MyQueue(int n){
        this.n = n;
        arr = new int[n];
        this.r = -1;
        this.f = -1;
    }

    public void enqueue(int y){
        if(f == -1 && r == -1){
            f = 0;
        }
        if(r >= n-1){
            System.out.println("Queue Overflow");
            return;
        }
        else{
            r++;
            arr[r] =y;
        }
    }

    public int dequeue(){
        if(f < 0){
            return 0;
        }
        else if(f == r){
            int y = arr[f];
            f = -1;
            r = -1;
            return y;
        }
        else{
            int y = arr[f];
            f++;
            return y;
        }
    }

    public void display(){
        if(f < 0){
            System.out.println("Queue Overflow");
            return;
        }
        else{
            System.out.println("Your Queue Element:");
            for(int i=f; i<=r; i++){
                System.out.println(arr[i]);
            }
        }
    }
}

public class SimpleQueue {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter Size of Queue : ");
        int n = sc.nextInt();
        MyQueue Queue = new MyQueue(n);
        boolean check = true;

        while (check) {
            System.out.println("\n[1]Enqueue\n[2]Dequeue\n[3]Display\n[4]Exit");
            System.out.print("\nEnter your choice : ");
            int ch = sc.nextInt();
            switch (ch) {
                case 1 -> {
                    System.out.print("\nEnter number to Insert : ");
                    int x = sc.nextInt();
                    Queue.enqueue(x);
                }

                case 2 -> System.out.println("Dequeue number : " + Queue.dequeue());

                case 3 -> {
                    Queue.display();
                }

                case 4 -> check = false;

                
            }
        
        }
    }    
}
