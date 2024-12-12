<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <link rel="stylesheet" href="styles/admin.css?adds">
    <script src="javascripts/chart.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid"></div>
<div class="row">
    <jsp:include page="left-menu.jsp"></jsp:include>
    <div class="col-9 pt-3">
        <div
                class="container title d-flex justify-content-between bg-white rounded">
            <h5>Bảng điều khiển</h5>
            <span class="date">Thứ 6, ngày 19/07/2024</span>
        </div>
        <div class="container-fluid">
            <div class="row w-100">
                <div class="col-7">
                    <div class="widget-container d-flex flex-wrap w-100">
                        <div class="widget">
                            <i class="fa-solid fa-user icon-green"></i>
                            <p class="fw-bold text-danger text-center mt-2 fs-6">TỔNG
                                KHÁCH HÀNG</p>
                            <h5 class="text-center">${requestScope.userCount} khách hàng</h5>
                            <small> Tổng số khách hàng được quản lý. </small>
                        </div>
                        <div class="widget">
                            <i class="fa-solid fa-box icon-blue"></i>
                            <p class="fw-bold text-danger text-center mt-2 fs-6">TỔNG
                                SẢN PHẨM</p>
                            <h5 class="text-center">${requestScope.productCount} sản
                                phẩm</h5>
                            <small> Tổng số sản phẩm được quản lý. </small>
                        </div>
                        <div class="widget">
                            <i class="fa-solid fa-file-invoice-dollar icon-orange"></i>
                            <p class="fw-bold text-danger text-center mt-2 fs-6">TỔNG
                                ĐƠN HÀNG</p>
                            <h5 class="text-center">${requestScope.orderCount} đơn hàng</h5>
                            <small> Tổng số hóa đơn bán hàng trong tháng. </small>
                        </div>
                        <div class="widget">
                            <i class="fa-solid fa-triangle-exclamation icon-red"></i>
                            <p class="fw-bold text-danger text-center mt-2 fs-6">SẮP HẾT
                                HÀNG</p>
                            <h5 class="text-center">${requestScope.requiredProductCount} sản phẩm</h5>
                            <span> Số sản phẩm cảnh báo hết cần nhập thêm. </span>
                        </div>
                    </div>
                    <div class="list-orders mt-3 bg-white">
                        <div class="sub-title">
                            <h4>Tình trạng đơn hàng</h4>
                        </div>
                        <table class="table" id="orders">
                            <thead>
                            <tr>
                                <th scope="col">ID đơn hàng</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Trạng thái</th>
                            </tr>
                            </thead>
                            <c:forEach items="${orders}" var="item">
                                <tbody id="${item.id}">
                                <tr>
                                    <td>${item.id}</td>
                                    <td>${item.user.fullName}</td>
                                    <td><fmt:formatNumber value="${item.totalPrice}"
                                                          type="currency"/></td>
                                    <td>${item.status.description}</td>
                                </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="list-new-customers mt-3 bg-white">
                        <div class="sub-title">
                            <h4>Khách hàng mới</h4>
                        </div>
                        <table class="table table-bordered table-hover"
                               id="list-new-customers">
                            <thead>
                            <tr>
                                <th scope="col">ID khách hàng</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Số điện thoại</th>
                            </tr>
                            </thead>
                            <c:forEach items="${users}" var="user">
                                <tbody>
                                <c:if test="${user.roleId == 1 }">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.fullName}</td>
                                        <td>${user.phone}</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <div class="col-5">
                    <div class="sub-title">
                        <h4>Thống kế lợi nhuận </h4>
                    </div>
                    <div class="chart">
                        <canvas style="width: 400px; height: 300px;" id="doanhThuChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="javascripts/chartDraw.js?2"></script>
<script type="text/javascript" src="javascripts/Utils.js"></script>

<script>
    let months = ${requestScope.months};
    let revenues = ${requestScope.revenues};
    renderChart(months, revenues);
</script>
</html>