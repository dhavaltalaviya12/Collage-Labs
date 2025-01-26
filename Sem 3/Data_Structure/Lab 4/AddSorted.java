
import java.util.Scanner;

public class AddSorted {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter Length of Array : ");
        int n = sc.nextInt();

        int arr[] = new int[n];
        for (int i = 0; i < n; i++) {
            System.out.print("a[" + i + "] : ");
            arr[i] = sc.nextInt();
        }

        System.out.print("Enter val : ");
        int val = sc.nextInt();
        sc.close();

        int i = 0;
        int arr2[] = new int[n+1];

        while (arr[i] < val) {
            arr2[i] = arr[i];
            i++;
        }
        arr2[i] = val;
        while (i < n) {
            arr2[i + 1] = arr[i];
            i++;
        }

        System.out.print("Old : ");
        for (i = 0; i < n; i++) {
            System.out.print(arr[i] + " ");
        }
        System.out.print("\nNew : ");
        for (i = 0; i < n+1; i++) {
            System.out.print(arr2[i] + " ");
        }
    }
}
