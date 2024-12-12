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
    <link rel="stylesheet" href="styles/admin.css">
    <script src="javascripts/chart.js"></script>
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row">
    <jsp:include page="left-menu.jsp"></jsp:include>
    <div class="col-9 pt-5">
        <div
                class="container title d-flex justify-content-between bg-white rounded mt-3">
            <h5>Thông tin khánh hàng</h5>
            <span class="date">Thứ 6, ngày 19/07/2024</span>
        </div>
        <div class="container-fluid">
            <div class="row w-100">
                <div class="col-12">
                    <div class="list-orders mt-3 bg-white">
                        <div class="sub-title">
                            <h4>Thông tin chung</h4>
                        </div>
                    </div>
                    <div class="user-profile mt-3">
                        <span class="d-block">Id khách hàng: <strong id="id">${user.id}</strong></span>
                        <span class="d-block">Họ và tên: <strong id="fullName">${user.fullName}</strong></span>
                        <span class="d-block">Email: <strong id="email">${user.email}</strong></span>
                        <span class="d-block">Số điện thoại: <strong id="phone">${user.phone}</strong></span>
                        <span class="d-block">Địa chỉ: <strong id="address">
									<c:if test="${not empty user.addresses }">
                                        <c:set value="${user.addresses.get(0) }" var="item"/>
                                        ${item.getDescription()}
                                        ${item.getWards()} ${item.getDistricts()}
                                        ${item.getProvince()}
                                    </c:if> <c:if test="${empty user.addresses }">
                            Chưa có địa chỉ
                        </c:if>
							</strong></span> <span class="">Trạng thái: <strong id="status">
									<div class="status-bar">
										<form action="UserController" id="statusForm">
											<input type="hidden" name="action" value="put"> <input
                                                type="hidden" name="userId" value="${user.id}"> <select
                                                class="form-select" name="statusId">
												<option id="status1" value="1">Hoạt động</option>
												<option id="status3" value="3">Bị cấm</option>
											</select>
										</form>
									</div>
							</strong></span>
                    </div>
                    <div class="sub-title mt-3">
                        <h4>Lịch sử mua hàng</h4>
                    </div>
                    <table class="table table-cart table-order mt-5"
                           id="my-orders-table" style="border: #2c3034 solid 1px">
                        <thead class="thead-default bg-primary-green text-white">
                        <tr>
                            <th>Đơn hàng</th>
                            <th>Ngày</th>
                            <th>Địa chỉ</th>
                            <th>Giá trị đơn hàng</th>
                            <th>TT đơn hàng</th>
                            <th>Xem chi tiết</th>
                        </tr>
                        </thead>
                        <c:if test="${user.getOrders().size() ==0}">
                            <tbody>
                            <tr>
                                <td colspan="6" class="text-center">
                                    <p>Không có đơn hàng nào.</p>
                                </td>
                            </tr>
                            </tbody>
                        </c:if>
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
                                        <p>${order.getAddress()}</p>
                                    </td>
                                    <td class="text-center">
                                        <p>
                                            <fmt:formatNumber value="${order.getTotalPrice()}"
                                                              type="currency"></fmt:formatNumber>
                                        </p>
                                    </td>
                                    <td class="text-center" style="color: #e39b04">
                                        <p>${order.getStatus().getDescription()}</p>
                                    </td>
                                    <td class="text-center">
                                        <div class="btn-group">
                                            <a target="_blank"
                                               href="OrderController?action=detail&orderId=${order.id}">
                                                <button
                                                        class="btn btn-secondary btn-sm me-1 btn-order-detail"
                                                        data-target=${item.id}>
                                                    <i class="fa-solid fa-circle-info"></i>
                                                </button>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../javascripts/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="../javascripts/main.js"></script>
<script type="text/javascript">
    let re = ' ${requestScope.result}';
    if (re != ' ') {
        showNotification();
    }

    function showNotification() {
        notify2("Thông báo", re, "success", 1000);
    }

    $(".form-select").on("change", function () {
        $("#statusForm").submit();
    })

    let statusId = "status" + '${user.status.getId()}';
    $("#" + statusId).attr("selected", "selected");

    $(".nav-link").removeClass("active");
    $("#customers-nav-link").addClass("active");
</script>
<style>
    .btn-order-detail i {
        color: #fffff;
    }

    .status-bar {
        width: 200px !important;
    }
</style>

</html>