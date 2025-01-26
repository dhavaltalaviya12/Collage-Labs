import java.util.Scanner;

class MyStack {
    class Node {
        int info;
        Node link;

        Node(int x) {
            this.info = x;
            this.link = null;
        }
    }
    public Node first;
    void push(int data) {
        Node newNode = new Node(data);
        if(first == null){
            first = newNode;
            return;
        }
        newNode.link = first;
        first = newNode;
    }

    public void pop(){
        if(first == null){
            System.out.println("list Empty");
            return;
        }
        if(first.link == null){
            first = null;
            System.out.println("element deleted and stack empty");
            return;
        }
        Node temp = first, prev = null;
        while(temp.link != null){
            prev = temp;
            temp = temp.link;
        }
        prev.link = null;
        System.out.println("last element deleted");
    }
}

public class StackUsingLL {
    public static void main(String[] args) {
        MyStack s = new MyStack();
        Scanner sc = new Scanner(System.in);

        while (true) {
            System.out.println("Press 1 for push");
            System.out.println("Press 2 for pop");
            System.out.println("Press any for exit");
            int a = sc.nextInt();

            switch (a) {
                case 1:
                    System.out.println("Enter Element");
                    int n = sc.nextInt();
                    s.push(n);
                    break;
                case 2:
                    s.pop();
                    break;

                default:
                    System.out.println("exited");
                    break;
            }
        }
    }
}
