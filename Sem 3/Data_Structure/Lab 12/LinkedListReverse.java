import java.util.Scanner;

public class LinkedListReverse {

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

    public void reverse() {
        Node prev = null;
        Node curr = first;
        Node next;

        while (curr != null) {
            next = curr.link;
            curr.link = prev;
            prev = curr;
            curr = next;
        }
        first = prev;
    }

    public static void main(String[] args) {
        LinkedListReverse li = new LinkedListReverse();

        Scanner sc = new Scanner(System.in);
        System.out.println("Enter size of LinkedList : ");
        int n = sc.nextInt();
        for (int i = 1; i <= n; i++) {
            li.addLast(i);
        }

        System.out.println("Before reverse : ");
        li.printList();

        li.reverse();

        System.out.println("After reverse : ");
        li.printList();

    }

}