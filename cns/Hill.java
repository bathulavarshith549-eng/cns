import java.util.Scanner;

class Hill {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Enter text: ");
        String s = sc.next().toUpperCase();

        if (s.length() % 2 != 0)
            s += "X";

        String e = "", d = "";

        for (int i = 0; i < s.length(); i += 2) {
            int a = s.charAt(i) - 'A';
            int b = s.charAt(i + 1) - 'A';

            int x = (3 * a + 3 * b) % 26;
            int y = (2 * a + 5 * b) % 26;

            e += (char) (x + 'A');
            e += (char) (y + 'A');

            int p = (15 * x + 17 * y) % 26;
            int q = (20 * x + 9 * y) % 26;

            d += (char) (p + 'A');
            d += (char) (q + 'A');
        }

        System.out.println("Encrypted: " + e);
        System.out.println("Decrypted: " + d);
    }
}