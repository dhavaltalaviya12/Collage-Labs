import java.util.Scanner;

public class LinkedListCopy {

    // Node blueprint
    public static class Node {
        int data;
        Node link;

        public Node(int data) {
            this.data = data;
            this.link = null;
        }
    }

    public Node first;

    public void addFirst(int data) {
        Node newNode = new Node(data);
        if (first == null) {
            first = newNode;
            return;
        }
        newNode.link = first;
        first = newNode;
    }

    public void addLast(int data) {
        Node newNode = new Node(data);
        Node temp = first;
        if (first == null) {
            first = newNode;
            return;
        }
        while (temp.link != null) {
            temp = temp.link;
        }
        temp.link = newNode;
        return;
    }

    public void printList() {
        if (first == null) {
            System.out.println("Linkend list is empty .!");
            return;
        }
        Node temp = first;
        while (temp != null) {
            System.out.print(temp.data + " ");
            temp = temp.link;
        }
        System.out.println();
    }

    public void copyList(LinkedListCopy li1, LinkedListCopy li2) {
        if (li1.first == null) {
            System.out.println("List is empty .!");
            return;
        }
        Node temp = li1.first;
        while (temp != null) {
            li2.addLast(temp.data);
            temp = temp.link;
        }
    }

    public static void main(String[] args) {
        LinkedListCopy li1 = new LinkedListCopy();
        LinkedListCopy li2 = new LinkedListCopy();

        Scanner sc = new Scanner(System.in);
        System.out.println("Enter size of LinkedList : ");
        int n = sc.nextInt();
        for (int i = 1; i <= n; i++) {
             li1.addLast(i);
        }

        li2.copyList(li1, li2);

        System.out.println("Linked List 1 :");
        li1.printList();
        System.out.println("Linked List 2 (Copied) :");
        li2.addLast(n+1); // for check
        li2.printList();

    }
}