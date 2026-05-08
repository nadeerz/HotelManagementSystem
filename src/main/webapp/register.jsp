<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Wedding Hotel System</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        .register-card {
            width: 100%;
            max-width: 500px;
            background: white;
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.3);
            animation: fadeIn 0.8s ease;
        }

        .logo {
            font-size: 60px;
            color: #ff4b2b;
            margin-bottom: 10px;
        }

        .title {
            font-size: 32px;
            font-weight: bold;
            color: #203a43;
        }

        .subtitle {
            color: gray;
            margin-bottom: 25px;
        }

        .form-control {
            height: 50px;
            border-radius: 12px;
        }

        .btn-register {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            border: none;
            height: 50px;
            border-radius: 12px;
            color: white;
            font-weight: bold;
            transition: 0.3s;
        }

        .btn-register:hover {
            transform: scale(1.03);
        }

        .login-link {
            text-decoration: none;
            font-weight: bold;
            color: #ff416c;
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

<div class="register-card">

    <div class="text-center">

        <div class="logo">
            <i class="fa-solid fa-user-plus"></i>
        </div>

        <div class="title">
            Create Account
        </div>

        <div class="subtitle">
            Register to Wedding Hotel System
        </div>

    </div>

    <form action="register" method="post">

        <div class="mb-3">
            <label class="form-label fw-bold">Username</label>

            <input type="text"
                   name="username"
                   class="form-control"
                   placeholder="Enter username"
                   required>
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">Email</label>

            <input type="email"
                   name="email"
                   class="form-control"
                   placeholder="Enter email"
                   required>
        </div>

        <div class="mb-3">
            <label class="form-label fw-bold">Password</label>

            <input type="password"
                   name="password"
                   class="form-control"
                   placeholder="Enter password"
                   required>
        </div>

        <button type="submit" class="btn btn-register w-100">
            <i class="fa fa-user-check"></i>
            Register Now
        </button>

    </form>

    <div class="text-center mt-4">
        Already have an account?
        <a href="login.jsp" class="login-link">
            Login
        </a>
    </div>

</div>

</body>
</html>
