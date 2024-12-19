<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="styles/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="styles/base.css">
    <link rel="stylesheet" type="text/css" href="styles/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="styles/news.css">
    <link rel="stylesheet" type="text/css" href="styles/footer.css">
    <link rel="stylesheet" type="text/css" href="styles/nav.css">
    <link rel="stylesheet" href="styles/login.css">
    <script type="text/javascript" src="javascripts/jquery-3.7.1.js"></script>
    <title>Kiểm tra đơn hàng</title>
</head>

<body>
<jsp:include page="Components/header.jsp"/>
<section class="section">
    <div class="container ">
        <div class="wrap_background_aside ">
            <div class="wrap_background_aside">
                <div class="row">
                    <div style="margin: auto;"
                         class="p-5">
                        <h2 class="text-center">Kiểm tra đơn hàng</h2>
                        <h5 class="text-secondary fst-italic">Vui lòng tải lên hóa đơn cần kiểm tra!</h5>
                        <form id="key-upload-form" style="width: 500px"
                              action="/OrderVerifyPdf"
                              enctype="multipart/form-data" method="post"
                        >
                            <div style="margin-bottom: 10px;" class="m-auto">
                                <input accept=application/pdf name="order-pdf" type="file" id="order-pdf"
                                       class="form-control"
                                       required>
                            </div>
                            <button id="btn_upload_key" type="submit" class="btn btn-success mt-3">Kiểm tra</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="Components/footer.jsp"/>
</footer>
</body>
<script type="text/javascript" src="javascripts/main.js"></script>
<script type="text/javascript" src="javascripts/jquery-3.7.1.js"></script>

</html>