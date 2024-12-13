
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css?version=1">
    <link rel="stylesheet" href="styles/login.css?version=1">
    <link rel="stylesheet" type="text/css" href="styles/bootstrap.css?version=1">
    <link rel="stylesheet" type="text/css" href="styles/base.css?version=1">
    <link rel="stylesheet" type="text/css" href="styles/main.css?version=1">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css?version=1">
    <link rel="stylesheet" type="text/css" href="styles/news.css?version=1">
    <link rel="stylesheet" type="text/css" href="styles/footer.css?version=1">
    <link rel="stylesheet" type="text/css" href="styles/nav.css?version=1">
    <script type="text/javascript" src="javascripts/jquery-3.7.1.js"></script>
    <title>Title</title>
</head>
<body>
    <jsp:include page="Components/header.jsp" />
    <section class="verify-section">
        <div class="container justify-content-center align-items-center">
            <div class="verify-box">
                <h1 class="verify-title text-center py-2">Xác thực đơn hàng</h1>
                <div id="error-message" class="text-danger text-center"></div>
                <form method="post" action="verifyOrder" id="verifyForm" accept-charset="UTF-8" class="verify-form">
                    <!-- Mã hash -->
                    <div class="my-5 input-group">
                        <input type="text" class="form-control py-3" placeholder="Mã hash" aria-label="Mã hash" aria-describedby="button-addon2">
                        <button class="btn btn-outline-secondary px-4 py-2" type="button" id="button-addon2">Copy</button>
                    </div>

                    <!-- Chữ ký điện tử -->
                    <div class="input-group my-5">
                            <label for="digitalSignature" style="align-content: space-around" class="col-sm-1 col-form-label">Chữ ký điện tử:</label>
                            <div class="col-sm-11 ps-4 p-0">
                                <input type="text" id="digitalSignature" name="digitalSignature" class="form-control py-3 w-100" placeholder="Nhập chữ ký điện tử" required>
                            </div>
                    </div>

                    <!-- Nút xác thực -->
                    <div class="pull-xs-left justify-content-center text-center">
                        <button type="submit" value=""
                                class="btn btn-green px-5 py-3 my-2" style="color: #fff">Xác thực</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <footer>
        <jsp:include page="Components/footer.jsp" />
    </footer>
</body>

<script>

</script>
</html>
