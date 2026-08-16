package lk.jiat.scm.ejb.util;

import org.mindrot.jbcrypt.BCrypt;

public class PasswordEncryptor {
    public static String hashPassword(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(12));
    }

    // 2. අනාගතයේදී Login වීමේදී password එක පරීක්ෂා කිරීමට (Verify)
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        try {
            return BCrypt.checkpw(plainPassword, hashedPassword);
        } catch (Exception e) {
            return false;
        }
    }
}
