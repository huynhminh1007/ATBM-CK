<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css?version=1">
    <link rel="stylesheet" href="../styles/login.css?version=1">
    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.css?version=1">
    <link rel="stylesheet" type="text/css" href="../styles/base.css?version=1">
    <link rel="stylesheet" type="text/css" href="../styles/main.css?version=1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css?version=1">
    <title></title>
    <style>
        .h_recover {
            display: none;
        }

        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu nền và độ trong suốt */
            z-index: 9999;
        }

        .loader-container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

        .loader {
            border: 8px solid #f3f3f3;
            border-top: 8px solid #3498db;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1.5s linear infinite;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }

        .quenmk {
            cursor: pointer;
        }
    </style>

</head>
<%
    String error = request.getAttribute("error") == null ? "" : (String) request.getAttribute("error");
    String email = request.getAttribute("email") == null ? "" : (String) request.getAttribute("email");
%>
<body>
<section class="section">
    <div class="container">
        <div class="wrap_background_aside">
            <div class="row">
                <div style="margin: auto;"
                     class="col-lg-4 col-md-6 col-sm-12 col-12 col-xl-4 offset-xl-4 offset-lg-4 offset-md-3 offset-xl-3 ">
                    <div class="row mt-5 no-margin align-items-center"
                         style="background: #fff; border-radius: 5px;">
                        <img
                                src="../images/logo/logo.png" alt="" width="200" height=""
                                class="d-inline-block align-text-top" title="Logo">
                        <div class="page-login clearfix">
                            <div class="wpx">
                                <h1 class="title_heads text-center">
                                    <span>Đăng nhập</span>
                                </h1>
                                <div id="overlay">
                                    <div class="loader-container">
                                        <div class="loader"></div>
                                    </div>
                                </div>
                                <div id="error-message" style="color: red;"></div>
                                <div id="login" class="section">
                                    <form method="post" action="StaffController?action=login" id="customer_login"
                                          accept-charset="UTF-8">
                                        <input name="FormType" type="hidden" value="customer_login">
                                        </span>
                                        <div class="form-signup clearfix">
                                            <fieldset class="form-group">
                                                <input type="email"
                                                       pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$"
                                                       class="form-input" value="${email}" name="email" id="email"
                                                       placeholder="Email" required="">
                                            </fieldset>
                                            <fieldset class="form-group">
                                                <input type="password" class=" form-input" value=""
                                                       name="password" id="customer_password"
                                                       required
                                                       placeholder="Mật khẩu">
                                                <div id="eye">
                                                    <i class="far fa-eye"></i>
                                                </div>
                                            </fieldset>
                                            <span class="text-danger">${requestScope.error}</span>
                                            <div class="pull-xs-left justify-content-center text-center">
                                                <button type="submit" value=""
                                                        class="btn btn-green w-100 my-2" style="color: #fff">Đăng
                                                    nhập
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>

<script>

</script>

</html>