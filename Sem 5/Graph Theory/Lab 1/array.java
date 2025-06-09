import java.util.Arrays;
import java.util.Scanner;

public class array {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter length of a : ");
        int a = sc.nextInt();
        System.out.println("Enter length of b : ");
        int b = sc.nextInt();
        int[][] arr = new int[a][b];

        for(int i=0; i<a; i++){
            for(int j=0; j<b; j++){
                System.out.print("Enter element : ");
                arr[i][j] = sc.nextInt();
            }
        }

        for(int i=0; i<a; i++){
            for(int j=0; j<b; j++){
                System.out.print(arr[i][j]+" ");

            }
            System.out.println();
        }
    }
}