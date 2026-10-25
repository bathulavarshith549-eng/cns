import java.security.*;

class MD5 {
    public static void main(String[] args) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");

        byte[] b = md.digest("Hello World".getBytes());

        for (byte x : b)
            System.out.printf("%02x", x);

        System.out.println();
    }
}