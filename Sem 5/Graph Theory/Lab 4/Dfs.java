import java.util.ArrayList;
import java.util.Stack;

public class Dfs {
    public static void main(String[] args) {
        int adj[][] = { { 1, 2 }, { 0, 2 }, { 0, 1, 3, 4 }, { 2 }, { 2 } };
        
        // {{1,2},{0,2,3,4},{0,1,3},{1,2,4},{0,1,3,5},{4}}
        
        ArrayList<Integer> l = new ArrayList<>();
        // Stack<Integer> s1 = new Stack<>();
        // s1.push(3);
        // l.add(3);
        // while (!s1.isEmpty()) {
        //     int node = s1.pop();
        //     for (int i : adj[node]) {
        //         if (!l.contains(i)) {
        //             l.add(i);
        //             s1.push(i);
        //         }
        //     }
        // }
        l = dfs(adj, l, 0);
        System.out.println(l);
    }

    public static ArrayList<Integer> dfs(int[][] adj, ArrayList<Integer> l, int start){
        if(l.contains(start)){
            return l;
        }
        l.add(start);

        for(int cur : adj[start]){
            l = dfs(adj, l, cur);
        }
        return l;
    }
}
