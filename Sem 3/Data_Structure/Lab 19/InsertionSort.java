import java.util.Scanner;

public class InsertionSort {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter size of arry : ");
        int size = sc.nextInt();
        int[] a = new int[size];
        System.out.println("Enter Array element : ");
        for (int i = 0; i < size; i++) {
            a[i] = sc.nextInt();
        }
        insertionSort(a, a.length);
    }

    public static void insertionSort(int[] a, int n){
        int i = 1;
        while (i<n) {
            int key = a[i];
            int j = i-1;

            while (j>=0 && a[j]>key) {
                a[j+1] = a[j];
                j--;
            }
            a[j+1] = key;
            i++;
        }
        System.out.println("Sorted Array : ");
        for (int k = 0; k < n; k++) {
            System.out.print(a[k] + " ");
        }
    } 
}
