import java.util.Scanner;

class Node {
    int info;
    Node link;

    public Node(int data) {
        this.info = data;
        this.link = null;
    }
}

class LinkedList {
    public Node first;
    public Node last;

    public void cirInsFirst(int data) {
        Node newNode = new Node(data);
        if (first == null) {
            first = newNode;
            last = newNode;
        } else {
            newNode.link = first;
            last.link = newNode;
            first = newNode;
        }
    }

    public void cirInsLast(int data) {
        Node newNode = new Node(data);
        if (first == null) {
            first = newNode;
            last = newNode;
        } else {
            newNode.link = first;
            last.link = newNode;
            last = newNode;
        }
    }

    public void cirDelete(int data) {
        Node newNode = new Node(data);
        if (first == null) {
            System.out.println("Linked List is Empty");
        }
        Node save = first, pred = null;

        while (save.info != data && save != last) {
            pred = save;
            save = save.link;
        }
        if (save.info != data) {
            System.out.println("Node not Found");
        }
        if (first == last) {
            first = null;
            last = null;
        } else if (data == first.info) {
            first = first.link;
            last.link = first;
        } else {
            pred.link = save.link;
            if (save == last) {
                last = pred;
            }
        }
    }

    public void print() {
        Node curNode = first;
        System.out.print("{ ");
        while (curNode != last) {
            System.out.print(curNode.info + " ");
            curNode = curNode.link;
        }
        System.out.print(curNode.info);
        System.out.println("}");
    }
}

public class CircularLinkedList {
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
                    list.cirInsFirst(data);
                }

                case 2 -> {
                    System.out.print("Enter val : ");
                    int data = sc.nextInt();
                    list.cirInsLast(data);
                }

                case 3 -> {
                    System.out.print("Enter number to remove : ");
                    int data = sc.nextInt();
                    list.cirDelete(data);
                }

                case 4 -> list.print();

                case 5 -> check = false;
            }
        }

    }
}
