import java.util.Scanner;

public class SelectionSort {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter size of arry : ");
        int size = sc.nextInt();
        int[] a = new int[size];
        System.out.println("Enter Array element : ");
        for (int i = 0; i < size; i++) {
            a[i] = sc.nextInt();
        }
        selectionSort(a, a.length);
    }

    public static void selectionSort(int[] a, int n) {
        for (int i = 0; i < n - 1; i++) {
            int index = i;
            for (int j = i + 1; j < n; j++) {
                if (a[j] < a[index]) {
                    index = j;
                }
            }
            int temp = a[index];
            a[index] = a[i];
            a[i] = temp;
        }
        System.out.println("Sorted Array : ");
        for (int i = 0; i < n; i++) {
            System.out.print(a[i] + " ");
        }
    }
}
