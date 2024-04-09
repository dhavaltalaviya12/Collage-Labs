import java.util.Scanner;

public class MatrixDemo {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("please enter total row of matrix");
        int m=sc.nextInt();
        System.out.println("please enter total col of matrix");
        int n=sc.nextInt();
        int  matrix[][]=new int[m][n];
        System.out.println("please enter elements of matrix");
        for(int i=0;i<m;i++){
            for(int j=0;j<n;j++){
                matrix[i][j]=sc.nextInt();
            }
            MatrixThread row=new MatrixThread(matrix[i]);
            row.start();
        }
    }
}
class MatrixThread extends Thread{
    int row[];
    int sum;
    MatrixThread(int[] matrix){
        row=matrix;
        sum=0;
    }
    public void run(){
        for(int element:row){
            sum+=element;
        }
        System.out.println("sum of Row elements is : "+sum);
    }
}

