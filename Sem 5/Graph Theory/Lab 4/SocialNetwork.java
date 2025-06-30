import java.util.Stack;

public class SocialNetwork {

    public static void main(String[] args) {
        int count = 0;
        int[][] adj = { { 1, 1, 1, 1 }, { 1, 1, 0, 0 }, { 1, 0, 1, 1 }, { 1, 0, 1, 1 } };
        int m = adj.length;
        int n = adj[0].length;
        boolean[][] visited = new boolean[m][n];

        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (adj[i][j] == 1 && !visited[i][j]) {
                    count++;
                    dfs(adj, i, visited);
                }
            }
        }
        System.out.println(count);
    }
    public static void dfs(int[][] adj, int i, boolean[][] visited) {
        int n = adj[0].length;
        Stack<Integer> s1 = new Stack<>();
        s1.push(i);
        while (!s1.isEmpty()) {
            int k = s1.pop();
            for (int l=0; l<n; l++) {
                if (adj[k][l] == 1 && visited[k][l] == false) {
                    s1.push(l);
                    visited[k][l] = true;
                    visited[l][k] = true;
                }
            }
        }
    }
}