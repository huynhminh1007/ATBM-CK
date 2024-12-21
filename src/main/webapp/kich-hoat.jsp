<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
            rel="stylesheet"/>
    <script defer src="javascripts/select2.min.js"></script>
    <title>Kích hoạt</title>
</head>
<body>
<jsp:include page="Components/header.jsp"/>
<section class="verify-section">
    <div class="container justify-content-center align-items-center">
        <div class="verify-box">
            <h1 class="verify-title text-center py-2">Xác thực đơn hàng</h1>
            <div id="error-message" class="text-danger text-center"></div>
            <form method="post" action="verifyOrder" id="verifyForm" accept-charset="UTF-8" class="verify-form">
                <!-- Mã hash -->
                <div class="my-5 input-group">
                        <label for="hashInput" style="align-content: space-around" class="col-sm-1 col-form-label me-4" title="Mã hash đã được tạo tự động và có thể sao chép bằng cách nhấn nút Copy.">
                            Mã hash:
                        </label>
                            <input id="hashInput" type="text" class="form-control py-3 col-sm-11" placeholder="Mã hash"
                                   aria-label="Mã hash"
                                   readonly>
                            <button class="btn btn-outline-secondary px-4 py-2" type="button" id="button-addon2">Copy</button>
                </div>

                <!-- Chữ ký điện tử -->
                <div class="input-group my-5">
                    <label for="digitalSignature" style="align-content: space-around" class="col-sm-1 col-form-label">Chữ
                        ký điện tử:</label>
                    <div class="col-sm-11 ps-4 p-0">
                        <input type="text" id="digitalSignature" name="digitalSignature" class="form-control py-3 w-100"
                               placeholder="Nhập chữ ký điện tử" required>
                    </div>
                </div>

                <!-- Nút xác thực -->
                <div class="pull-xs-left justify-content-center text-center">
                    <button type="button" id="submitButton" class="btn btn-green px-5 py-3 my-2" style="color: #fff">Xác
                        thực
                    </button>
                </div>
            </form>
        </div>
    </div>
</section>
<footer>
    <jsp:include page="Components/footer.jsp"/>
</footer>
</body>

<script>
    document.getElementById("button-addon2").addEventListener("click", function () {
        const hashInput = document.querySelector('input[placeholder="Mã hash"]');
        hashInput.select();
        document.execCommand("copy");
        alert("Mã hash đã được sao chép!");
    });

    const urlParams = new URLSearchParams(window.location.search);
    const orderId = urlParams.get('orderId');

    // Gửi yêu cầu AJAX để lấy mã hash
    $(document).ready(function () {
        $.ajax({
            url: '/order-security',
            type: 'POST',
            data: {
                action: 'send-hash',
                orderId: orderId
            },
            success: function (response) {
                $('#hashInput').val(response.hash);
            },
            error: function () {
                $('#error-message').text('Có lỗi xảy ra khi lấy mã hash.');
            }
        });
        let isClicked = false;
        $('#submitButton').click(function (e) {
            e.preventDefault();
            if(isClicked) return;
            isClicked = true;

            // Lấy giá trị của chữ ký điện tử
            var digitalSignature = $('#digitalSignature').val();

            // Kiểm tra nếu chữ ký không rỗng
            if (digitalSignature.trim() === '') {
                Swal.fire({
                    title: 'Lỗi!',
                    text: 'Chữ ký điện tử không được để trống!',
                    icon: 'error'
                });
                return;
            }

            // Gửi dữ liệu qua AJAX
            $.ajax({
                url: '/order-security', // Action URL
                type: 'POST',
                data: {
                    orderId: orderId,
                    digitalSignature: digitalSignature,
                    action: 'verify-signature'
                },
                success: function (response) {
                    Swal.fire({
                        title: 'Thành công!',
                        text: 'Xác thực thành công!',
                        icon: 'success',
                        showConfirmButton: false, // Không hiển thị nút OK
                        timer: 2000 // Tự động đóng sau 3 giây
                    });
                    setTimeout(function () {
                        window.location.href = "/tai-khoan.jsp";
                        isClicked = false;
                    }, 2000); // Chờ 3 giây (3000 milliseconds)
                },

                error: function (xhr, status, error) {
                    Swal.fire({
                        title: 'Lỗi!',
                        text: 'Xác thực không thành công!',
                        icon: 'error'
                    });
                    isClicked = false;
                }
            });
        });
    });
</script>

</html>
