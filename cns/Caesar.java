import java.util.Scanner;

class Caesar {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter text: ");
        String s = sc.nextLine();

        String e = "", d = "";

        for (char c : s.toCharArray())
            e += (char)(c + 3);

        for (char c : e.toCharArray())
            d += (char)(c - 3);

        System.out.println("Encrypted: " + e);
        System.out.println("Decrypted: " + d);
    }
}