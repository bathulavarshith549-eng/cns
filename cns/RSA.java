import java.security.*;
import javax.crypto.Cipher;
import java.util.*;

class RSA {
    public static void main(String[] args) throws Exception {
        KeyPairGenerator kpg =
            KeyPairGenerator.getInstance("RSA");
        kpg.initialize(2048);

        KeyPair kp = kpg.generateKeyPair();

        Cipher c = Cipher.getInstance("RSA");
        c.init(Cipher.ENCRYPT_MODE, kp.getPublic());

        byte[] e = c.doFinal("Hello".getBytes());

        System.out.println("Encrypted: " +
            Base64.getEncoder().encodeToString(e));

        c.init(Cipher.DECRYPT_MODE, kp.getPrivate());

        System.out.println("Decrypted: " +
            new String(c.doFinal(e)));
    }
}