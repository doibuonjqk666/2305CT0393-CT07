package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext1 {

    private final String SERVER = "127.0.0.1";
    private final String PORT = "3306";
    private final String DATABASE = "school";

    private final String USER = "root";
    private final String PASSWORD = "Vietnam@123";

    public Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url =
                    "jdbc:mysql://" + SERVER + ":" + PORT + "/" + DATABASE
                    + "?useSSL=false"
                    + "&serverTimezone=Asia/Ho_Chi_Minh"
                    + "&allowPublicKeyRetrieval=true";

            return DriverManager.getConnection(url, USER, PASSWORD);

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Failed to get database connection", e);
        }
    }

    public static void main(String[] args) {
        DBContext1 db = new DBContext1();
        try (java.sql.Connection c = db.getConnection()) {
            System.out.println("Kết nối MySQL thành công!");
        } catch (Exception e) {
            System.out.println("Kết nối MySQL thất bại: " + e.getMessage());
            e.printStackTrace();
        }
    }
}