
<%@ page import="java.sql.*,util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Feedback System</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        body {
            background: linear-gradient(to right, #141e30, #243b55);
            min-height: 100vh;
            font-family: Arial, sans-serif;
        }

        .main-card {
            background: white;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            margin-top: 50px;
        }

        .title {
            font-size: 32px;
            font-weight: bold;
            color: #243b55;
        }

        .subtitle {
            color: gray;
            margin-bottom: 20px;
        }

        .form-control {
            border-radius: 12px;
        }

        textarea {
            resize: none;
        }

        .btn-custom {
            border-radius: 30px;
            padding: 10px 25px;
            font-weight: bold;
        }

        .table {
            border-radius: 15px;
            overflow: hidden;
        }

        .navbar {
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        .footer {
            text-align: center;
            color: white;
            margin-top: 20px;
            padding-bottom: 15px;
        }
    </style>
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">
            💒 Wedding Hotel System
        </a>

        <div>
            <a href="dashboard.jsp" class="btn btn-outline-light btn-sm me-2">
                Dashboard
            </a>

            <a href="logout.jsp" class="btn btn-danger btn-sm">
                Logout
            </a>
        </div>
    </div>
</nav>

<div class="container">

    <div class="main-card">

        <div class="text-center mb-4">
            <div class="title">
                <i class="fa-solid fa-comments"></i>
                Feedback Management
            </div>

            <div class="subtitle">
                Submit and manage customer feedback
            </div>
        </div>

        <!-- FORM -->
        <form action="feedback" method="post">

            <input type="hidden" name="id"
                   value="<%= request.getParameter("id") %>">

            <div class="mb-3">
                <label class="form-label fw-bold">
                    Feedback Message
                </label>

                <textarea name="message"
                          class="form-control"
                          rows="4"
                          placeholder="Enter feedback here..."
                          required><%=
                request.getParameter("id") != null && request.getParameter("message") != null
                        ? request.getParameter("message")
                        : ""
                %></textarea>
            </div>

            <button type="submit"
                    class="btn btn-primary btn-custom">
                <i class="fa fa-paper-plane"></i>
                Submit Feedback
            </button>

        </form>

        <hr class="my-4">

        <!-- TABLE -->
        <div class="table-responsive">

            <table class="table table-hover table-striped align-middle">

                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Message</th>
                    <th width="220">Action</th>
                </tr>
                </thead>

                <tbody>

                <%
                    try {
                        Connection con = DBConnection.getConnection();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM feedback");

                        while(rs.next()) {
                %>

                <tr>
                    <td>
                        <%= rs.getInt("id") %>
                    </td>

                    <td>
                        <%= rs.getString("message") %>
                    </td>

                    <td>

                        <a href="feedback.jsp?id=<%= rs.getInt("id") %>&message=<%= rs.getString("message") %>"
                           class="btn btn-warning btn-sm rounded-pill me-2">

                            <i class="fa fa-edit"></i>
                            Edit
                        </a>

                        <a href="feedback?action=delete&id=<%= rs.getInt("id") %>"
                           class="btn btn-danger btn-sm rounded-pill"
                           onclick="return confirm('Are you sure to delete this feedback?')">

                            <i class="fa fa-trash"></i>
                            Delete
                        </a>

                    </td>
                </tr>

                <%
                        }
                    } catch(Exception e) {
                        e.printStackTrace();
                    }
                %>

                </tbody>
            </table>
        </div>

    </div>
</div>

<div class="footer">
    © 2026 Wedding Hotel Management System
</div>

</body>
</html>


