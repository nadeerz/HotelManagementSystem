<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<script>
    function validateLogin() {
        var email = document.forms["loginForm"]["email"].value;
        var password = document.forms["loginForm"]["password"].value;

        if (email.trim() === "") {
            alert("Email is required!");
            return false;
        }

        if (!email.includes("@")) {
            alert("Enter valid email!");
            return false;
        }

        if (password.trim() === "") {
            alert("Password is required!");
            return false;
        }

        if (password.length < 4) {
            alert("Password must be at least 4 characters!");
            return false;
        }

        return true;
    }
</script>

<body class="bg-dark">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4 shadow" style="width: 350px;">
        <h3 class="text-center mb-3">Login</h3>

        <form name="loginForm" action="login" method="post" onsubmit="return validateLogin()">
            <div class="mb-3">
                <input type="email" name="email" class="form-control mb-2" placeholder="Email" required>

                <input type="password" name="password" class="form-control mb-2" placeholder="Password" required minlength="4">
            </div>
            <button class="btn btn-primary w-100">Login</button>
        </form>

        <p class="text-center mt-3">
            <a href="register.jsp">Create Account</a>
        </p>
    </div>
</div>

</body>
</html>