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
            <h5>Quản lý nhân viên</h5>
            <span class="date">Thứ 2, ngày 30/10/2023 - 11 giờ 25 phút</span>
        </div>
        <div class="container-fluid">
            <div class="row w-100">
                <div class="col-12">
                    <div class="mt-3 bg-white">
                        <div class="sub-title">
                            <h4>Danh sách nhân viên </h4>
                        </div>
                        <div class="m-2">
                            <a href="staffs-create-form.jsp">
                                <button class="btn btn-success">
                                    Tạo nhân viên mới
                                </button>
                            </a>
                        </div>
                        <table class="cell-border hover nowrap w-100" id="users-table">
                            <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col">Email</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Chức năng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${users}" var="user">
                                <c:if test="${user.roleId != 1 }">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.fullName}</td>
                                        <td>${user.phone}</td>
                                        <td>${user.email}</td>
                                        <td>${user.status.description}</td>
                                        <td><a
                                                href="StaffController?action=detail&userId=${user.id}">
                                            <button
                                                    class="btn btn-secondary btn-sm me-1 btn-order-detail"
                                                    data-target=${item.id}>
                                                <i class="fa-solid fa-circle-info"></i>
                                            </button>
                                        </a></td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
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