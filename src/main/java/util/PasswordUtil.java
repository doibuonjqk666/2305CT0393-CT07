package util;

import java.security.MessageDigest;
import java.nio.charset.StandardCharsets;

// Bam mat khau SHA-256, tra ve chuoi HEX 64 ky tu.
// Khop voi ham SHA2(text, 256) cua MySQL de so sanh trong tbl_user.
public class PasswordUtil {

    public static String sha256(String input) {

        try {

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(input.getBytes(StandardCharsets.UTF_8));

            StringBuilder sb = new StringBuilder();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
