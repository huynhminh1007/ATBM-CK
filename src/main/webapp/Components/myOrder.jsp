<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>DataTable Example</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.6/css/dataTables.dataTables.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .adress-form-content form input, select {
            width: 30% !important;
            margin-right: 10px;
        }

        .dt-length {
            display: flex !important;
            align-items: center;
            flex-direction: row;
        }

        #order-table th {
            text-align: center;
            font-weight: bold;
        }

        #order-table td {
            text-align: center;
        }

        #order-table td p {
            margin: 0;
        }

        .btn-order-detail {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-order-detail:hover {
            background-color: #0056b3;
        }

        #order-table {
            border-collapse: collapse;
            width: 100%;
        }

        #order-table th,
        #order-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #order-table th {
            background-color: #679210;
        }

        #order-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<table id="order-table" class="dataTable" aria-describedby="order-table_info" style="width: 100%;">
    <thead>
    <tr>
        <th>Đơn hàng</th>
        <th>Ngày</th>
        <th>Địa chỉ</th>
        <th>Giá trị đơn hàng</th>
        <th>TT đơn hàng</th>
        <th>Chức năng</th>
    </tr>
    </thead>
    <c:if test="${user ne null}">
        <c:forEach var="order" items="${user.getOrders()}">
            <tr>
                <td class="text-center">
                    <p>${order.getId()}</p>
                </td>
                <td class="text-center">
                    <p>${order.getDateCreated()}</p>
                </td>
                <td class="text-center">
                    <p class="order_address">${order.getAddress()}</p>
                </td>
                <td class="text-center">
                        ${order.getTotalPrice()}
                </td>
                <td class="text-center" style="color: #e39b04">
                    <p>${order.getStatus().getDescription()}</p>
                </td>
                <td class="text-center">
                    <div class="btn-group">
                        <a target="_blank"
                           href="UserOrderController?action=detail&orderId=${order.id}">
                            <button
                                    class="btn btn-secondary btn-sm me-1 btn-order-detail"
                                    data-target=${item.id}>
                                <i class="fa-solid fa-circle-info"></i>
                            </button>
                        </a>

                        <button class="btn btn-primary btn-sm btn-order-edit ms-2"
                                data-target="${order.id}">
                            <i class="fa-solid fa-pen-to-square"></i>
                        </button>

                    </div>
                </td>
            </tr>
        </c:forEach>
    </c:if>
</table>

<div id="updateAddressModal" class="modal fade" tabindex="-1" aria-labelledby="updateAddressModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form id="update-address-form">
                <!-- Title -->
                <div class="modal-header">
                    <h5 class="modal-title" id="updateAddressModalLabel">Cập nhật địa chỉ</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <input type="hidden" name="action" value="changeAddress">
                <input type="hidden" name="orderId" id="orderId">
                <!-- Form Body -->
                <div class="modal-body">
                    <!-- Địa chỉ chi tiết -->
                    <div class="mb-3">
                        <label for="street" class="form-label">Số nhà, tên đường</label>
                        <input type="text" class="form-control" id="street" name="street"
                               value="" required>
                    </div>

                    <!-- Phường/Xã -->
                    <div class="mb-3">
                        <label for="ward" class="form-label">Phường/Xã</label>
                        <input type="text" class="form-control" id="ward" name="ward"
                               value="" required>
                    </div>

                    <!-- Quận/Huyện -->
                    <div class="mb-3">
                        <label for="district" class="form-label">Quận/Huyện</label>
                        <input type="text" class="form-control" id="district" name="district"
                               value="" required>
                    </div>

                    <!-- Tỉnh/Thành phố -->
                    <div class="mb-3">
                        <label for="province" class="form-label">Tỉnh/Thành phố</label>
                        <input type="text" class="form-control" id="province" name="province"
                               value="" required>
                    </div>

                    <!-- Người nhận -->
                    <div class="mb-3">
                        <label for="recipientName" class="form-label">Người nhận</label>
                        <input type="text" class="form-control" id="recipientName" name="recipientName"
                               value="" required>
                    </div>

                    <!-- Số điện thoại -->
                    <div class="mb-3">
                        <label for="phone" class="form-label">Số điện thoại</label>
                        <input type="text" class="form-control" id="phone" name="phone"
                               value=""
                               pattern="[0-9]{10,11}" required>
                    </div>
                </div>

                <!-- Form Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    let table = new DataTable('#order-table', {
    });
    $(document).ready(function () {
        $('.btn-order-edit').click(function () {
            $('#updateAddressModal').modal('show');
            var orderId = $(this).data("target");
            var currentRow = $(this).closest('tr');
            var address = currentRow.find('.order_address').text();

            var houseNumber = address.match(/^(\d+)/)?.[1] || ""; // Số nhà
            var commune = address.match(/Xã\s([^,]+)/)?.[1] || ""; // Xã
            var district = address.match(/Huyện\s([^,]+)/)?.[1] || ""; // Huyện
            var province = address.match(/Tỉnh\s([^,]+)/)?.[1] || ""; // Tỉnh
            var recipient = address.match(/Người nhận:\s([^,]+)/)?.[1] || ""; // Người nhận
            var phone = address.match(/Số điện thoại:\s(\d+)/)?.[1] || ""; // Số điện thoại

            // Hiển thị kết quả (có thể gắn vào các input trong modal)
            $('#orderId').val(orderId);
            $('#street').val(houseNumber);
            $('#ward').val(commune);
            $('#district').val(district);
            $('#province').val(province);
            $('#recipientName').val(recipient);
            $('#phone').val(phone);
        });

        $('#update-address-form').submit(function (event) {
            event.preventDefault(); // Ngăn hành vi mặc định của form

            // Thu thập dữ liệu từ form
            let formData = {
                action: 'changeAddress',
                orderId: $('#orderId').val(),
                street: $('#street').val(),
                ward: $('#ward').val(),
                district: $('#district').val(),
                province: $('#province').val(),
                recipientName: $('#recipientName').val(),
                phone: $('#phone').val()
            };

            // Gửi dữ liệu qua AJAX
            $.ajax({
                url: "UserOrderController",
                type: "GET",
                data: formData,
                success: function (response) {
                    alert("Địa chỉ đã được cập nhật thành công!");
                    $('#updateAddressModal').modal('hide');
                    let orderId = $('#orderId').val();

                    // Cập nhật địa chỉ trong bảng
                    let currentRow = $('.btn-order-edit[data-target="' + orderId + '"]').closest('tr');
                    currentRow.find('.order_address').text(response.address);
                },
                error: function (xhr, status, error) {
                    // Xử lý khi có lỗi
                    console.error("Lỗi khi cập nhật địa chỉ: " + error);
                    alert("Cập nhật địa chỉ thất bại. Vui lòng thử lại.");
                }
            });
        });
    });
</script>
</body>
</html>
