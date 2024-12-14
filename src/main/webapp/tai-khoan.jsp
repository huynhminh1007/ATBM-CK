<%@page import="Model.Address" %>
<%@page import="Model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.List" %>
<%@ page import="Model.security.Key" %>
<!DOCTYPE html>
<html lang="en">
<title>Trang tài khoản</title>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="styles/tai-khoan.css">
    <link rel="stylesheet" type="text/css"  href="styles/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="styles/base.css?version">
    <link rel="stylesheet" type="text/css" href="styles/main.css?version">
    <link rel="stylesheet" type="text/css" href="styles/nav.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .delete-form {
            display: none;
        }

        .text-ellipsis {
            display: inline-block;
            max-width: 300px; /* Giới hạn chiều rộng */
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            line-height: 1.2; /* Điều chỉnh chiều cao dòng */
            vertical-align: middle; /* Căn giữa dọc */
        }

        #key-table td.text-ellipsis {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 200px;  /* Tùy chỉnh chiều rộng tối đa của cột */
        }

        #dt-length-0 {
            width: 90% !important;
            margin-right: 10px;
        }
    </style>
</head>
<script src="javascripts/jquery-3.7.1.js"></script>
<script src="javascripts/tinh.js" charset="UTF-8"></script>
<link
        href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
        rel="stylesheet"/>
<script defer src="javascripts/select2.min.js"></script>
<script type="text/javascript" src="javascripts/bootstrap.min.js"></script>
<script type="text/javascript" src="javascripts/main.js"></script>

<%
    User user = session.getAttribute("user") == null ? null : (User) session.getAttribute("user");
    String error = request.getAttribute("error") == null ? "" : (String) request.getAttribute("error");
    String successMessage = request.getAttribute("successMessage") == null
            ? ""
            : (String) request.getAttribute("successMessage");
    String menuId = request.getAttribute("menu") == null ? "ACCOUNT_INFORMATION" : request.getAttribute("menu") + "";
//    // Lấy danh sách keys từ request
    List<Key> keys = (List<Key>) session.getAttribute("keys");
%>

<body>

<jsp:include page="Components/header.jsp"/>

<jsp:include page="top-title.jsp">
    <jsp:param name="title" value="Tài khoản"/>
</jsp:include>
<section class="signup">
    <div class="container">
        <div class="row pt-3">
            <div class="col-lg-3">
                <div id="page_account">
                    <h4 class="title-account">TRANG TÀI KHOẢN</h4>
                    <p class="title-account" style="font-size: 20px">
                        Xin chào! <span class="text-primary-green" id="userName"  style="font-size: 20px">${user.getFullName()}</span>
                    </p>
                </div>
                <ul class=" toc-list m-0 p-0">
                    <li class="info_account" data-target="ACCOUNT_INFORMATION"
                        style="cursor: pointer; font-size: 20px">Thông tin tài khoản
                    </li>
                    <li class="order" data-target="YOUR_ORDER" style="cursor: pointer ; font-size: 20px">Đơn
                        hàng của bạn
                    </li>
                    <li class="change-pass" data-target="Change_Password"
                        style="cursor: pointer; font-size: 20px">Đổi mật khẩu
                    </li>
                    <li class="address-number" data-target="address_your"
                        style="cursor: pointer; font-size: 20px">Số địa chỉ
                        (${user.getAddresses().size()})
                    </li>
                    <li class="key-management" data-target="Key-Manager"
                        style="cursor: pointer; font-size: 20px">Quản lý khóa
                    </li>
                </ul>
            </div>
            <div class="col-lg-9">
                <div class="block-account" id="ACCOUNT_INFORMATION">
                    <h5 class="title-acccount">THÔNG TIN TÀI KHOẢN</h5>
                    <p class="">
                        Họ tên: <strong id="user_fullname">${user.getFullName()}</strong>
                    </p>
                    <p class="">
                        Email: <strong id="user_email">${user.getEmail()}</strong>
                    </p>
                    <p class="">
                        Số điện thoại: <strong id="user_phone">${user.getPhone()}</strong>
                    </p>
                    <p class="">
                        Địa chỉ:
                        <c:if test="${user ne null}">
                            <c:forEach var="item" items="${user.getAddresses()}">
                                <c:if test="${item.isDefault()}">
                                    <strong id="user_address"> ${item.getDescription()}
                                            ${item.getWards()} ${item.getDistricts()}
                                            ${item.getProvince()} </strong>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </p>
                    <button class="btn btn-warning btn-hover" data-toggle="modal"
                            data-target="#updateInfor">Cập nhập thông tin?
                    </button>
                </div>
<%--                Đơn hàng của bạn--%>
                <div class="block-account" id="YOUR_ORDER">
                    <div class="recent-orders">
                        <div class="table-responsive-block tab-all"
                             style="overflow-x: auto;">
                            <h5 class="title-acccount">ĐƠN HÀNG CỦA BẠN</h5>
                            <jsp:include page="Components/myOrder.jsp"/>
                        </div>
                        <div
                                class="paginate-pages pull-right page-account text-right col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        </div>
                    </div>
                </div>
<%--                Thay đổi mật khẩu--%>
                <div class="block-account" id="Change_Password">
                    <div class="col-xs-12 col-sm-12 col-lg-9 col-right-ac">
                        <h5 class="title-head margin-top-0">ĐỔI MÂT KHẨU</h5>
                        <div class="row">
                            <div class="col-md-6 col-12">
                                <div class="page-login">
                                    <p id="successMessage" style="color: red;"></p>
                                    <form id="change_customer_password" accept-charset="UTF-8">
                                        <input name="FormType" type="hidden"
                                               value="change_customer_password"> <input name="utf8"
                                                                                        type="hidden" value="true">
                                        <p>Để đảm bảo tính bảo mật bạn vui lòng đặt lại mật khẩu
                                            với ít nhất 8 kí tự</p>
                                        <div class="form-signup clearfix">
                                            <fieldset class="form-group">
                                                <label for="oldPass">Mật khẩu cũ <span
                                                        class="error">*</span></label><input type="password"
                                                                                 name="OldPassword"
                                                                                 id="OldPass" required=""
                                                                                 class="form-control form-control-lg"/>
                                            </fieldset>
                                            <fieldset class="form-group">
                                                <label for="changePass">Mật khẩu mới <span
                                                        class="error">*</span></label> <input type="password"
                                                                                              name="Password"
                                                                                              id="changePass"
                                                                                              required
                                                                                              pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
                                                                                              title="Phải chứa ít nhất một số và một chữ cái viết hoa và viết thường và ít nhất 8 ký tự trở lên"
                                                                                              class="form-control form-control-lg">
                                            </fieldset>
                                            <fieldset class="form-group">
                                                <label for="confirmPass">Xác nhận lại mật khẩu <span
                                                        class="error">*</span></label> <input type="password"
                                                                                              name="ConfirmPassword"
                                                                                              id="confirmPass"
                                                                                              required=""
                                                                                              class="form-control form-control-lg">
                                            </fieldset>
                                            <button
                                                    class=" text-primary-white  btn btn-hover btn-quenmk"
                                                    style="color: #fff; background-color: var(- -primary-green)"
                                                    type="submit">
                                                <i class="hoverButton"></i>Đặt lại mật khẩu
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
<%--                Địa chỉ của bạn--%>
                <div class="block-account" id="address_your">
                    <h5 class="title-acccount">ĐỊA CHỈ CỦA BẠN</h5>
                    <p id="success" style="color: red;"></p>
                    <p class="btn-row">
                        <button class="btn btn-success btn-hover" id="add-adress"
                                type="button">Thêm địa chỉ
                        </button>
                    </p>
                    <c:if test="${user ne null}">
                        <c:forEach var="item" items="${user.getAddresses()}"
                                   varStatus="status">
                            <div class="address_info"
                                 style="border-top: 1px #ebebeb solid; padding-top: 16px; margin-top: 20px;"
                                 id=${status.count}>
                                <div class="address-group col-9">
                                    <div class="address form-signup">
                                        <p class="">
                                            Họ tên: <strong id="fullname${status.count}">${item.getNameUser()}</strong>
                                            <c:if test="${item.isDefault()}">
													<span class="address-default"> <i
                                                            class="far fa-check-circle"></i>Địa chỉ mặc định
													</span>
                                            </c:if>
                                        </p>
                                        <p>
                                            Địa chỉ: <strong> ${item.getDescription()}
                                                ${item.getWards()} ${item.getDistricts()}
                                                ${item.getProvince()} </strong>
                                        </p>

                                        <p>
                                            Số điện thoại: <strong id="phone">${item.getPhoneUser()}</strong>
                                        </p>

                                    </div>
                                </div>
                                <div id="btn-address" class="btn-address col-3">
                                    <p class="btn-row">
                                        <button class="btn-edit-addr btn btn-edit-address"
                                                type="button" data-target=${status.count}>Chỉnh
                                            sửa địa chỉ
                                        </button>
                                        <button class=" btn btn-dark-address btn-delete"
                                                type="button" data-target=${status.count}>
                                            <span style="color: red; text-align: center;">Xóa</span>
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <div class="delete-form">
                        <form action="UserInfo" method="post" id="delete-form">
                            <input type="hidden" name="indexAddress" id="indexAddress"
                                   value=""> <input type="hidden" name="action"
                                                    value="deleteAddress"> <input type="hidden" name="menu"
                                                                                  value="address_your">
                        </form>
                    </div>
                    <jsp:include page="Components/addAddress.jsp"/>
                </div>

                <div class="block-account" id="Key-Manager">
                    <div class="recent-key">
                        <div class="table-responsive-block tab-all"
                             style="overflow-x: auto;">
                            <h5 class="title-acccount">QUẢN LÝ KHÓA</h5>
                            <!-- Nút tạo khóa và upload khóa -->
                            <div style="margin-bottom: 20px; text-align: right;">
                                <button id="create-key-btn" class="btn btn-primary">
                                    <i class="fa fa-plus-circle"></i> Tải tool
                                </button>
                                <button id="upload-key-btn" class="btn btn-secondary" style="margin-left: 10px;">
                                    <i class="fa fa-upload"></i> Upload Khóa
                                </button>
                            </div>

                            <!-- Form upload khóa -->
                            <form id="key-upload-form" enctype="multipart/form-data" style="display: none; margin-top: 20px;">
                                <div style="margin-bottom: 10px;">
                                    <label for="key-file-input">Chọn Tệp Khóa:</label>
                                    <input name="key-file-input" type="file" id="key-file-input" class="form-control" required>
                                </div>
                                <button id="btn_upload_key" type="submit" class="btn btn-success">Lưu Thông Tin</button>
                            </form>

                            <!-- Khung hiển thị thông tin khóa hiện tại -->
                            <c:if test="${not empty keys}">
                            <c:forEach var="key" items="${keys}" varStatus="status">
                            <div id="current-key-container" class="card my-4" style="padding: 20px; display: ${key.isActive ? 'flex' : 'none'} ; border: 1px solid #ddd; border-radius: 5px; background-color: #f9f9f9;">
                                <h6 style="margin-bottom: 15px; font-weight: bold;">Khóa Hiện Tại</h6>

                                <div style="display: flex; flex-wrap: wrap; gap: 15px;">
                                    <p style="flex: 1 1 calc(50% - 10px); margin: 0; line-height: 1.2;" title="${key.key}">
                                        <strong style="vertical-align: middle;">Khóa:</strong>
                                        <span id="current-key" class="text-ellipsis" style="vertical-align: middle;">${key.key}</span>
                                    </p>

                                    <p style="flex: 1 1 calc(50% - 10px); margin: 0;">
                                        <strong>Thuật Toán:</strong>
                                        <span id="current-algorithm">
                                                ${key.algorithm}
                                        </span>
                                    </p>

                                    <p style="flex: 1 1 calc(50% - 10px); margin: 0;">
                                        <strong>Ngày Bắt Đầu:</strong> <span id="current-start-date">${key.beginDate}</span>
                                    </p>
                                    <p style="flex: 1 1 calc(50% - 10px); margin: 0;">
                                        <strong>Ngày Kết Thúc:</strong> <span id="current-end-date">${key.updateDate}</span>
                                    </p>
                                </div>

                                <!-- Nút Report Key -->
                                <div class="mt-4 text-end">
                                    <button id="reportKeyButton" class="btn btn-danger px-4 py-2" style="font-size: 14px;">
                                        Report Key
                                    </button>
                                </div>

                            </div>
                            </c:forEach>
                            </c:if>

                            <!-- Giao diện danh sách khóa -->
                            <jsp:include page="Components/myKey.jsp" />
                        </div>
                        <div
                                class="paginate-pages pull-right page-account text-right col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="modal" tabindex="-1" role="dialog" id="updateInfor">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form action="UserInfo" method="post">
                <input type="hidden" name="action" value="updateInfo">
                <div class="modal-header">
                    <h5 class="modal-title">Cập nhập thông tin</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="newFullName" required
                               name="newFullName" placeholder="" value="${user.fullName}">
                        <label for="newFullName">Họ tên mới</label>
                    </div>
                    <div class="form-floating">
                        <input type="number" pattern="[0-9]{10,11}"
                               class="form-control" id="newPhone" required
                               name="newPhone" placeholder="" value="${user.phone}"> <label
                            for="newPhone">Số điện thoại mới</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="update-btn" class="btn btn-primary">Lưu
                        thông tin
                    </button>
                    <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Đóng
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Hướng Dẫn Tạo Khóa -->
<div class="modal fade" id="createKeyModal" tabindex="-1" aria-labelledby="createKeyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createKeyModalLabel">Hướng Dẫn Tạo Khóa Chữ Ký Điện Tử</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p class="m-0"><strong>Bước 1:</strong> Tải công cụ hỗ trợ tạo khóa tại link bên dưới.</p>
                <a href="https://drive.google.com/file/d/1nU5_gSpPd6Bj_-i2YrgObpApZAF8jKJo/view?usp=drive_link" class="btn btn-link" target="_blank">Tải Công Cụ</a>
                <p><strong>Bước 2:</strong> Thực hiện các bước sau trong công cụ:</p>
                <ul>
                    <li> Chọn thuật toán (ví dụ: RSA, DSA).</li>
                    <li> Nhập độ dài khóa hoặc các thông tin bổ sung (nếu cần).</li>
                    <li> Nhấn nút <strong>"Tạo Khóa"</strong> để tạo khóa.</li>
                    <li> Tải khóa về file bằng nút <strong>"Save Key"</strong>.</li>
                </ul>
                <p><strong>Bước 3:</strong> Sau khi tạo khóa, nhập thông tin khóa vào hệ thống để sử dụng.</p>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<footer>
    <jsp:include page="Components/footer.jsp"/>
</footer>

<script>



    // Hiển thị form upload khi nhấn nút Upload Khóa
    document.getElementById('upload-key-btn').addEventListener('click', function() {
        var form = document.getElementById('key-upload-form');
        form.style.display = form.style.display === 'none' ? 'block' : 'none';
    });

    $('#create-key-btn').on('click', function () {
        $('#createKeyModal').modal('show');
    });

    $("#change_customer_password").on("submit", function () {
        event.preventDefault();
        changePassword();
    })

    function changePassword() {
        var newPassword = $("#changePass").val();
        var oldPassowrd = $("#OldPass").val();
        var confirmPass = $("#confirmPass").val();

        // Kiểm tra dữ liệu đầu vào (ví dụ: mật khẩu không được để trống)
        if (!newPassword) {
            alert("Vui lòng nhập mật khẩu mới");
            return;
        }

        var data = {
            "action": "changePassword",
            "newPassword": encodeURIComponent(newPassword),
            "oldPassword": encodeURIComponent(oldPassowrd),
            "confirmPass": encodeURIComponent(confirmPass)
        };
        $.ajax({
            type: 'post',
            url: 'UserInfo',
            data: data,
            success: function (response) {
                $("#successMessage").text(response);
            },
            error: function (xhr, status, error) {
                alert("Có lỗi xảy ra khi thay đổi mật khẩu. Vui lòng thử lại."); // Cung cấp phản hồi lỗi cho người dùng
                console.error("Error:", error);
            }
        });
    }

    var districts;
    let provincesElement = $("#provinces");
    let districtsE = $("#districts");
    for (const province of provinces) {
        var optionE = $("<option>").html(province.name);
        provincesElement.append(optionE);
    }


    function getDistricts() {

        var selectedProvince = $("#provinces").val();
        districtsE.empty();
        for (const province of provinces) {
            if (province.name === (selectedProvince)) {
                districts = province.districts
            }
        }
        for (const district of districts) {
            var option = $("<option>").html(district.name);
            districtsE.append(option);
        }
    }

    function getWards() {
        var selectedDisctrict = districtsE.val();
        var wards;
        var wardE = $("#wards");
        wardE.empty();
        for (const district of districts) {
            if (district.name === (selectedDisctrict)) {
                wards = district.wards;
            }
        }
        for (const ward of wards) {
            var option = $("<option>").html(ward.name);
            wardE.append(option);
        }
    }
    document.addEventListener('DOMContentLoaded', function () {
        provincesElement.select2();
        showMenu('<%=menuId%>');
        $("#add-adress").click(function () {
            let form = $("#address-form");
            form.find("#fullName").val('');
            form.find("#PhoneNumber").val('');
            showAddressForm();
        });
        $(".btn-edit-address").click(function () {
            let addressId = $(this).data("target");
            let fullName = $("#" + addressId).find("#fullname"+addressId).text();
            let phone = $("#" + addressId).find("#phone").text();
            let index = $("#pos").val(addressId);
            let form = $("#address-form");
            form.find("#fullName").val(fullName);
            form.find("#PhoneNumber").val(phone);
            $("#address-form > input[name='action']").val("changeAddress");
            showAddressForm();
        })
        let addressForm = $(".adress-form");
        let closeForm = $('#adress-close');
        closeForm.click(() => {
            hideAddressForm();
        });

        // Hiển thị mẫu địa chỉ
        function showAddressForm() {
            addressForm.css("display", "flex");
        }

        // Ẩn mẫu địa chỉ
        function hideAddressForm() {
            addressForm.css("display", "none");
        }

        let deleteForm = $(".delete-form");

        function showDeleteForm() {
            deleteForm.css("display", "flex");
        }

        // Ẩn mẫu địa chỉ
        function hideDeleteForm() {
            deleteForm.css("display", "none");
        }

        $(".btn-delete").click(function () {
            let indexAddress = $(this).data("target");
            let index = $("#indexAddress").val(indexAddress);
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
    });


    function showMenu(id) {
        $(".block-account").each(function () {
            $(this).hide();
        });
        $("#" + id).toggle("slide");
    }

    function removeActive() {
        $(".toc-list li").each(function () {
            $(this).removeClass("active");
        })
    }

    $(".toc-list li").each(function () {
        $(this).click(() => {
            removeActive();
            $(this).addClass("active");
            let id = $(this).data("target");
            showMenu(id);
        })
    });

    $(document).ready(function () {
        // Xử lý sự kiện khi submit form tải lên key
        $('#key-upload-form').on('submit', function (e) {
            e.preventDefault();

            var formData = new FormData(this);
            formData.append('action', 'upload-key'); // Đính kèm action vào FormData

            $.ajax({
                url: '/order-security',
                type: 'POST',
                data: formData,
                processData: false, // Không xử lý dữ liệu
                contentType: false, // Không đặt Content-Type
                success: function (response) {
                    // Khởi tạo DataTable
                    let table = $('#key-table').DataTable();

                    // Giả sử bạn nhận được dữ liệu keys mới từ server
                    var keys = JSON.parse(response); // Điều này có thể thay đổi tùy thuộc vào cách server trả về dữ liệu

                    // Xóa tất cả các dòng hiện tại trong DataTable
                    table.clear();
                    // Thêm các dòng mới vào bảng
                    keys.forEach(function (key) {
                        table.row.add([
                            key.id,
                            '<p class="text-ellipsis" title="' + key.key + '">' + key.key + '</p>',
                            '<p class="text-ellipsis" title="' + key.algorithm + '">' + key.algorithm + '</p>',
                            key.beginDate,
                            key.updateDate,
                            '<p style="color: ' + (key.isActive ? 'green' : 'red') + ';">' + (key.isActive ? 'Active' : 'Inactive') + '</p>'
                        ]).draw();
                    });


                    // Nếu bạn có phần hiển thị khóa hiện tại, có thể cập nhật lại nó ở đây.
                    var currentKey = keys.find(function (key) {
                        return key.isActive; // Lọc khóa hiện tại
                    });
                    // Nếu có khóa hiện tại, cập nhật giao diện
                    if (currentKey) {
                        $('#current-key').text(currentKey.key);
                        $('#current-algorithm').text(currentKey.algorithm);
                        $('#current-start-date').text(currentKey.beginDate);
                        $('#current-end-date').text(currentKey.updateDate);

                        // Hiển thị container nếu nó bị ẩn
                        $('#current-key-container').css('display', 'flex');
                    } else {
                        // Nếu không có khóa nào active, ẩn container
                        $('#current-key-container').css('display', 'none');
                    }
                    Swal.fire({
                        title: 'Thành công!',
                        text: 'Khóa đã được tải lên và cập nhật thành công.',
                        icon: 'success'
                    });

                },
                error: function (xhr, status, error) {
                    Swal.fire({
                        title: 'Lỗi!',
                        text: 'Dữ liệu phản hồi không hợp lệ.',
                        icon: 'error'
                    });
                }
            });
        });
    });

    $(document).ready(function () {

        // Sự kiện khi nhấn nút Report Key
        $('#reportKeyButton').on('click', function () {

            // Tạo FormData để chứa dữ liệu
            var formData = new FormData();
            formData.append('action', 'report-key'); // Đính kèm action vào FormData

            // Hiển thị hộp thoại xác nhận
            Swal.fire({
                title: "Bạn có chắc muốn xóa chứ?",
                text: "Một khi đã xóa sẽ không thể khôi phục",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Tôi muốn xóa",
                cancelButtonText: "Hủy"
            }).then((result) => {
                if (result.isConfirmed) {
                    // Nếu người dùng xác nhận, gửi yêu cầu AJAX
                    $.ajax({
                        url: '/order-security',
                        type: 'POST',
                        data: formData,
                        processData: false, // Không xử lý dữ liệu
                        contentType: false, // Không đặt Content-Type
                        success: function (response) {
                            console.log(response);
                            let table = $('#key-table').DataTable();
                            var keys = JSON.parse(response); // Parse JSON trả về từ server

                            // Xóa tất cả các dòng hiện tại trong DataTable
                            table.clear();

                            // Thêm các dòng mới vào bảng
                            keys.forEach(function (key) {
                                table.row.add([
                                    key.id,
                                    '<p class="text-ellipsis" title="' + key.key + '">' + key.key + '</p>',
                                    '<p class="text-ellipsis" title="' + key.algorithm + '">' + key.algorithm + '</p>',
                                    key.beginDate,
                                    key.updateDate,
                                    '<p style="color: ' + (key.isActive ? 'green' : 'red') + ';">' + (key.isActive ? 'Active' : 'Inactive') + '</p>'
                                ]).draw();
                            });

                            // Xác định khóa hiện tại
                            var currentKey = keys.find(function (key) {
                                return key.isActive; // Lọc khóa hiện tại
                            });

                            if (currentKey) {
                                // Cập nhật khung hiển thị khóa hiện tại
                                $('#current-key-container').show(); // Hiển thị khung
                                $('#current-key').text(currentKey.key);
                                $('#current-algorithm').text(currentKey.algorithm);
                                $('#current-start-date').text(currentKey.beginDate);
                                $('#current-end-date').text(currentKey.updateDate);
                            } else {
                                // Ẩn khung nếu không còn khóa hiện tại
                                $('#current-key-container').hide();
                            }

                            // Hiển thị thông báo thành công
                            Swal.fire(
                                'Đã xóa!',
                                'Khóa đã được báo cáo thành công.',
                                'success'
                            );
                        },
                        error: function () {
                            // Hiển thị thông báo lỗi
                            Swal.fire(
                                'Lỗi!',
                                'Đã xảy ra lỗi khi báo cáo khóa. Vui lòng thử lại.',
                                'error'
                            );
                        }
                    });
                } else {
                    // Nếu người dùng không xác nhận, không làm gì cả
                    Swal.fire(
                        'Đã hủy',
                        'Bạn đã hủy việc xóa khóa.',
                        'info'
                    );
                }
            });
        });
    });

</script>
</body>
<style>
    .form-check {
        width: 150px;
    }
</style>
</html>