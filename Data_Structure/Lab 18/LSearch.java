import java.util.Scanner;

public class LSearch {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter size of arry : ");
        int size = sc.nextInt();
        int[] a = new int[size];
        System.out.println("Enter Array element : ");
        for (int i = 0; i < size; i++) {
            a[i] = sc.nextInt();
        }
        System.out.println("Enter Search element : ");
        int n = sc.nextInt();

        for (int i = 0; i < a.length; i++) {
            if (a[i] == n) {
                System.out.println("Element Searched");
                return;
            }
        }
        System.out.println("Your Search element is Not in Array");

    }
}
