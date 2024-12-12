
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hoá đơn</title>
<link rel="stylesheet" type="text/css" href="styles/bootstrap.css">
<link rel="stylesheet" type="text/css" href="styles/base.css">
<link rel="stylesheet" type="text/css" href="styles/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="styles/news.css">
<link rel="stylesheet" type="text/css" href="styles/footer.css">
<link rel="stylesheet" type="text/css" href="styles/nav.css">
<link rel="stylesheet" href="styles/login.css">
<script type="text/javascript" src="javascripts/jquery-3.7.1.js"></script>

<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.icon-check {
	max-width: 72px;
	max-height: 72px;
}

.message-container {
	text-align: start;
	padding-left: 14px;
}

.message-content {
	width: 100%;
	height: calc(1em * 1.4 * 2);
}

.section_order {
	border: 1px solid #dadada;
	padding: 1em;
	margin: 1em;
}

p {
	text-align: start !important;
	font-weight: normal;
	font-size: 14px;
}

.title-head {
	text-align: start !important;
}

body {
	background-color: #e6e8ea;
}

.btn-blue {
	padding: 16px 24px;
	color: #fff;
	border: none;
	border-radius: 8px;
	background-color: #357ebd;
	white-space: nowrap;
}

.btn-blue:hover {
	background-color: #2a6395;
	border-color: #225179;
}

.section_print {
	margin-top: 40px;
	display: flex;
	align-items: center;
	justify-content: end;
}

span.print {
	margin-left: 40px;
	margin-right: 40px;
}

span.print:hover>* {
	color: #2a6395;
}

span.print i {
	font-size: 1.8rem;
	color: #2a9dcc;
	cursor: pointer;
}

span.print i:hover {
	
}

span.print span {
	font-size: 1.5rem;
	cursor: pointer;
	color: #2a9dcc;
}

.container {
	width: 80%;
}

aside {
	margin-left: 20px;
	background-color: #fafafa;
	border: 1px solid #e1e1e1;
	padding: 10px 10px;
}

aside * {
	font-size: 14px !important;
}

aside>*:not(:last-child) {
	border-bottom: 1px solid #ddd;
	margin-bottom: 10px;
}

.border-bottom-child>*:not(:last-child) {
	border-bottom: 2px solid #ddd;
}

.order-summary {
	display: flex;
	flex-direction: column;
}

.order-item {
	display: flex;
	text-align: start;
}

.total_cost>* {
	font-size: 16px !important;
}

.large-price {
	color: #2a9dcc;
	font-size: 20px !important;
	font-weight: 400;
}

.circular-element {
	position: absolute;
	top: -5px;
	right: -5px;
	background-color: #2a9dcc;
	color: #fff;
	border-radius: 50%;
	padding: 3px 4px;
	font-size: 10px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div style="display: flex; justify-content: center;">
						<a href="/Home"><img src="./images/logo/logo_large.png" alt=""></a>
					</div>
					<form action="" id="form-order">
						<div class="row">
							<div class="col-md-7">
								<section class="heading d-flex">
									<div class="icon-check">
										<img src="./images/icons/check_icon.png" alt="">
									</div>
									<div class="message-container">
										<h4 class="title-head">Cảm ơn đã đặt hàng</h4>
										<p class="message-content">
											Một email xác nhận đã được gửi tới ${user.email}.<br>Xin
											vui lòng kiểm tra email của bạn
										</p>
									</div>
								</section>
								<section class="section_order mt-3">
									<div class="row">
										<div class="col-md-6">
											<h4 class="title-head">Thông tin mua hàng</h4>
											<p>${user.fullName}</p>
											<p>${user.email}</p>
											<p>${user.phone}</p>
										</div>
										<div class="col-md-6">
											<h4 class="title-head">Địa chỉ nhận hàng</h4>
											<p>Ghi chú: ${orders.note}</p>
											<p>${orders.address}</p>
										</div>
										<div class="col-md-6">
											<h4 class="title-head">Phương thức thanh toán</h4>
											<p>Thanh toán khi giao hàng (COD)</p>
										</div>
										<div class="col-md-6">
											<h4 class="title-head">Phương thức vận chuyển</h4>
											<p>Giao hàng tận nơi</p>
										</div>
									</div>
								</section>
								<section class="section_print">
									<a href="Home"><button type="button" class="btn-blue">Tiếp tục
											mua hàng</button> </a> <span class="print"> <i class="fa fa-print"></i>
										<span>In</span>
									</span>
								</section>
							</div>

							<div class="col-md-5">
								<aside>
									<div>
										<h4 class="title-head">Đơn hàng #${orders.id}
											(${orders.getDetails().size()})</h4>
									</div>
									<div class="order-summary border-bottom-child">
										<div class="custom-scrollbar border-bottom-child">
											<c:forEach items="${orders.getDetails()}" var="item">
												<c:set var="isSale"
													value="${item.product.getClass().getSimpleName() eq 'ProductSale'}" />
												<div class="order-item" data-product-id="${item.product.id}">
													<div class="row g-0">
														<div class="col-md-3 d-flex align-items-center p-2">
															<div class="position-relative">
																<img src="${item.product.thumb}" alt=""
																	class="card-img mx-auto">
																<div class="circular-element">${item.getQuantity()}</div>
															</div>
														</div>
														<div class="col-md-9">
															<div class="card-body d-flex flex-column">
																<h3 class="card-title">
																	<a href="">${item.product.name}</a>
																</h3>
																<div class="d-flex justify-content-between">
																	<div class="card-text">
																		<span>Đơn giá:</span>
																	</div>
																	<div class="card-text">
																		<div class="price-box">
																			<span class="product_new_price"> <fmt:setLocale
																					value='vi-VN' /> <fmt:formatNumber
																					value="${item.getProductPrice()}" type="currency" />
																			</span>
																			<c:if test="${isSale}">
																				<span class="price-compare product_unit_price">
																					<fmt:setLocale value='vi-VN' /> <fmt:formatNumber
																						value="${item.product.unitPrice}" type="currency" />
																				</span>
																			</c:if>
																		</div>
																	</div>
																</div>
																<div class="d-flex justify-content-between">
																	<div class="card-text">
																		<span><b>Số tiền: </b></span>
																	</div>
																	<div class="card-text">
																		<div class="price-box">
																			<span class="product_new_price"> <fmt:setLocale
																					value='vi-VN' /> <fmt:formatNumber
																					value="${item.calculatePrice()}" type="currency" />
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
									<div class="order-summary">
										<div class="py-3">
											<div class="d-flex justify-content-between">
												<span>Tạm tính</span> <span class="small-price">
												<c:set  value="${requestScope.amount}" var="amount" />
												<c:choose>
													<c:when test="${amount == 0}">
														<fmt:formatNumber value="${requestScope.orders.totalPrice - 40000}" type="currency" />
													</c:when>
													<c:otherwise>
														<fmt:formatNumber value="${requestScope.orders.totalPrice - 40000 + amount}" type="currency" />
													</c:otherwise>
												</c:choose>
												</span>
											</div>
											<div class="d-flex justify-content-between mt-2">
												<span>Phí vận chuyển</span> <span class="small-price">
													<fmt:formatNumber value="${40000}" type="currency" />
												</span>
											</div>
											<div class="justify-content-between mt-2" style="${amount > 0 ? 'display: flex;' : 'display: none;'}">
												<span>Áp dụng khuyến mãi:</span> <span class="small-price" style="color: red">
													<fmt:formatNumber value="${-amount}" type="currency" />
												</span>
											</div>
										</div>
									</div>
									<div class="total_cost d-flex justify-content-between">
										<span class="title-head">Tổng cộng</span> <span
											class="large-price"> <fmt:formatNumber
												value="${requestScope.orders.totalPrice}" type="currency" />
										</span>
									</div>
								</aside>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
    
</script>
</html>