<%@ page import="java.sql.*,util.DBConnection" %>



<!DOCTYPE html>
<html>
<head>
    <title>Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<body style="
background: linear-gradient(to right, #f8f9fa, #e9ecef);
min-height:100vh;
">
<div class="container mt-5">

    <h2>Feedback System</h2>

    <!-- FORM -->
    <form action="feedback" method="post">

        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        <%
            String success = request.getParameter("success");
            if (success != null) {
        %>
        <script>
            window.history.replaceState(null, null, "feedback.jsp");
        </script>
        <%
            }
        %>

        <textarea name="message" class="form-control mb-2" required><%=
        request.getParameter("id") != null && request.getParameter("message") != null
                ? request.getParameter("message")
                : ""
        %></textarea>

        <button type="submit" class="btn btn-primary">Submit</button>
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
                <a href="feedback.jsp?id=<%= rs.getInt("id") %>&message=<%= rs.getString("message") %>"
                   class="btn btn-warning btn-sm">Edit</a>
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