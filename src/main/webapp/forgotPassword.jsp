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

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>

        body{
            background: linear-gradient(135deg,#141e30,#243b55);
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            font-family:Arial,sans-serif;
        }

        .forgot-card{
            width:100%;
            max-width:420px;
            background:white;
            border-radius:25px;
            padding:40px;
            box-shadow:0 15px 40px rgba(0,0,0,0.3);
            animation:fadeIn 0.8s ease;
        }

        .icon{
            font-size:60px;
            color:#ff4b2b;
            margin-bottom:15px;
        }

        .title{
            font-size:30px;
            font-weight:bold;
            color:#243b55;
        }

        .subtitle{
            color:gray;
            margin-bottom:25px;
        }

        .form-control{
            height:50px;
            border-radius:12px;
        }

        .btn-reset{
            background:linear-gradient(to right,#ff416c,#ff4b2b);
            border:none;
            height:50px;
            border-radius:12px;
            color:white;
            font-weight:bold;
            transition:0.3s;
        }

        .btn-reset:hover{
            transform:scale(1.03);
        }

        .back-link{
            text-decoration:none;
            color:#ff416c;
            font-weight:bold;
        }

        @keyframes fadeIn{

            from{
                opacity:0;
                transform:translateY(20px);
            }

            to{
                opacity:1;
                transform:translateY(0);
            }
        }

    </style>

</head>
<body>

<div class="forgot-card">

    <div class="text-center">

        <div class="icon">
            <i class="fa-solid fa-lock"></i>
        </div>

        <div class="title">
            Forgot Password
        </div>

        <div class="subtitle">
            Reset your account password
        </div>

    </div>

    <form action="forgotPassword" method="post">

        <div class="mb-3">

            <label class="form-label fw-bold">
                Email Address
            </label>

            <input type="email"
                   name="email"
                   class="form-control"
                   placeholder="Enter your email"
                   required>

        </div>

        <div class="mb-3">

            <label class="form-label fw-bold">
                New Password
            </label>

            <input type="password"
                   name="newPassword"
                   class="form-control"
                   placeholder="Enter new password"
                   required>

        </div>

        <button type="submit"
                class="btn btn-reset w-100">

            <i class="fa fa-key"></i>
            Reset Password

        </button>

    </form>

    <div class="text-center mt-4">

        Remember password?

        <a href="login.jsp"
           class="back-link">

            Back to Login

        </a>

    </div>

</div>

</body>
</html>