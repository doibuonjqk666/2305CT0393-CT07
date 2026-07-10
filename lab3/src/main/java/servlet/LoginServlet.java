package servlet;

import dao.UserDAO;
import util.Web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        // Kiem tra dung username + mat khau (da bam) roi moi cho vao.
        if (username != null && password != null
                && dao.checkLogin(username.trim(), password)) {

            HttpSession session = request.getSession();
            session.setAttribute("user", username.trim());

            Web.redirect(response, "index.jsp");

        } else {
            Web.redirect(response, "login.jsp?error=1");
        }
    }
}
