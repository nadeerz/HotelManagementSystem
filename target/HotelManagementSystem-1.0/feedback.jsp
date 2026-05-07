<%@ page import="java.sql.*,util.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h2>Feedback System</h2>

    <!-- FORM -->
    <form action="feedback" method="post">
        <input type="hidden" name="id" value="${param.id}">
        <textarea name="message" class="form-control mb-2" placeholder="Enter feedback" required></textarea>
        <button class="btn btn-success">Submit</button>
    </form>

    <hr>

    <!-- TABLE -->
    <table class="table table-bordered mt-3">
        <tr>
            <th>ID</th>
            <th>Message</th>
            <th>Action</th>
        </tr>

        <%
            try {
                Connection con = DBConnection.getConnection();
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM feedback");

                while(rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("message") %></td>
            <td>
                <a href="feedback?action=edit&id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                <a href="feedback?action=delete&id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm">Delete</a>
            </td>
        </tr>
        <%
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
        %>

    </table>

</div>

</body>
</html>