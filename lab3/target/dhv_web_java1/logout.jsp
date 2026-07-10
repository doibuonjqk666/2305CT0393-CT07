<%
    session.invalidate();
    // Redirect tuong doi, khong chen host:port (chay dung sau proxy Codespaces).
    response.setStatus(302);
    response.setHeader("Location", "login.jsp");
%>
