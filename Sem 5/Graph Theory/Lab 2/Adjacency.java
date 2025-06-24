import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class Adjacency {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter the number of vertices: ");
        int n = sc.nextInt();
        int[][] edges = new int[n][2];
        System.out.println("Enter the edges: ");
        for (int i = 0; i < n; i++) {
            edges[i][0] = sc.nextInt();
            edges[i][1] = sc.nextInt();
        }
        // {{0,1}{1,2}{1,3}{2,3}{3,0}}

        for (int i = 0; i < edges.length;) {
            int vert = edges[i][0];
            System.out.print(vert + " -> ");
            while (i < edges.length && edges[i][0] == vert) {
                System.out.print(edges[i][1] + " ");
                i++;
            }
            System.out.println();
        }
    }
}
