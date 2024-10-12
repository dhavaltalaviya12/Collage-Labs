import java.util.Scanner;

public class ReadArray {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int[] a = new int[5];
        System.out.println("Enter Array Element : ");
        for (int i = 0; i < 5; i++) {
            a[i] = sc.nextInt();
        }
        sc.close();
        System.out.print("Array Element is = ");
        for (int i : a) {
            System.out.print(i + " ");
        }
    }
}
