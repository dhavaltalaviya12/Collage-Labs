
import java.util.Scanner;

public class DeleteNum {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter Length of Array : ");
        int n = sc.nextInt();

        int arr[] = new int[n];
        for (int i = 0; i < arr.length; i++) {
            System.out.print("a[" + i + "] : ");
            arr[i] = sc.nextInt();
        }

        System.out.print("Enter index : ");
        int ind = sc.nextInt();
        sc.close();

        System.out.print("Old : ");
        for (int i = 0; i < arr.length; i++) {
            System.out.print(arr[i] + " ");
        }

        for (int i = ind; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }

        System.out.print("\nNew : ");
        for (int i = 0; i < arr.length - 1; i++) {
            System.out.print(arr[i] + " ");
        }
    }
}
