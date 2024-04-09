import java.io.*;

public class DemoReplaceWord {
    public static void main(String[] args) {
        try {
            PrintWriter pw = new PrintWriter(new PrintWriter("change.txt"));
            pw.write("word1 is word1. \nword1 is only word1.");
            pw.close();
            BufferedReader br = new BufferedReader(new FileReader("abc.txt"));
            String line;
            int count = 0;

            while ((line = br.readLine()) != null) {
                String[] word = line.split("//s+");
                for (int i = 0; i <= word.length; i++) {
                    System.out.println(word[i].indexOf("word"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}