<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Record" %>
<%@ page import="dao.*" %>

<%
    if (session.getAttribute("user") == null) {
        response.setStatus(302);
        response.setHeader("Location", "login.jsp");
        return;
    }

    Record edit = (Record) request.getAttribute("editRecord");
    String editId     = (edit != null) ? String.valueOf(edit.GetId()) : "";
    String editStname = (edit != null) ? edit.GetStname() : "";
    String editCourse = (edit != null) ? edit.GetCourse() : "";
    String editFee    = (edit != null) ? String.valueOf(edit.GetFee()) : "";
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống đăng ký sinh viên</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="page-shell">
        <header class="topbar">
            <div>
                <h2>Hệ thống đăng ký sinh viên</h2>
                <p>Quản lý thông tin học viên một cách rõ ràng và hiện đại</p>
            </div>
            <div class="user-badge">
                <span>Xin chào <b><%= session.getAttribute("user") %></b></span>
                <span class="muted">•</span>
                <a href="logout.jsp">Đăng xuất</a>
            </div>
        </header>

        <section class="card">
            <h3><%= (edit != null) ? "Sửa đăng ký" : "Thêm đăng ký mới" %></h3>
            <form id="register_form" action="records" method="post">
                <input type="hidden" name="id" value="<%= editId %>"/>

                <div class="form-grid">
                    <div class="form-group">
                        <label for="sname">Tên học viên</label>
                        <input class="input-field" id="sname" name="stname" value="<%= editStname %>" required/>
                    </div>

                    <div class="form-group">
                        <label for="course">Khóa học</label>
                        <input class="input-field" id="course" name="course" value="<%= editCourse %>" required/>
                    </div>

                    <div class="form-group">
                        <label for="fee">Học phí</label>
                        <input class="input-field" id="fee" name="fee" value="<%= editFee %>" required/>
                    </div>
                </div>

                <div class="button-row">
                    <button class="button-primary" type="submit"><%= (edit != null) ? "Cập nhật" : "Lưu đăng ký" %></button>
                    <% if (edit != null) { %>
                        <a class="button-secondary" href="index.jsp">Hủy</a>
                    <% } %>
                </div>
            </form>
        </section>

        <section class="card">
            <h3>Danh sách đăng ký</h3>
            <div class="table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>Tên học viên</th>
                            <th>Khóa học</th>
                            <th>Học phí</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        RecordDAO dao = new RecordDAO();
                        List<Record> list = dao.getAllRecords();

                        if (list != null) {
                            for (Record p : list) {
                        %>
                        <tr>
                            <td><%= p.GetStname() %></td>
                            <td><%= p.GetCourse() %></td>
                            <td><%= p.GetFee() %></td>
                            <td>
                                <div class="actions">
                                    <a href="records?action=sua&id=<%= p.GetId() %>">Sửa</a>
                                    <a href="records?action=xoa&id=<%= p.GetId() %>" onclick="return confirm('Xóa dòng này?');">Xóa</a>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
</body>
</html>
