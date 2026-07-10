<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập hệ thống</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="auth-wrapper">
        <div class="auth-card">
            <div class="card-header">
                <h1>Đăng nhập</h1>
                <p>Chào mừng bạn quay trở lại</p>
            </div>

            <form action="login" method="post">
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input class="input-field" id="username" name="username" type="text" required/>
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input class="input-field" id="password" name="password" type="password" required/>
                </div>

                <button class="button-primary" type="submit">Đăng nhập</button>
            </form>

            <% if ("1".equals(request.getParameter("error"))) { %>
                <p class="error-message">Sai username hoặc mật khẩu!</p>
            <% } %>
        </div>
    </div>
</body>
</html>
