import java.security.*;

class SHA1 {
    public static void main(String[] args) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-1");

        byte[] b = md.digest("Hello World".getBytes());

        for (byte x : b)
            System.out.printf("%02x", x);

        System.out.println();
    }
}