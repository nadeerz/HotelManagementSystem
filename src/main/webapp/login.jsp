<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Wedding Hotel System</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #1e1e2f, #2c3e50);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
        }

        .login-card {
            width: 100%;
            max-width: 420px;
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            animation: fadeIn 0.8s ease;
        }

        .logo {
            font-size: 55px;
            color: #e91e63;
            margin-bottom: 10px;
        }

        .title {
            font-weight: bold;
            font-size: 28px;
            color: #333;
        }

        .subtitle {
            color: gray;
            margin-bottom: 25px;
        }

        .form-control {
            border-radius: 12px;
            height: 50px;
        }

        .btn-login {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            border: none;
            color: white;
            height: 50px;
            border-radius: 12px;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-login:hover {
            transform: scale(1.03);
        }

        .register-link {
            text-decoration: none;
            color: #ff416c;
            font-weight: bold;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>

<div class="login-card">

    <div class="text-center">
        <div class="logo">
            <i class="fa-solid fa-heart"></i>
        </div>

        <div class="title">Wedding Hotel System</div>
        <div class="subtitle">Login to continue</div>
    </div>

    <form action="login" method="post">

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email"
                   name="email"
                   class="form-control"
                   placeholder="Enter your email"
                   required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password"
                   name="password"
                   class="form-control"
                   placeholder="Enter your password"
                   required>
        </div>

        <button type="submit" class="btn btn-login w-100">
            <i class="fa fa-sign-in-alt"></i> Login
        </button>

        <div class="text-end mt-3">

            <a href="forgotPassword.jsp"
               class="btn btn-outline-danger rounded-pill px-3">

                <i class="fa fa-lock"></i>
                Forgot Password?

            </a>

    </div>
    <div class="text-center mt-4">
        Don't have an account?
        <a href="register.jsp" class="register-link">Register</a>
    </div>
    </form>
</div>

</body>
</html>
