package util;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

// Redirect tuong doi: chi set header Location dung path, KHONG chen host:port.
// Tomcat 7 mac dinh bien sendRedirect thanh URL tuyet doi (kem :8080) -> sai khi
// chay sau reverse-proxy nhu GitHub Codespaces. Cach nay de trinh duyet tu ghep
// path vao dung domain hien tai.
public class Web {

    public static void redirect(HttpServletResponse resp, String path)
            throws IOException {
        resp.setStatus(HttpServletResponse.SC_FOUND); // 302
        resp.setHeader("Location", path);
    }
}
