package servlet;

import dao.RecordDAO;
import model.Record;
import util.Web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Xu ly them / sua / xoa cho bang records (dang ky mon hoc).
@WebServlet("/records")
public class RecordServlet extends HttpServlet {

    private final RecordDAO dao = new RecordDAO();

    // Chua dang nhap thi khong cho vao.
    private boolean chuaDangNhap(HttpServletRequest request,
                                 HttpServletResponse response) throws IOException {
        if (request.getSession().getAttribute("user") == null) {
            Web.redirect(response, "login.jsp");
            return true;
        }
        return false;
    }

    // action=sua  -> lay record ra de do len form (chuyen ve index.jsp)
    // action=xoa  -> xoa roi quay lai danh sach
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        if (chuaDangNhap(request, response)) return;

        String action = request.getParameter("action");

        if ("sua".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));
            Record r = dao.getById(id);
            request.setAttribute("editRecord", r);

            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if ("xoa".equals(action)) {

            int id = Integer.parseInt(request.getParameter("id"));
            dao.delete(id);
        }

        Web.redirect(response, "index.jsp");
    }

    // Nhan du lieu tu form: id rong => THEM, id co gia tri => SUA
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        if (chuaDangNhap(request, response)) return;

        request.setCharacterEncoding("UTF-8");

        String idStr = request.getParameter("id");
        String stname = request.getParameter("stname");
        String course = request.getParameter("course");
        String feeStr = request.getParameter("fee");

        int fee = 0;
        try {
            fee = Integer.parseInt(feeStr);
        } catch (Exception ignore) {
        }

        if (idStr == null || idStr.trim().isEmpty()) {
            // THEM moi
            dao.insert(new Record(0, stname, course, fee));
        } else {
            // SUA
            int id = Integer.parseInt(idStr);
            dao.update(new Record(id, stname, course, fee));
        }

        Web.redirect(response, "index.jsp");
    }
}
