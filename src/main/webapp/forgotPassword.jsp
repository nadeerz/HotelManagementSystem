<%--
  Created by IntelliJ IDEA.
  User: Deshan
  Date: 5/8/2026
  Time: 12:36 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body{
            background: linear-gradient(to right,#141e30,#243b55);
            height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
        }

        .card{
            width:400px;
            border-radius:20px;
            padding:20px;
        }
    </style>
</head>
<body>

<div class="card shadow">

    <h3 class="text-center mb-4">
        Reset Password
    </h3>

    <form action="forgotPassword" method="post">

        <input type="email"
               name="email"
               class="form-control mb-3"
               placeholder="Enter your email"
               required>

        <input type="password"
               name="newPassword"
               class="form-control mb-3"
               placeholder="Enter new password"
               required>

        <button class="btn btn-primary w-100">
            Update Password
        </button>

    </form>

</div>

</body>
</html>
