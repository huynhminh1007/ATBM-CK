<%@page import="Model.Carousel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css?version=1">

<link rel="stylesheet" type="text/css"
	href="styles/bootstrap.css?version=1">
<link rel="stylesheet" type="text/css" href="styles/base.css?version=1">
<link rel="stylesheet" type="text/css" href="styles/main.css?version=1">
<link rel="stylesheet" type="text/css" href="styles/tai-khoan.css?d">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css?version=1">
<link rel="stylesheet" type="text/css"
	href="styles/footer.css?version=1">
<title>Chi tiết đơn hàng</title>
</head>
<style>
	body {
		background-color: #f0f0f0;
		padding-bottom: 30px;
	}

	.container {
		background-color: #ffffff;
		padding: 20px;
		border: 1px solid #dddddd;
		border-radius: 5px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}

	.list-orders {
		background-color: #ffffff;
		padding: 20px;
		border: 1px solid #dddddd;
		border-radius: 5px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}

	.order-detail {
		background-color: #f9f9f9;
		padding: 20px;
		border: 1px solid #eeeeee;
		border-radius: 5px;
	}

	.status-bar {
		background-color: #ffffff;
		padding: 20px;
		border: 1px solid #dddddd;
		border-radius: 5px;
	}

	table {
		width: 100%;
		border-collapse: collapse;
		margin-top: 20px;
	}

	table th, table td {
		text-align: center;
		vertical-align: middle;
	}

	table img {
		display: block;
		margin: 0 auto;
	}
</style>
<body>
	<div class="container mt-5">
		<div class="row w-100">
			<div class="col-12">
				<div class="list-orders mt-3 bg-white">
					<div class="sub-title">
						<div class="d-flex justify-content-between">
							<h3>Chi tiết đơn hàng</h3>
							<h5>Ngày tạo đơn hàng: ${order.dateCreated}</h5>
						</div>
					</div>
					<c:set var="discounts" scope="request" value="${requestScope.discounts}" />
					<c:set var="order" scope="request" value="${requestScope.order}" />
					<div class="order-detail mt-3 row">
						<div class="col-7">
							<div>
								<h5><strong>ID đơn hàng:</strong> ${order.id}</h5>
							</div>
							<div>
								<h5><strong>Tên khách hàng:</strong> ${order.user.getFullName()}</h5>
							</div>
							<div>
								<h5><strong>Phương thức thanh toán:</strong> ${order.paymentMethod}</h5>
							</div>
							<div>
								<h5><strong>Địa chỉ nhận hàng:</strong> ${order.address}</h5>
							</div>
                            <c:if test="${not empty order.note}">
                                <div>
                                    <h5><strong>Ghi chú:</strong> ${order.note}</h5>
                                </div>
                            </c:if>
						</div>
                        <div class="col-5">
                            <div class="contact-info mt-4">
                                <h5><strong>Thông tin liên hệ:</strong></h5>
                                <ul>
                                    <li>Email hỗ trợ: support@yourwebsite.com</li>
                                    <li>Điện thoại: +84 123 456 789</li>
                                    <li>Địa chỉ văn phòng: Số 123, Đường ABC, Quận XYZ, Thành phố HCM</li>
                                </ul>
                            </div>
                        </div>
						<div class="status-bar">
							<h5>Trạng thái: ${order.status.getDescription()}</h5>

						</div>
					</div>
					<table class="table" id="orders">
						<thead>
							<tr>
								<th scope="col">STT</th>
								<th scope="col">Tên sản phẩm</th>
								<th scope="col">Hình ảnh</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Đơn giá</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${order.details}" var="item" varStatus="i">
								<tr>
									<td>${i.count}</td>
									<td>${item.product.getName()}</td>
									<td><img src='${item.product.getThumb()}' width="100px"
										height="150px"></td>
									<td>${item.quantity}</td>
									<td><fmt:formatNumber type="currency"
											value="${item.price}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="status-bar text-right" style="text-align: right;">
					<div>
						<h5>
							<strong style="padding-right: 20px">Phí vận chuyển:</strong>
							<fmt:formatNumber type="currency" value="${order.shippingFee}" />
						</h5>
					</div>
					<c:if test="${not empty discounts}">
						<div>
							<h5><strong style="padding-right: 20px">Phiếu giảm giá:</strong> ${discounts.code}</h5>
						</div>
					</c:if>
					<h4>
						<strong style="padding-right: 20px">Tổng đơn hàng:</strong>
						<fmt:formatNumber type="currency" value="${order.totalPrice}" />
					</h4>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
