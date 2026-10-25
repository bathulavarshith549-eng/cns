import javax.crypto.*;
import java.util.*;

class Blowfish {
    public static void main(String[] args) throws Exception {
        KeyGenerator kg = KeyGenerator.getInstance("Blowfish");
        SecretKey key = kg.generateKey();

        Cipher c = Cipher.getInstance("Blowfish");

        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] e = c.doFinal("Hello World".getBytes());

        System.out.println("Encrypted: " +
            Base64.getEncoder().encodeToString(e));

        c.init(Cipher.DECRYPT_MODE, key);
        System.out.println("Decrypted: " +
            new String(c.doFinal(e)));
    }
}