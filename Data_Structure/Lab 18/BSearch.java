import java.util.Scanner;

public class BSearch {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter size of arry : ");
        int size = sc.nextInt();
        int[] a = new int[size];
        System.out.println("Enter Sorted Array : ");
        for (int i = 0; i < size; i++) {
            a[i] = sc.nextInt();
        }
        System.out.println("Enter Search element : ");
        int key = sc.nextInt();

        int data = binarySearch(a, key);
        if(data == -1){
            System.out.println("Element Not Found");
        }
        else{
            System.out.println("Element Found");
        }

        int data1 = recursiveBinarySearch(a, key, 0, a.length-1);
        if(data1 == -1){
            System.out.println("Element Not Found");
        }
        else{
            System.out.println("Element Found with Recursive Method");
        }
    }

    public static int binarySearch(int[]a,int key){
        int left = 0;
        int right = a.length-1;

        while ((left <= right)) {
            int middle = (left + right)/2;
            if(a[middle] == key){
                return middle;
            }
            else if(key < a[middle]){
                right = middle - 1;
            }
            else{
                left = middle + 1;
            }
        }
        return -1;
    }

    public static int recursiveBinarySearch(int[]a, int key, int left, int right){
        if(left<=right){
            int middle = (left+right)/2;
            if(a[middle] == key){
                return middle;
            }
            else if(key < a[middle]){
                return recursiveBinarySearch(a, key, left, middle-1);
            }
            else{
                return recursiveBinarySearch(a, key, middle+1, right);
            }
        }
        return -1;
    }
}
