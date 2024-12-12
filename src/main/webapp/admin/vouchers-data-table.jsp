<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" type="text/css" media="all"
          href='../styles/bootstrap.css'>
    <link rel="stylesheet" type="text/css" href="../styles/base.css">
    <link rel="stylesheet" type="text/css" href="../styles/main.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="styles/admin.css?abs">
    <script src="javascripts/chart.js"></script>
</head>
<style>
    .modal-form {
        display: none;
        position: fixed;
        transform: translate(-50%, -50%);
        z-index: 1050;
    }

    .form-voucher {
        width: 500px;
        margin: auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 10px;
    }

    .form-voucher label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form-voucher input {
        width: 100%;
        padding: 10px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 4px;
        transition: border-color 0.3s ease;
    }

    .form-voucher input:focus {
        border-color: #007bff;
    }

    .form-voucher button {
        margin: auto;
        display: block;
        background-color: #007bff;
        color: #fff;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .form-voucher button:hover {
        background-color: #0056b3;
    }

    #orders th, #orders td {
        text-align: center;
        vertical-align: middle;
    }
</style>

<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="left-menu.jsp"></jsp:include>
        <div class="col-10 h-100 pt-3">
            <div
                    class="container title d-flex justify-content-between bg-white rounded">
                <h5>Quản lý voucher</h5>
                <span class="date">Thứ 6, ngày 19/07/2024</span>
            </div>
            <div class="container-fluid">
                <div class="row w-100">
                    <div class="col-12">
                        <div class="list-orders mt-3 bg-white w-100">
                            <div class="sub-title">
                                <h4>Danh sách các voucher</h4>
                            </div>
                            <div class="btns mt-3 btn-sm">
                                <button id="createCategory" class="btn btn-success " data-toggle="modal"
                                        data-target="#newCategoryModal">
                                    <i class="fa-solid fa-plus"></i>Tạo voucher mới
                                </button>
                            </div>

                            <table class="table" id="orders">
                                <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Mã</th>
                                    <th scope="col">Mức giảm</th>
                                    <th scope="col">Loại giảm giá</th>
                                    <th scope="col">Mô tả</th>
                                    <th scope="col">Loại danh mục</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Điều kiện</th>
                                    <th scope="col">Ngày hết hạn</th>
                                    <th scope="col">Chức năng</th>
                                </tr>
                                </thead>
                                <c:forEach items="${discounts}" var="item">
                                    <tbody id="${item.id}">
                                    <tr>
                                        <td>${item.id}</td>
                                        <td>${item.code}</td>
                                        <td>${item.amount}</td>
                                        <td>${item.type}</td>
                                        <td>${item.description}</td>
                                        <td>${item.categoryId}</td>
                                        <td>${item.quantity}</td>
                                        <td>${item.condition}</td>
                                        <td>${item.expDate}</td>
                                        <td>
                                            <div class="btn-group">
                                                <button class="btn btn-secondary btn-sm me-1 btn-delete"
                                                        data-target=${item.id}>
                                                    <i class='fa-solid fa-trash'></i>
                                                </button>
                                                <button class="btn btn-warning btn-sm btn-edit-voucher"
                                                        data-toggle="modal" data-target="#newCategoryModal"
                                                        data-id="${item.id}">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:forEach>
                            </table>
                            <div class="delete-form">
                                <form action="DiscountsController" method="post" id="delete-form">
                                    <input type="hidden" name="pos" id="pos" value="">
                                    <input type="hidden" name="action" value="deleteVoucher">
                                </form>
                            </div>
                            <div class="modal fade" id="newCategoryModal" tabindex="-1"
                                 aria-labelledby="newCategoryModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-form">
                                    <div class="modal-content form-voucher">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="newCategoryModalLabel">Tạo Voucher Mới</h5>
                                            <button type="button" class="btn-close" data-dismiss="modal"
                                                    aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="DiscountsController" method="post" id="changeVoucher">
                                                <input type="hidden" name="position" id="position" value="">
                                                <input type="hidden" name="action" value="">
                                                <div class="form-group">
                                                    <label for="voucherIdInput">Mã Voucher</label>
                                                    <input class="form-control" id="voucherIdInput" name="voucherCode"
                                                           type="text" placeholder="Nhập mã voucher" required>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col">
                                                            <label for="VoucherTypeFilter">Loại Voucher</label>
                                                            <div class="input-group">
                                                                <div class="input-group-append w-100 ">
                                                                    <select id="VoucherTypeFilter"
                                                                            class="form-select w-100 h-100"
                                                                            style=" padding: 10px;" name="discountType">
                                                                        <option value="FREESHIP">FREE SHIP</option>
                                                                        <option value="percentage">Giảm theo %</option>
                                                                        <option value="fixed">Giảm theo số tiền cụ thể
                                                                        </option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <label for="voucherCategoryInput">Loại danh mục</label>
                                                            <div class="input-group">
                                                                <div class="input-group-append w-100 ">
                                                                    <select class="form-select"
                                                                            id="voucherCategoryInput"
                                                                            name="voucherCategory" required
                                                                            class="form-select h-100"
                                                                            style=" padding: 10px;">
                                                                        <option value="0">Tất cả danh mục</option>
                                                                        <c:forEach items="${categories}" var="category">
                                                                            <option value="${category.id}">${category.name}</option>
                                                                            <c:forEach items="${category.children}"
                                                                                       var="child">
                                                                                <option value="${child.id}">&nbsp;&nbsp;&nbsp;${child.name}</option>
                                                                            </c:forEach>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col">
                                                            <label for="voucherDiscountInput">Mức giảm</label>
                                                            <div class="input-group">
                                                                <input class="form-control" id="voucherDiscountInput"
                                                                       name="amount" type="number" min="0" required>
                                                                <div class="input-group-append">
                                                                    <select id="saleTypeFilter" disabled
                                                                            class="form-select h-100">
                                                                        <option value="đ">đ</option>
                                                                        <option value="%">%</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <label for="voucherMinPurchaseInput">Mua tối thiểu
                                                                (VNĐ)</label>
                                                            <input class="form-control" id="voucherMinPurchaseInput"
                                                                   name="condition" type="number" min="0" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col">
                                                            <label for="voucherQuantityInput">Số lượng</label>
                                                            <input class="form-control" id="voucherQuantityInput"
                                                                   name="quantity" type="number" min="0" required>
                                                        </div>
                                                        <div class="col">
                                                            <label for="voucherExpiryDateInput">Ngày hết hạn</label>
                                                            <input class="form-control" id="voucherExpiryDateInput"
                                                                   type="date" name="expiryDate" required>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="voucherDescriptionInput">Mô tả</label>
                                                    <textarea class="form-control" id="voucherDescriptionInput"
                                                              name="description" rows="3" required></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <button class="btn btn-primary" id="addVoucher" type="submit">Thêm
                                                        Voucher
                                                    </button>
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
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../javascripts/jquery-3.7.1.js"></script>
<script src="../javascripts/bootstrap.min.js"></script>
<script src="../javascripts/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
    $(".nav-link").removeClass("active");
    $("#customers-nav-link").addClass("active");

    $(document).ready(function () {
        $(".modal-form").hide();

        $("#createCategory").click(function () {
            $(".modal-form").toggle();
        });

        $(".btn-edit-voucher").click(function () {
            $(".modal-form").toggle();
            var voucherId = $(this).data("id");
            $("#newCategoryModalLabel").text("Chỉnh Sửa Voucher");
            $("#addVoucher").text("Chỉnh Sửa Voucher")
            let index = $("#position").val(voucherId);
            $("#changeVoucher > input[name='action']").val("changeVoucher");
            var row = $(this).closest("tr");
            $("#voucherIdInput").val(row.find("td:nth-child(2)").text().trim());
            $("#voucherDiscountInput").val(row.find("td:nth-child(3)").text().trim());
            $("#VoucherTypeFilter").val(row.find("td:nth-child(4)").text().trim());
            $("#voucherCategoryInput").val(row.find("td:nth-child(6)").text().trim());
            $("#voucherMinPurchaseInput").val(row.find("td:nth-child(8)").text().trim());
            $("#voucherQuantityInput").val(row.find("td:nth-child(7)").text().trim());
            $("#voucherExpiryDateInput").val(row.find("td:nth-child(9)").text().trim());
            $("#voucherDescriptionInput").val(row.find("td:nth-child(5)").text().trim());

            console.log(index);
        });
        $(".addVoucher").click(function () {
            $("#newCategoryModalLabel").text("Thêm Voucher");
            $("#addVoucher").text("Thêm Voucher")
        })

        let deleteForm = $(".delete-form");

        function showDeleteForm() {
            deleteForm.css("display", "flex");
        }

        // Ẩn mẫu địa chỉ
        function hideDeleteForm() {
            deleteForm.css("display", "none");
        }

        $(".btn-delete").click(function () {
            var voucherId = $(this).data("target");
            let index = $("#pos").val(voucherId);
            Swal.fire({
                title: "Bạn có chắc muốn xóa chứ?",
                text: "Một khi đã xóa sẽ không thể khôi phục",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Tôi muốn xóa"
            }).then((result) => {
                if (result.isConfirmed) {
                    $("#delete-form").submit();
                }
            });
        })
        $(".btn-huy").click(function () {
            hideDeleteForm();
        })
        document.getElementById('VoucherTypeFilter').addEventListener('change', function () {
            var voucherType = this.value;
            var saleTypeFilter = document.getElementById('saleTypeFilter');

            if (voucherType === 'percentage') {
                saleTypeFilter.value = '%';
            } else {
                saleTypeFilter.value = 'đ';
            }
        });
    });

</script>
</html>
