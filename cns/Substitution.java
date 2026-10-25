class Substitution {
    public static void main(String[] args) {
        String s = "HELLO";
        String key = "QWERTYUIOPASDFGHJKLZXCVBNM";
        String alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String e = "", d = "";

        for (char c : s.toCharArray())
            e += key.charAt(alpha.indexOf(c));

        for (char c : e.toCharArray())
            d += alpha.charAt(key.indexOf(c));

        System.out.println("Encrypted: " + e);
        System.out.println("Decrypted: " + d);
    }
}