#include <stdio.h>
#include <limits.h>

#define V 5
#define E 9

int findMinKey(int visited[], int distance[])
{
    int min = INT_MAX;
    int key = -1;
    for (int i = 0; i < V; i++)
    {
        if (visited[i] == 0 && distance[i] < min)
        {
            min = distance[i];
            key = i;
        }
    }

    return key;
}

void dijkstra(int graph[V][V], int sourceVertex)
{
    int distance[V];
    int visisted[V];

    for (int i = 0; i < V; i++)
    {
        distance[i] = INT_MAX;
        visisted[i] = 0;
    }

    distance[sourceVertex] = 0;

    for (int i = 0; i < V; i++)
    {
        int u = findMinKey(visisted, distance);
        visisted[u] = 1;

        for (int j = 0; j < V; j++)
        {
            if (visisted[j] == 0 && graph[u][j] != 0)
            {
                if (distance[u] + graph[u][j] < distance[j])
                {
                    distance[j] = distance[u] + graph[u][j];
                }
            }
        }
    }

    for (int i = 0; i < V; i++)
    {
        printf("%d ", distance[i]);
    }
}

void main()
{
    int graph[5][5] = {
        {0, 4, 0, 6, 6}, 
        {0, 0, 2, 0, 0},   
        {4, 0, 0, 8, 0},  
        {0, 0, 0, 0, 9},  
        {0, 0, 0, 0, 0}  
    };

    // int graph[5][5] = {
    //     {0, 14, 0, 0, 0},
    //     {0, 0, 14, 0, 0},
    //     {0, 0, 0, 14, 0},
    //     {14, 0, 0, 0, 0},
    //     {10, 10, 10, 10, 0}};
    int sourceVertex;
    printf("Enter Source Vertex : ");
    scanf("%d", &sourceVertex);
    dijkstra(graph, sourceVertex);
}