import javax.crypto.*;
import javax.crypto.spec.*;
import java.util.*;

class DES {
    public static void main(String[] args) throws Exception {
        KeyGenerator kg = KeyGenerator.getInstance("DES");
        SecretKey key = kg.generateKey();

        Cipher c = Cipher.getInstance("DES/ECB/PKCS5Padding");

        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] e = c.doFinal("Hello World".getBytes());

        System.out.println("Encrypted: " +
            Base64.getEncoder().encodeToString(e));

        c.init(Cipher.DECRYPT_MODE, key);
        System.out.println("Decrypted: " +
            new String(c.doFinal(e)));
    }
}