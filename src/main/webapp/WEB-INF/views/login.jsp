<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GoTrek | Sign In</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&family=Open+Sans:wght@400;600;700&family=Poppins:wght@500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>
        :root {
            --bg-gradient: linear-gradient(180deg, #0B1D26 0%, #0F2A38 100%);
            --accent-color: #FBD784;
            --text-white: #FFFFFF;
            --text-muted: rgba(255, 255, 255, 0.6);
            --card-bg: rgba(255, 255, 255, 0.03);
            --card-border: rgba(255, 255, 255, 0.08);
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background: var(--bg-gradient);
            color: var(--text-white);
            font-family: 'Open Sans', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .auth-container {
            width: 100%;
            max-width: 420px;
            padding: 40px;
            background: var(--card-bg);
            border: 1px solid var(--card-border);
            border-radius: 24px;
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            box-shadow: 0 25px 50px rgba(0,0,0,0.4);
        }

        .auth-header { text-align: center; margin-bottom: 30px; }
        .auth-header h2 { font-family: 'Playfair Display', serif; font-size: 32px; margin-bottom: 8px; color: #fff; }
        .auth-header p { font-size: 14px; color: var(--text-muted); }

        .form-group { margin-bottom: 20px; position: relative; }
        .form-group i { position: absolute; left: 16px; top: 43px; color: var(--accent-color); font-size: 14px; }
        .form-group label { display: block; font-size: 12px; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 8px; font-weight: 600; color: var(--text-white); }
        .form-group input { width: 100%; padding: 14px 16px 14px 44px; background: rgba(255,255,255,0.03); border: 1px solid rgba(255,255,255,0.1); border-radius: 12px; color: #fff; outline: none; transition: all 0.3s ease; font-size: 14px; }
        .form-group input:focus { border-color: var(--accent-color); background: rgba(255,255,255,0.06); box-shadow: 0 0 10px rgba(251, 215, 132, 0.1); }

        .submit-btn { width: 100%; padding: 14px; background: var(--accent-color); border: none; border-radius: 12px; color: #0B1D26; font-family: 'Poppins', sans-serif; font-size: 14px; font-weight: 700; text-transform: uppercase; letter-spacing: 0.5px; cursor: pointer; transition: all 0.3s ease; margin-top: 10px; }
        .submit-btn:hover { background: #fff; transform: translateY(-2px); box-shadow: 0 5px 15px rgba(251, 215, 132, 0.2); }

        .auth-footer { text-align: center; margin-top: 25px; font-size: 14px; color: var(--text-muted); }
        .auth-footer a { color: var(--accent-color); text-decoration: none; font-weight: 600; }
        .auth-footer a:hover { text-decoration: underline; }

        .alert { padding: 12px; border-radius: 8px; font-size: 13px; margin-bottom: 20px; text-align: center; }
        .alert-danger { background: rgba(255, 107, 107, 0.15); border: 1px solid rgba(255, 107, 107, 0.3); color: #ff6b6b; }
        .alert-success { background: rgba(46, 204, 113, 0.15); border: 1px solid rgba(46, 204, 113, 0.3); color: #2ecc71; }
    </style>
</head>
<body>

<div class="auth-container">
    <div class="auth-header">
        <h2>Sign In</h2>
        <p>Access your expedition profile</p>
    </div>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <c:if test="${param.registered eq 'true'}">
        <div class="alert alert-success">Registry completed! Sign in below.</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="POST">
        <div class="form-group">
            <label>Email Address</label>
            <i class="fa-solid fa-envelope"></i>
            <input type="email" name="email" placeholder="name@domain.com" required>
        </div>
        <div class="form-group">
            <label>Password</label>
            <i class="fa-solid fa-lock"></i>
            <input type="password" name="password" placeholder="••••••••" required>
        </div>
        <button type="submit" class="submit-btn">Authorize Access</button>
    </form>

    <div class="auth-footer">
        New to the trails? <a href="${pageContext.request.contextPath}/register">Create Account</a>
    </div>
</div>

</body>
</html>