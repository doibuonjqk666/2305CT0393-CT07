package dao;

import context.DBContext1;
import util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    public UserDAO() {
    }

    // Kiem tra dang nhap: so username va mat khau da bam voi tbl_user.
    public boolean checkLogin(String username, String password) {

        String hash = PasswordUtil.sha256(password);

        String sql = """
                SELECT id
                FROM tbl_user
                WHERE username = ?
                  AND password = ?
                """;

        try (
                Connection conn = new DBContext1().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, username);
            ps.setString(2, hash);

            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
