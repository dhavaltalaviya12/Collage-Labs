import java.util.Scanner;

class Student_Details{
    int Enrollment_No;
    String Name;
    int Semester;
    double cpi;

    void printDetails(){
        System.out.println("Enrollment No. = "+Enrollment_No);
        System.out.println("Name = "+Name);
        System.out.println("Semester = "+Semester);
        System.out.println("CPI = "+cpi);
        System.out.println("-----------------------------");
    }
}

public class Student {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        Student_Details std[] = new Student_Details[2];

        for(int i=0; i<2; i++){
            std[i] = new Student_Details();
            System.out.println("Enter Enrollment No. : ");
            std[i].Enrollment_No = sc.nextInt();
            System.out.println("Enter Name : ");
            std[i].Name = sc.next();
            System.out.println("Enter Semester : ");
            std[i].Semester = sc.nextInt();
            System.out.println("Enter CPI : ");
            std[i].cpi = sc.nextDouble();
        }
        System.out.println("-----------------------------");

        for(int i=0; i<2; i++){
            std[i].printDetails();
        }
    }
}
