
import java.util.Scanner;

public class SwapNum {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a[] = new int[2];
        System.out.println("Enter Number to Swap : ");
        a[0] = sc.nextInt();
        a[1] = sc.nextInt();
        a = swap(a);
        System.out.println("Swap Number : n1 = "+a[0]+", n2 = "+a[1]);
    }

    public static int[] swap(int[] a){
        int temp = a[0];
        a[0] = a[1];
        a[1] = temp;
        return a;
    }
}
