import java.util.LinkedList;
import java.util.Queue;

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

public class Depth {
    public static Node makeTree(int[] input, int i) {
        if (i >= input.length || input[i] == -1) {
            return null;
        }

        Node root = new Node(input[i]);
        root.left = makeTree(input, i * 2 + 1);
        root.right = makeTree(input, i * 2 + 2);

        return root;
    }

    public static void main(String[] args) {
        // int[] input = { 3, 9, 20, -1, -1, 15, 7 };
        // int[] input = {10,20,30,40,-1,27,50,29,30,-1,-1,65,98,12,32,54};
        int[] input = {10, 5, 15, 2, 7, -1, 20, -1, -1, 6, -1, 17, -1, -1, -1, -1, 8, -1, 25};



        Node root = makeTree(input, 0);
        System.out.println("Depth of Tree with iterative : " + findDepth(root));
        System.out.println("Depth of Tree with recursive : " + findDepthRecursive(root));


    }

    public static int findDepth(Node root) {
        if (root == null) {
            return 0;
        }

        Queue<Node> q = new LinkedList<>();
        int count = 0;
        q.offer(root);

        while (!q.isEmpty()) {
            int levelSize = q.size();
            for (int i = 0; i < levelSize; i++) {
                Node n = q.poll();
                if (n.left != null) {
                    q.offer(n.left);
                }
                if (n.right != null) {
                    q.offer(n.right);
                }
            }
            count++;
        }

        return count;
    }

    public static int findDepthRecursive(Node root){
        if(root == null){
            return 0 ;
        }
        return 1 + Math.max(findDepthRecursive(root.left), findDepthRecursive(root.right));
    }
}
