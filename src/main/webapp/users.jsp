<%@ page import="java.sql.*,util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>User List</h2>

    <div class="container mt-5">


        <!-- ✅ ADD EDIT FORM HERE -->
        <h3>Edit User</h3>

        <form action="user" method="post">

            <input type="hidden" name="id" value="<%= request.getParameter("id") %>">

            <input type="text" name="username" class="form-control mb-2"
                   value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>"
                   placeholder="Username" required>

            <input type="email" name="email" class="form-control mb-2"
                   value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>"
                   placeholder="Email" required>

            <!-- NEW PASSWORD FIELD -->
            <input type="password" name="password" class="form-control mb-2"
                   placeholder="New Password (optional)">

            <button class="btn btn-success">Update</button>
        </form>

        <hr>

        <!-- TABLE BELOW -->
        <table class="table table-bordered">

            <table class="table table-bordered">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Password</th> <th>Action</th>
                </tr>

                <%
                    Connection con = DBConnection.getConnection();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM users");

                    while(rs.next()) {
                %>

                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("username") %></td>
                    <td><%= rs.getString("email") %></td>
                    <td><%= rs.getString("password") %></td> <td>
                    <a href="users.jsp?id=<%= rs.getInt("id") %>&username=<%= rs.getString("username") %>&email=<%= rs.getString("email") %>" class="btn btn-warning btn-sm">Edit</a>
                    <a href="user?action=delete&id=<%= rs.getInt("id") %>"
                       class="btn btn-danger btn-sm">Delete</a>

                </td>
                </tr>

                <%
                    }
                %>
            </table>


            <% while(rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("email") %></td>

                <td><%= rs.getString("password") %></td>

                <td>
                    <a href="users.jsp?id=<%= rs.getInt("id") %>&username=<%= rs.getString("username") %>" class="btn btn-warning">Edit</a>
                    <a href="user?action=delete&id=<%= rs.getInt("id") %>" class="btn btn-danger">Delete</a>
                </td>
            </tr>
            <% } %>
    </>
    </table>
</div>
</div>
</body>
</html>
