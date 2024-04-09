import java.io.*;

public class StudentIO2 {
    public static void main(String[] args) {
        try {
            DataOutputStream dos = new DataOutputStream(new FileOutputStream("xyz.txt"));
            dos.writeUTF("Dhaval");
            dos.writeInt(19);
            dos.writeUTF("Jevin");
            dos.writeInt(18);
            dos.writeUTF("Pratyush");
            dos.writeInt(16);
            dos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            DataInputStream dis = new DataInputStream(new FileInputStream("xyz.txt"));
            while(dis.available()>0){
                String name = dis.readUTF();
                int age = dis.readInt();
                Student st = new Student(name, age);
                System.out.println(st);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
class Student{
    String name;
    int age;
    Student(String name, int age){
        this.name = name;
        this.age = age; 
    }
    public String toString(){
        return "Name : " +name+ "\t ,Age : "+age;    
    }
}
