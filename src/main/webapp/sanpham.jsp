<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="dao.*" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
    <div class="page-shell">
        <header class="topbar">
            <div>
                <h2>Danh sách sản phẩm</h2>
                <p>Giám sát các mặt hàng trong kho theo phong cách trực quan</p>
            </div>
        </header>

        <section class="card">
            <div class="table-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên sản phẩm</th>
                            <th>Supplier ID</th>
                            <th>Category ID</th>
                            <th>Quantity Per Unit</th>
                            <th>Unit Price</th>
                            <th>Units In Stock</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ProductDAO dao = new ProductDAO();
                            List<Product> list = dao.getAllProducts();

                            if (list != null) {
                                for (Product p : list) {
                        %>
                        <tr>
                            <td><%= p.getProductID() %></td>
                            <td><%= p.getProductName() %></td>
                            <td><%= p.getSupplierID() %></td>
                            <td><%= p.getCategoryID() %></td>
                            <td><%= p.getQuantityPerUnit() %></td>
                            <td><%= p.getUnitPrice() %></td>
                            <td><%= p.getUnitsInStock() %></td>
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
```
