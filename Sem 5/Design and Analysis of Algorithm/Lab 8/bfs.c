#include <stdio.h>
#define V 6

int queue[V];
int f = -1, r = -1;
int visited[V] = {0};

void enqueue(int value)
{
    if (r == V - 1)
    {
        printf("Queue full");
        return;
    }
    if (f == -1)
    {
        f = 0;
    }
    queue[++r] = value;
}

int dequeue()
{
    if (f == -1 || f > r)
    {
        return -1;
    }
    return queue[f++];
}

void bfs(int graph[V][V])
{
    visited[0] = 1;
    enqueue(0);

    while (f <= r)
    {
        int key = dequeue();
        printf("%d ", key + 1);

        for (int i = 0; i < V; i++)
        {
            if (graph[key][i] == 1 && !visited[i])
            {
                enqueue(i);
                visited[i] = 1;
            }
        }
    }
}

void main()
{
    int graph[V][V] = {
        {0, 1, 1, 0, 0, 0},
        {1, 0, 1, 1, 0, 0},
        {1, 1, 0, 0, 0, 0},
        {0, 1, 0, 0, 1, 0},
        {0, 0, 0, 1, 0, 1},
        {0, 0, 0, 0, 1, 0}};

    bfs(graph);
}