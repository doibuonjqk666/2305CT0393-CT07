<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Record" %>
<%@ page import="dao.*" %>

<%
    // Chua dang nhap thi da ve trang login (redirect tuong doi, khong chen host:port).
    if (session.getAttribute("user") == null) {
        response.setStatus(302);
        response.setHeader("Location", "login.jsp");
        return;
    }

    // Neu dang o che do SUA thi co san record de do len form.
    Record edit = (Record) request.getAttribute("editRecord");
    String editId     = (edit != null) ? String.valueOf(edit.GetId()) : "";
    String editStname = (edit != null) ? edit.GetStname() : "";
    String editCourse = (edit != null) ? edit.GetCourse() : "";
    String editFee    = (edit != null) ? String.valueOf(edit.GetFee()) : "";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student register Form</title>


    <style>
body
{

    margin:0px;
}

input
{

     width:300px;
     height: 30px;
     /* border:rgb(106, 201, 207) 1px solid; */
}

label
{
    display:block;
}
.form_group
{
    display: block;
}

.form_group.success input
{
    border:rgb(21, 192, 15) 1px solid;

}

.form_group.error input
{
     border:rgb(235, 20, 31) 1px solid;
     background-color: coral;

}

.bovien
{
    border: 1px solid #1013be;

}

table.bovien {
    border-collapse: collapse;
}

th.bovien
{
    font-weight: bold;
}



    </style>
</head>
<body>

    <div style="text-align:right; padding:8px; background:#dfe6e9;">
        Xin chào <b><%= session.getAttribute("user") %></b>
        &nbsp;|&nbsp; <a href="logout.jsp">Đăng xuất</a>
    </div>

    <div id="container" style="width: 100%;  display: flex; justify-content: center;   ">



        <div style="width:1000px; height: 300px; background-color: #eaf5d7;">

            <h1><%= (edit != null) ? "Sửa đăng ký" : "Student Regiter Form" %></h1>

            <form id="register_form" action="records" method="post">

                    <input type="hidden" name="id" value="<%= editId %>"/>

                    <div class="form_group">
                        <label for="sname">Student name</label>
                        <input id="sname" name="stname" value="<%= editStname %>" required/>
                    </div>


                     <div class="form_group">
                        <label for="course">Course</label>
                        <input id="course" name="course" value="<%= editCourse %>" required/>
                    </div>


                     <div class="form_group">
                        <label for="fee">Fee</label>
                        <input id="fee" name="fee" value="<%= editFee %>" required/>
                    </div>





                    <div>
                        <button type="submit"><%= (edit != null) ? "Cập nhật" : "Submit" %></button>
                        <% if (edit != null) { %>
                            <a href="index.jsp">Hủy</a>
                        <% } %>
                    </div>
                </form>

        </div>




    </div>


<div id="container" style="width: 100%;  display: flex; justify-content: center;   ">
     <div style="width:1000px; height: 300px; background-color: #f5f1d7;">

            <table class="bovien">
                <tr class="bovien">
                    <th class="bovien" style="width:300px">Student Name</th>
                    <th class="bovien" style="width:250px">Course</th>
                    <th class="bovien" style="width:100px">Fee</th>
                    <th class="bovien" style="width:100px">Edit</th>
                    <th class="bovien" style="width:100px">Delete</th>
                </tr>
                <%
            RecordDAO dao=new RecordDAO();
            List<Record> list = dao.getAllRecords();

            if(list != null){
                for(Record p : list){
            %>

             <tr class="bovien">
                <td class="bovien" style="width:300px"><%=p.GetStname()%></td>
                    <td class="bovien" style="width:250px"><%=p.GetCourse()%></td>
                    <td class="bovien" style="width:100px"><%=p.GetFee()%></td>
                    <td class="bovien" style="width:100px">
                        <a href="records?action=sua&id=<%=p.GetId()%>">Edit</a>
                    </td>
                    <td class="bovien" style="width:100px">
                        <a href="records?action=xoa&id=<%=p.GetId()%>"
                           onclick="return confirm('Xóa dòng này?');">Delete</a>
                    </td>

             </tr>



            <%} }%>


            </table>

        </div>

</div>



</body>
</html>
