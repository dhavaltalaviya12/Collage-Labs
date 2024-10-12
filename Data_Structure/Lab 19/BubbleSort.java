import java.util.Scanner;

public class BubbleSort {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter size of arry : ");
        int size = sc.nextInt();
        int[] a = new int[size];
        System.out.println("Enter Array element : ");
        for (int i = 0; i < size; i++) {
            a[i] = sc.nextInt();
        }
        bubbleSort(a,a.length);
        
    }

    public static void bubbleSort(int[] a, int n){
        for(int i=0; i<n; i++){
            for(int j=0; j<n-i-1; j++){
                if(a[j]>a[j+1]){
                    int temp = a[j];
                    a[j] = a[j+1];
                    a[j+1] = temp; 
                }
            }
        }
        System.out.println("Sorted Array : ");
        for(int i=0; i<n; i++){
            System.out.print(a[i]+" ");
        }
        
    }
}
