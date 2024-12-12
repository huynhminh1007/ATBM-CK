<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="all"
          href='../styles/bootstrap.css'>
    <link rel="stylesheet" type="text/css" href="../styles/base.css">
    <link rel="stylesheet" type="text/css" href="../styles/main.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <title>Admin</title>
</head>
<body>
<div id="left" class="col-2 bg-primary-green">
    <div class="left-side">
        <div id="profile"
             class="profile-box d-flex flex-column align-items-center pt-2 h">
            <img width="60px" src="Images/avatar.png" alt="">
            <h5 class="text-white">${sessionScope.user.fullName}</h5>
            <div class="line"></div>
        </div>
        <div class="nav flex-column py-3" id="navigation">
            <a class="nav-link active" id="dashboard-nav-link"
               data-link="dashboard.jsp" href="DashboardController"> <i
                    class="fa-solid fa-gauge mr-2"></i> <span class="menu-text">Bảng
						điều khiển</span>
            </a> <a class="nav-link" id="customers-nav-link"
                    data-link="customers-data-table.jsp" href="UserController?action=get">
            <i class="fa-solid fa-people-roof"></i> <span class="menu-text">
						Quản lý khách hàng</span>
        </a>
            <c:if test="${sessionScope.user.roleId == 1}">
                <a class="nav-link" id="staffs-nav-link"
                   data-link="staffs-data-table.jsp" href="StaffController?action=get">
                    <i class="fa-solid fa-people-roof"></i> <span class="menu-text">
						Quản lý nhân viên</span>
                </a>
            </c:if>
            <a class="nav-link pointer-event" id="products-nav-link"
               data-link="products-data-table.jsp" href="quan-ly-san-pham">
                <i class="fa-solid fa-box"></i> <span class="menu-text">
						Quản lý sản phẩm</span>
            </a>
            <a class="nav-link pointer-event" id="product-sales-nav-link"
               data-link="products-data-table.jsp" href="quan-ly-giam-gia">
                <i class="fa-solid fa-box"></i> <span class="menu-text">
						Sản phẩm giảm giá</span>
            </a>

            <a class="nav-link pointer-event" id="nhap-kho-nav-link"
               href="nhap-kho">
                <i class="fa-solid fa-box"></i> <span class="menu-text">
						Quản lý nhập kho</span>
            </a>
            <a class="nav-link pointer-event" id="thong-ke-nav-link"
               href="thong-ke">
                <i class="fa-solid fa-box"></i> <span class="menu-text">
						Thống kê</span>
            </a>
            <a class="nav-link" id="orders-nav-link"
               data-link="orders-data-table.jsp" href="OrderController">
                <i class="fa-solid fa-file-invoice-dollar"></i> <span
                    class="menu-text"> Quản lý đơn hàng</span>
            </a>
            </a>

            <c:if test="${sessionScope.user.roleId == 1}">
                <a class="nav-link" id="logs-nav-link"
                   data-link="logs-data-table.jsp" href="LogController">
                    <i class="fa-solid fa-file-invoice-dollar"></i> <span
                        class="menu-text"> Quản lý log</span>
                </a>
            </c:if>


            <div class="parent-nav" id="promotions-nav-link">
                <a> <i class="fa-solid fa-percent"></i> <span class="menu-text">
							Quản lý khuyến mãi</span>
                </a>
                <div class="text-start sub-menu">
                    <a class="nav-link" data-link="promotions-data-table.jsp"
                       href="promotions-data-table.jsp" id="promotion-manager">Chương
                        trình khuyến mãi</a> <a class="nav-link"
                                                href="DiscountsController" id="voucher-nav-link">Quản
                    lý voucher</a>
                </div>
            </div>
            <div class="parent-nav" id="more-nav-link">
                <a> <i class="fa-solid fa-percent"></i> <span class="menu-text">
							Quản lý khác</span>
                </a>
                <div class="sub-menu">
                    <a class="nav-link" data-link="promotions-data-table.jsp"
                       id="news-nav-link">Quản lý tin tức</a> <a class="nav-link"
                                                                 data-link="vouchers-data-table.jsp"
                                                                 id="introduction-nav-link">Chỉnh
                    sửa trang giới thiệu</a> <a class="nav-link"
                                                data-link="vouchers-data-table.jsp" id="policy-nav-link">Chỉnh
                    sửa chính sách</a> <a class="nav-link"
                                          data-link="vouchers-data-table.jsp" href="Carousel"
                                          id="carousel-nav-link">Cập nhập hình trình chiếu</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="javascripts/jquery-3.7.1.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        let subMenu = $(".sub-menu");
        subMenu.hide();
        $(".parent-nav").click(function () {
            $(this).children(".sub-menu").toggle("slide");
        });
        $("#logoutBtn").click(() => {
            window.location.href = "../login.jsp";
        })
    });
</script>

</html>