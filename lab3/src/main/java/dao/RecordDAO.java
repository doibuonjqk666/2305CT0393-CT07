package dao;

import context.DBContext1;
import model.Record;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RecordDAO {

    public RecordDAO() {
    }

    // ---------------- GET ALL ----------------
    public List<Record> getAllRecords() {

        List<Record> list = new ArrayList<>();

        String sql = """
                SELECT id,
                       stname,
                       course,
                       fee
                FROM records
                ORDER BY id
                """;

        try (
                Connection conn = new DBContext1().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                Record p = new Record(
                        rs.getInt("id"),
                        rs.getString("stname"),
                        rs.getString("course"),
                        rs.getInt("fee")
                );

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ---------------- GET BY ID (de sua) ----------------
    public Record getById(int id) {

        String sql = "SELECT id, stname, course, fee FROM records WHERE id = ?";

        try (
                Connection conn = new DBContext1().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Record(
                            rs.getInt("id"),
                            rs.getString("stname"),
                            rs.getString("course"),
                            rs.getInt("fee")
                    );
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // ---------------- THEM ----------------
    public void insert(Record r) {

        String sql = "INSERT INTO records(stname, course, fee) VALUES (?, ?, ?)";

        try (
                Connection conn = new DBContext1().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, r.GetStname());
            ps.setString(2, r.GetCourse());
            ps.setInt(3, r.GetFee());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ---------------- SUA ----------------
    public void update(Record r) {

        String sql = "UPDATE records SET stname = ?, course = ?, fee = ? WHERE id = ?";

        try (
                Connection conn = new DBContext1().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setString(1, r.GetStname());
            ps.setString(2, r.GetCourse());
            ps.setInt(3, r.GetFee());
            ps.setInt(4, r.GetId());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ---------------- XOA ----------------
    public void delete(int id) {

        String sql = "DELETE FROM records WHERE id = ?";

        try (
                Connection conn = new DBContext1().getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)
        ) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
