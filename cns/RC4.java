import javax.crypto.*;
import java.util.*;

class RC4 {
    public static void main(String[] args) throws Exception {
        Cipher c = Cipher.getInstance("RC4");
        SecretKey key = new javax.crypto.spec.SecretKeySpec(
            "mysecretkey".getBytes(), "RC4");

        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] e = c.doFinal("Hello World".getBytes());

        System.out.println("Encrypted: " +
            Base64.getEncoder().encodeToString(e));

        c.init(Cipher.DECRYPT_MODE, key);
        System.out.println("Decrypted: " +
            new String(c.doFinal(e)));
    }
}