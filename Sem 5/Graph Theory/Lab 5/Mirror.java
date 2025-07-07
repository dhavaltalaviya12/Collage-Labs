import java.util.LinkedList;
import java.util.Queue;

public class Mirror {
    public static void main(String[] args) {
        int[] input = { 1, 2, 2, 3, 4, 4, 3 };
        Node root = makeTree(input, 0);
        System.out.println(isMirror(root));

    }

    public static boolean isMirror(Node root) {
        Queue<Node> q = new LinkedList<>();
        q.add(root.left);
        q.add(root.right);
        while (!q.isEmpty()) {
            Node a = q.poll();
            Node b = q.poll();

            if (a == null && b == null) {
                continue;
            }
            if (a == null || b == null || a.data != b.data) {
                return false;
            }

            q.add(a.left);
            q.add(b.right);

            q.add(a.right);
            q.add(b.left);
        }
        return true;
    }

    public static Node makeTree(int[] input, int i) {
        if (i >= input.length || input[i] == -1) {
            return null;
        }

        Node root = new Node(input[i]);
        root.left = makeTree(input, i * 2 + 1);
        root.right = makeTree(input, i * 2 + 2);

        return root;

    }
}

class Node {
    int data;
    Node left;
    Node right;

    public Node(int data) {
        this.data = data;
        this.left = null;
        this.right = null;
    }
}
