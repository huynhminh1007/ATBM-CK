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
    <style>
        .spinner {
            border: 4px solid rgba(0, 0, 0, 0.1);
            border-left-color: green;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to {
                transform: rotate(360deg);
            }
        }

        #pdf-canvas {
            border: 1px solid #ccc;
            width: 80%;
            height: auto;
        }
    </style>
</head>
<body>
<jsp:include page="Components/header.jsp"/>

<section class="section">
    <div class="container ">
        <div class="wrap_background_aside ">
            <div class="wrap_background_aside">
                <div class="row">
                    <div style="margin: auto;"
                         class="">
                        <h2 class="text-center">Kiểm tra đơn hàng</h2>
                        <div class="d-flex justify-content-center ">
                            <canvas id="pdf-canvas"></canvas>
                        </div>
                        <form id="key-upload-form" style="width: 700px" class="mt-3 d-flex align-items-center"
                              enctype="multipart/form-data" method="post"
                        >
                            <input accept=application/pdf name="order-pdf" type="file" id="order-pdf"
                                   class="form-control"
                                   required>
                            <button id="btn_upload_key" onclick="handleSubmit()" type="button"
                                    class="btn btn-success w-25 ms-2">Kiểm tra
                            </button>
                        </form>
                        <div id="loading">
                            <div class="spinner m-auto my-2 "></div>
                        </div>
                        <div class=" border-s-r-5 p-3 mt-3" id="result">
                            <h3 class="text-center text-success">Kiểm tra chữ ký số</h3>
                            <div>
                                <span class="text-lg-start">Khách hàng:</span>
                                <span class="text-success fw-bold" id="result-fullName"></span>
                            </div>
                            <div>
                                <span class="text-lg-start">Mã hóa đơn:</span>
                                <span class="text-success fw-bold" id="result-orderId"></span>
                            </div>
                            <div>
                                <span class="text-lg-start">Chữ ký điện tử:</span>
                                <span class="text-success fw-bold" id="result-signature"></span>
                            </div>
                            <div style="height: 2px" class="my-2 w-300 bg-dark">
                                &nbsp;
                            </div>
                            <div>
                                <span class="text-lg-start">Kết quả:</span>
                                <span class="text-success fw-bold" id="result-result"></span>
                            </div>
                        </div>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>
<script>
    const pdfInput = document.getElementById('order-pdf');
    const pdfCanvas = document.getElementById('pdf-canvas');
    $("#loading").hide();
    $("#result").hide();
    const pdfCtx = pdfCanvas.getContext('2d');
    const handleSubmit = () => {
        if (!pdfInput.files.length) {
            notify("Thông báo", "Vui lòng tải lên hóa đơn", "error")
            return;
        }
        const formData = new FormData();
        formData.append("order-pdf", pdfInput.files[0])
        $.ajax({
            url: "/OrderVerifyPdf",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            beforeSend: function () {
                $("#loading").show();
            },
            success: function (data) {
                $("#loading").hide();
                renderResult(data);
            },
            error: function (xhr, status, error) {
                notify("Thông báo", "Đơn hàng không tồn tại chữ ký điện tử", "error")
                $("#loading").hide();
            },
        });
    }
    const renderResult = (data) => {
        $("#result").show();
        fullNameTag = $("#result-fullName")
        orderIdTag = $("#result-orderId")
        signatureTag = $("#result-signature")
        resultTag = $("#result-result")
        fullNameTag.text(data.user);
        orderIdTag.text(data.orderId);
        signatureTag.text(data.digitalSignature);
        if (data.status === "success") {
            resultTag.removeClass("text-danger")
            resultTag.addClass("text-success")
            resultTag.text("Đơn hàng toàn vẹn");
        }
        if (data.status === "unmatched") {
            resultTag.removeClass("text-success")
            resultTag.addClass("text-danger")
            resultTag.text("Đơn hàng đã bị thay đổi");
        }
    }
    pdfInput.addEventListener('change', function (event) {
        const file = event.target.files[0];
        if (file && file.type === 'application/pdf') {
            const fileReader = new FileReader();
            fileReader.onload = function () {
                const pdfData = new Uint8Array(fileReader.result);
                pdfjsLib.getDocument(pdfData).promise.then(function (pdf) {
                    pdf.getPage(1).then(function (page) {
                        console.log('Page loaded.');
                        const viewport = page.getViewport({scale: 2.0});
                        pdfCanvas.width = viewport.width;
                        pdfCanvas.height = viewport.height / 1.5
                        const renderContext = {
                            canvasContext: pdfCtx,
                            viewport: viewport,
                        };
                        page.render(renderContext).promise.then(function () {
                            console.log('Page rendered.');
                        });
                    });
                }).catch(function (error) {
                    console.error('Error loading PDF:', error);
                });
            };
            fileReader.readAsArrayBuffer(file);
        } else {
            alert('Please select a valid PDF file.');
        }
    });
</script>
</html>