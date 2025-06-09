import java.util.Scanner;

public class ArrayAdition {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter length of n : ");
        int n = sc.nextInt();
        System.out.println("Enter length of m : ");
        int m = sc.nextInt();
        int[][] arr1 = new int[n][m];
        int[][] arr2 = new int[n][m];

        for(int i=0; i<n; i++){
            for(int j=0; j<m; j++){
                System.out.print("Enter element : ");
                arr1[i][j] = sc.nextInt();
            }
        }

        System.out.println();

        for(int i=0; i<n; i++){
            for(int j=0; j<m; j++){
                System.out.print("Enter element : ");
                arr2[i][j] = sc.nextInt();
            }
        }

        for(int i=0; i<n; i++){
            for(int j=0; j<m; j++){
                System.out.print(arr1[i][j]+arr2[i][j]+ " ");

            }
            System.out.println();
        }
    }
}
