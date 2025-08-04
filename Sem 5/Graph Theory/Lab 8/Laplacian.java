// Java program to find laplacian
// matrix of an undirected graph

import java.util.Scanner;

class Laplacian {
    class Edge {
        int src, dest;
    }

    int vertices, edges;
    Edge[] edge;

    Laplacian(int vertices, int edges) {
        this.vertices = vertices;
        this.edges = edges;
        edge = new Edge[edges];
        for (int i = 0; i < edges; i++) {
            edge[i] = new Edge();
        }
    }

    public static void main(String[] args) {
        int i, j;
        // int numberOfVertices = 6;
        // int numberOfEdges = 7;
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter Total Number Of Vertices : ");
        int numberOfVertices = sc.nextInt();
        System.out.println("Enter Total Number Of Edges : ");
        int numberOfEdges = sc.nextInt();
        int[][] adjacency_matrix = new int[numberOfEdges][numberOfEdges];
        int[][] degree_matrix = new int[numberOfEdges][numberOfEdges];
        int[][] laplacian_matrix = new int[numberOfEdges][numberOfEdges];
        Laplacian g = new Laplacian(numberOfVertices, numberOfEdges);
        int[][] adj_matrix = new int[numberOfEdges][numberOfEdges];
        for (int k = 0; k < numberOfEdges; k++) {
            System.out.println("Enter Source Vertex of edge " + k + " : ");
            g.edge[k].src = sc.nextInt();
            System.out.println("Enter Destination Vertex of edge " + k + " : ");
            g.edge[k].dest = sc.nextInt();
        }
        System.out.println("\n");
        // g.edge[0].src = 1;
        // g.edge[0].dest = 2;

        // g.edge[1].src = 1;
        // g.edge[1].dest = 5;

        // g.edge[2].src = 2;
        // g.edge[2].dest = 3;

        // g.edge[3].src = 2;
        // g.edge[3].dest = 5;

        // g.edge[4].src = 3;
        // g.edge[4].dest = 4;

        // g.edge[5].src = 4;
        // g.edge[5].dest = 6;

        // g.edge[6].src = 5;
        // g.edge[6].dest = 4;

        // Adjacency Matrix
        for (i = 0; i < numberOfEdges; i++) {
            for (j = 0; j < numberOfEdges; j++) {
                adjacency_matrix[g.edge[i].src][g.edge[i].dest] = 1;
                adjacency_matrix[g.edge[i].dest][g.edge[i].src] = 1;
            }
        }
        System.out.println("Adjacency matrix : ");
        for (i = 1; i < adjacency_matrix.length; i++) {
            for (j = 1; j < adjacency_matrix[i].length; j++) {
                System.out.print(adjacency_matrix[i][j]
                        + " ");
            }
            System.out.println();
        }
        System.out.println("\n");

        // Degree Matrix
        for (i = 0; i < numberOfEdges; i++) {
            for (j = 0; j < numberOfEdges; j++) {
                degree_matrix[i][i] += adjacency_matrix[i][j];
            }
        }
        System.out.println("Degree matrix : ");
        for (i = 1; i < degree_matrix.length; i++) {
            for (j = 1; j < degree_matrix[i].length; j++) {
                System.out.print(degree_matrix[i][j] + " ");
            }
            System.out.println();
        }
        System.out.println("\n");

        // Laplacian Matrix
        System.out.println("Laplacian matrix : ");
        for (i = 0; i < numberOfEdges; i++) {
            for (j = 0; j < numberOfEdges; j++) {
                laplacian_matrix[i][j] = degree_matrix[i][j]
                        - adjacency_matrix[i][j];
            }
        }
        for (i = 1; i < laplacian_matrix.length; i++) {
            for (j = 1; j < laplacian_matrix[i].length; j++) {
                System.out.printf("%2d",
                        laplacian_matrix[i][j]);
                System.out.printf("%s", "  ");
            }
            System.out.println();
        }
    }
}