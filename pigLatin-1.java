import java.util.Scanner;
import java.io.*;

public class pigLatin {
  public static void main(String[] args){
    Scanner keyboard = new Scanner(System.in);
    String Str1;
    System.out.print("Enter word; " );
    Str1 = keyboard.nextLine();
    System.out.println(pigLatin(Str1));
  }
  
  static String pigLatin(String text) {
    String Str2 = text.substring(0,1);
    
    
    return "Translation: " + text.substring(1) + Str2 + "ay";
  }
}