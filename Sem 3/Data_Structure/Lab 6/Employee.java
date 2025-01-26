import java.util.Scanner;

class Employee_Details {
    int Employee_ID;
    String Name;
    String Designation;
    Double Salary;

    Employee_Details(int Employee_ID, String Name, String Designation, Double Salary) {
        this.Employee_ID = Employee_ID;
        this.Name = Name;
        this.Designation = Designation;
        this.Salary = Salary;
    }

    void printDetails() {
        System.out.println("ID = "+Employee_ID);
        System.out.println("Name = "+Name);
        System.out.println("Designation = "+Designation);
        System.out.println("Salary = "+Salary);
    }
}

public class Employee {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter Employee ID : ");
        int Employee_ID = sc.nextInt();
        System.out.println("Enter Employee Name : ");
        String Name = sc.next();
        System.out.println("Enter Employee Designation : ");
        String Designation = sc.next();
        System.out.println("Enter Employee Salary : ");
        Double Salary = sc.nextDouble();

        Employee_Details a = new Employee_Details(Employee_ID, Name, Designation, Salary);
        a.printDetails();
    }
}
