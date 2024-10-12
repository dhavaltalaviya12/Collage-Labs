import java.util.Scanner;

class Node{
    int data;
    Node link;

    public Node(int data){
        this.data = data;
        this.link =null;
    }
}

class LinkedList{
    public Node first = null;
    public void insertAtFirst(int data){
        Node newNode = new Node(data);
        if(first == null){
            first = newNode;
            return;
        }
        newNode.link = first;
        first = newNode;
    }

    public void insertAtLast(int data){
        Node newNode = new Node(1);
        if(first == null){
            first = newNode;
            return;
        }
        Node last = first;
        while(last.link != null){
            last = last.link;
        }
        last.link = newNode;
    }

    public void deleteNode(int data){
        if(first == null){
            System.out.println("empty");
        }
        Node temp = first, prev = null;

        if(temp.data == data){
            first = temp.link;
            return;
        }

        while ((temp != null && temp.data != data)) {
            prev = temp;
            temp = temp.link;
        }

        if(temp == null){
            System.out.println("Node not found");
            return;
        }
        prev.link = temp.link;
    }

    public void print() {
        Node curNode = first;
        System.out.print("{ ");
        while (curNode != null) {
            System.out.print(curNode.data+" ");
            curNode = curNode.link;
        }
        System.out.println("}");
    }
}

public class SinglyLinkedList {
    public static void main(String[] args) {
        LinkedList list = new LinkedList();
        Scanner sc = new Scanner(System.in); 

        boolean check = true;
        while (check) {
            System.out.println("\n[1] Insert at first\n[2] Insert at last\n[3] Delete\n[4] Print\n[5] Exit");
            System.out.print("\nEnter your choice : ");
            int choice = sc.nextInt();
            switch (choice) {
                case 1 -> {
                    System.out.print("Enter val : ");
                    int data = sc.nextInt();
                    list.insertAtFirst(data);
                }

                case 2 -> {
                    System.out.print("Enter val : ");
                    int data = sc.nextInt();
                    list.insertAtLast(data);
                }

                case 3 -> {
                    System.out.print("Enter number to remove : ");
                    int data = sc.nextInt();
                    list.deleteNode(data);
                }

                case 4 -> list.print();

                case 5 -> check = false;
            }
        }
    }
}