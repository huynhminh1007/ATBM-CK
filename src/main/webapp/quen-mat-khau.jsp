<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
  <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        flex-direction: column;
    }

    .container {
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        padding: 20px;
        width: 300px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    label {
        display: block;
        margin-bottom: 8px;
        color: #333;
    }

    input {
        width: calc(100% - 16px);
        padding: 8px;
        margin-bottom: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }

    button {
        background-color: #4caf50;
        color: #fff;
        padding: 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 95%;
    }
    .error{
    	color:red;
    }
</style>

</head>
<body>
<h2>Nhập mã xác nhận để đặt lại mật khẩu</h2>

   <div class="container">
		<div class="error">${error}</div>
		<form id="resetPasswordForm" action="ForgotPassword" method="post">
			<input type="hidden" name="action" value="Verifier">
    	  <input type="hidden" name="userId" value='${userId}'>
        <label for="verificationCode">Mã xác nhận:</label>
        <input type="text" id="verificationCode" name="verificationCode" required>
        
        <label for="newPassword">Mật khẩu mới:</label>
        <input type="password" id="newPassword" name="newPassword" required>
        
        <label for="confirmPassword">Xác nhận mật khẩu mới:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <button type="submit">Đặt lại mật khẩu</button>
    </form>
    </div>
</body>
</html>