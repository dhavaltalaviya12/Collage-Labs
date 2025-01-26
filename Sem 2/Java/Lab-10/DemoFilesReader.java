import java.io.*;
public class DemoFilesReader {
    public static void main(String[] args) {
        try {
            PrintWriter pw = new PrintWriter(new FileWriter("abc.txt"));
            pw.write("Hello\n");
            pw.write("I am Dhaval Talaviya");
            pw.close();

            BufferedReader br = new BufferedReader(new FileReader("abc.txt"));
            int countChar = 0;
            int countLine = 0;
            int countWord = 0;
            String Line;
            while ((Line = br.readLine()) !=null) {
                countLine++;
                countChar += Line.length();
                String[] words = Line.split("\\s+");
                countWord += words.length;
            }
            br.close();
            System.out.println("Total lines in file = "+countLine);
            System.out.println("Total Char in file = "+countChar);
            System.out.println("Total Words in file = "+countWord);
        } catch (Exception e) {
                e.printStackTrace();
        }
    }
}