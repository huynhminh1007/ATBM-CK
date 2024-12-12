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
    <link rel="stylesheet" href="styles/admin.css?đsdsd">
    <link href="../DataTables/datatables.min.css" rel="stylesheet">
    <script src="../javascripts/jquery-3.7.1.js"></script>
    <script src="../DataTables/datatables.min.js"></script>
</head>
<style>
    .btn-order-detail i {
        color: #fFffff;
    }
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row">
    <jsp:include page="left-menu.jsp"></jsp:include>
    <div class="col-9 pt-3">
        <div
                class="container title d-flex justify-content-between bg-white rounded">
            <h5>Tạo nhân viên </h5>
            <span class="date">Thứ 6, ngày 19/07/2024</span>
        </div>
        <div class="container-fluid">
            <div class="row w-100">
                <div class="col-12">
                    <div class="mt-3 bg-white">
                    </div>
                </div>
                <form action="StaffController" method="POST">
                    <input hidden="hidden" name="action"
                            <c:if test="${requestScope.action == 'put'}">
                                value="put"
                            </c:if>
                            <c:if test="${requestScope.action != 'put'}">
                                value="create"
                            </c:if>
                    />
                    <input hidden="hidden" name="userId" value="${requestScope.user.id}"/>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Họ và tên</label>
                        <input type="text" name="fullName"
                               value="${requestScope.user.fullName}"
                               class="form-control" id="fullname"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Số điện thoại</label>
                        <input type="number" name="phoneNumber" value="${requestScope.user.phone}" class="form-control"
                               id="phone"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Địa chỉ email</label>
                        <input type="email" name="email"
                               value="${requestScope.user.email}"
                               class="form-control" id="exampleInputEmail1"
                               aria-describedby="emailHelp">
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Mật khẩu</label>
                        <input type="password" name="password" class="form-control"
                               id="exampleInputPassword1">
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <c:if test="${requestScope.action == 'put'}">
                            Cập nhập nhân viên
                        </c:if>
                        <c:if test="${requestScope.action != 'put'}">
                            Tạo nhân viên mới
                        </c:if>

                    </button>
                </form>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    $(".nav-link").removeClass("active");
    $("#staffs-nav-link").addClass("active");
    new DataTable("#users-table", {
        columns: [
            {data: 'id'},
            {data: "Tên khách hàng"},
            {data: 'Số điện thoại'},
            {data: 'Email'},
            {data: 'Trạng thái'},
            {data: 'Chức năng'},
        ],
        language: {
            url: "https://cdn.datatables.net/plug-ins/2.0.2/i18n/vi.json"
        },
    });
</script>

</html>