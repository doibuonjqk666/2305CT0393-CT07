<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <style>
        body {
            margin: 0px;
            font-family: Arial, sans-serif;
        }

        .login-box {
            width: 350px;
            margin: 80px auto;
            padding: 25px;
            background-color: #eaf5d7;
            border: 1px solid #1013be;
        }

        h1 {
            text-align: center;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input {
            width: 100%;
            height: 30px;
            box-sizing: border-box;
        }

        button {
            margin-top: 15px;
            width: 100%;
            height: 35px;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <div class="login-box">

        <h1>Đăng nhập</h1>

        <form action="login" method="post">

            <label for="username">Username</label>
            <input id="username" name="username" type="text" required/>

            <label for="password">Password</label>
            <input id="password" name="password" type="password" required/>

            <button type="submit">Đăng nhập</button>
        </form>

        <% if ("1".equals(request.getParameter("error"))) { %>
            <p class="error">Sai username hoặc mật khẩu!</p>
        <% } %>

    </div>

</body>
</html>
