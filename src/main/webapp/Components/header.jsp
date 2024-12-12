<%@page import="java.util.ArrayList"%>
<%@page import="Model.Wishlist"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@page import="Controller.cart.Cart"%>
<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Header</title>

<style >
.cart_submit:hover {
	opacity: 0.8;
	transition: opacity 0.8s;
	color: white !important;
}

.product-list {
	width: 100%;
	position: absolute;
	top: 100%;
	left: 0;
	background-color: #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	z-index: 1;
	border-radius: 10px;
}

.title-search {
	margin-top: 10px;
}

.title-search span {
	font-size: 20px;
	font-weight: 600;
	margin: 0 20px 20px 20px;
	position: relative;
}

.title-search span:before {
	background: #679210;
	content: '';
	right: 0;
	left: 0;
	position: absolute;
	bottom: -5px;
	height: 3px;
	display: block;
	z-index: 1;
	width: 40%;
}
.header-nav{
	height: 60px;
}
.header{
	min-height: 124px;
}

</style>
</head>
<%
User user = session.getAttribute("user") == null ? null : (User) session.getAttribute("user");
Cart cart = (Cart) session.getAttribute("cart");
if (cart == null) {
	cart = new Cart();
	session.setAttribute("cart", cart);
}
Wishlist wishlist = (Wishlist) session.getAttribute("wishlist");
if (wishlist == null) {
	wishlist = new Wishlist();
	session.setAttribute("wishlist", wishlist);
}
request.setAttribute("wishlist", wishlist.getWishlist());
request.setAttribute("wishlistId", wishlist.getWishListId());
%>
<body>
	<header class="header">
		<nav class="nav navbar-light bg-light header-nav">
			<div id="topbar"
				class="d-flex align-items-center fixed-top bg-light pt-1">
				<div
					class="container d-flex justify-content-center justify-content-md-between">
					<div class="contact-info d-flex align-items-center">
						<i class="fas fa-mobile d-flex align-items-center "
							style="margin-right: 5px;"></i><span class=""> +84 955 488
							77</span> <i class="fa-regular fa-clock d-flex align-items-center ms-4 "
							style="margin-right: 5px"></i><span class=""> Mon-Sat: 6AM
							- 23PM</span>
					</div>
					<div class="search-smart d-none d-md-flex">
						<form class="">
							<input id="searchInput"
								class="form-control justify-content-md-start" type="search"
								placeholder="Bạn tìm gì..." aria-label="Search" width="300"
								height="200" value="${name}"> <i
								class="fas fa-search bg-primary-green"></i>
						</form>
						<div class="product-list" style="display: none;">
							<div class="title-search">
								<span>Sản phẩm</span>
							</div>
							<div class="product-container custom-scrollbar mb-3"></div>
							<div class=""
								style="margin: 0px 10px 10px 10px; text-align: center;">
								<button type="button"
									class="button btn btn-default bg-primary-green text-primary-white cart_submit search-see-more"
									style="width: 60%;" title="Xem thêm"></button>
							</div>
							<div class="search-empty-message">
								<span style="display: block;">Không tìm thấy sản phẩm phù hợp</span>
							</div>
						</div>
					</div>
					<div class="header-control d-none d-md-flex"
						style="padding-top: 2px">
						<button class=" btn btn-hover ms-md-2 bg-primary-green btn-user"
							type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false" style="margin-right: 10px">
							<a style="color: #fff"> <i class="fa-solid fa-circle-user"></i></a>
						</button>
						<ul class="dropdown-menu" id="userLinks">
							<c:if test="${empty user}">
								<li><a class="dropdown-item" href="login.jsp">Đăng nhập</a></li>
								<li><a class="dropdown-item" href="signup.jsp">Đăng ký</a></li>
							</c:if>
							<c:if test="${not empty user}">
								<li><a class="dropdown-item" href="tai-khoan.jsp">Thông
										tin</a></li>
								<li><a class="dropdown-item" href="Logout">Đăng xuất</a></li>
							</c:if>
						</ul>
						<button type="button"
							class="btn btn-hover ms-md-2 bg-primary-green"
							data-bs-toggle="tooltip" data-bs-placement="bottom"
							title="Hệ thống cửa hàng" style="margin-right: 10px">
							<a href="lien-he.jsp" target="_top" style="color: #fff"><i
								class="fa-solid fa-location-dot"></i></a>
						</button>
						<button type="button"
							class="position-relative btn btn-hover ms-md-2 bg-primary-green"
							data-bs-toggle="tooltip" data-bs-placement="left"
							title="Sản phẩm yêu thích" style="margin-right: 10px"
							id="btnSanPhamYeuThich">
							<i class="fa-regular fa-heart"></i> <span
								class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger wishlist"><%=wishlist.size()%></span>
							<span class="visually-hidden">unread messages</span>
						</button>
						<button type="button" id="btn-card"
							class="position-relative btn btn-hover ms-md-2 bg-primary-green"
							data-bs-toggle="tooltip" data-bs-placement="left"
							title="Giỏ hàng">
							<a href="../../CartDispatcher" target="_top" style="color: #fff"><i
								class="fas fa-cart-shopping"></i></a> <span
								class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"><%=cart.getTotalItems() != 0 ? cart.getTotalItems() : ""%></span>
							<span class="visually-hidden">unread messages</span>
						</button>
						<div class="top-cart-content" style="width: 350px; height: auto;">
							<div class="">
								<form action="" class="cart">
									<div class="">
										<div class="custom-scrollbar cart-container"
											style="padding: 0px 16px;">
											<c:forEach items="${cart.getCartItems()}" var="item">
												<jsp:include page="/templates/cart-item-template.jsp">
													<jsp:param name="productId" value="${item.product.id}" />
													<jsp:param name="unitsInStock" value="${item.product.unitsInStock}"/>
													<jsp:param name="productName" value="${item.product.name}" />
													<jsp:param name="productThumb"
														value="${item.product.thumb}" />
													<jsp:param name="quantity" value="${item.quantity}" />
													<jsp:param name="totalPrice"
														value="${item.calculatePrice()}" />
												</jsp:include>
											</c:forEach>
											<div class="empty-message text-center"
												 style="${cart.cartItems.size() > 0? 'display: none;' : ''}">
												<i class="fa-solid fa-face-sad-tear" style="font-size: 20px; color: #ff6f61;"></i>
												<p style="display: block;">
													Bạn chưa có sản phẩm nào
													trong giỏ hàng
												</p>
											</div>
										</div>
										<div class="cart-total-info"
											 style="${cart.cartItems.size() > 0? '' : 'display: none;'}">
											<div
													class="d-flex justify-content-between aligh-items-center"
													style="padding: 10px 20px;">
												<h3 style="font-size: 16px; font-weight: 500; color: #000;">Tổng
													tiền:</h3>
												<div class="price-box cart_total_price" style="">
													<fmt:setLocale value='vi-VN' />
													<fmt:formatNumber value="<%=cart.getTotalPrice()%>"
																	  type="currency" />
												</div>
											</div>
											<div class="cart__btn-proceed-checkout-dt"
												 style="margin: 0px 10px 10px 10px">
												<button type="button"
														class="button btn btn-default bg-primary-green text-primary-white w-100 cart_submit"
														id="btn-proceed-checkout pay_btn_proceed_checkout"
														title="Thanh toán">Thanh toán</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>

					</div>
					<div class="languages d-none d-md-flex align-items-center">
						<a class="nav-link text-primary-green fw-bolder" href="#">EN</a> <a
							class="text-dark">/</a> <a
							class="nav-link text-primary-green fw-bolder" href="#">VN</a>
					</div>
				</div>
			</div>
		</nav>
		<!--    Logo and Thanh điều hướng -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light p-xl-0 logo-menu">
			<div class="container">
				<div class="menubar d-sm-flex">
					<a class="navbar-brand m-lg-0" href="Home">
						<img
						src="images/logo/logo.png" alt="" width="200" height=""
						class="d-inline-block align-text-top" title="Logo">
					</a>
				</div>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarScroll"
					aria-controls="navbarScroll" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarScroll">
					<ul
						class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll bg-primary-green w-100"
						style="-bs-scroll-height: 100px;">
						<li class="nav-item"><a class="nav-link active text-light "
							target="_top" aria-current="page" href="Home">Trang chủ</a></li>
						<li class="nav-item dropdown"><a id="navbarScrollingDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false"
							class="drop-i"> Sản phẩm </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDarkDropdownMenuLink" id="show-category">
								<c:forEach items="${categories}" var="item">
									<c:if test="${empty  item.children}">
										<li><a class="dropdown-item"
											href="san-pham?action=filter&page=1&category=${item.id}">${item.name}</a></li>
									</c:if>
									<c:if test="${not empty item.children}">
										<li class="nav-item d-flex justify-content-between"
											data-category=${item.id}><a class="dropdown-item"
											href="san-pham?action=filter&page=1&category=${item.id}">${item.name}
										</a> <i class="fa-regular fa-plus open-menu"
											style="color: #000000; margin-right: 40px; padding-top: 10px;"></i>
										</li>
										<ul class="nav-list chilren-list">
											<ul class="level1">
												<c:forEach items="${item.children}" var="child">
													<li class="level2"><a
														href="san-pham?action=filter&page=1&category=${child.id}">${child.name}</a></li>
												</c:forEach>
											</ul>
										</ul>
									</c:if>
								</c:forEach>
							</ul></li>
						<li class="nav-item"><a class="nav-link text-light"
							target="_top" href="san-pham-khuyen-mai?action=${'all'}">Sản
								phẩm khuyến mãi</a></li>
						<li class="nav-item"><a class="nav-link text-light"
							target="_top" href="tin-tuc.jsp">Tin tức</a></li>
						<li class="nav-item"><a class="nav-link text-light"
							target="_top" href="gioi-thieu.jsp">Giới thiệu</a></li>
						<li class="nav-item"><a class="nav-link text-light"
							target="_top" href="lien-he.jsp">Liên hệ</a></li>
						<li class="nav-item"><a class="nav-link text-light"
							target="_top" href="chinh-sach.jsp">Chính sách cửa hàng</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
<style type="text/css">
/*.title-group {*/
/*	background-image: url("images/titlebackground/title-bg.png");*/
/*	height: 200px;*/
/*	box-shadow: inset 0px -40px 60px 40px rgba(0, 0, 0, 0.8);*/
/*}*/

.text-green {
	color: #679210;
}
</style>
<script type="text/javascript" src="javascripts/jquery-3.7.1.js"></script>
<script type="text/javascript" src="javascripts/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/lodash@4.17.21"></script>
<script>
$(".chilren-list").hide();
$(".nav-item").click(function() {
	let child = $(this).next("ul.nav-list");
	console.log(child);
	child.slideToggle();
});


$('#navbarScrollingDropdown').click(function() {
	location.href = 'san-pham?action=${'all'}';
});

$('.cart__btn-proceed-checkout-dt').click(function() {
	window.location.href = "thanh-toan";
});

$("#btnSanPhamYeuThich").click(function () {
	window.location.href = "san-pham-yeu-thich";
});

$("#searchInput").on('input', _.debounce(function() {
	$('.product-list').show();

	$.ajax({
		url: '/san-pham',
		type: 'POST',
		data: {
			action: 'filter',
			name: $('#searchInput').val()
		},
		success: function (response) {
			renderSearchItems(response.productList);
			var length = response.productList.length;
			$(".search-see-more").show();
			$(".search-empty-message").hide();
			if(length<=0){
				$(".search-empty-message").show();
				$(".search-see-more").hide();
			}
			if(length < 16) {
				$('.search-see-more').text('Xem thêm ' + length + ' sản phẩm');
			}
			else {
				$('.search-see-more').text('Xem thêm các sản phẩm khác');
			}

		}
	});
}, 300));

$("#searchInput").on('focus', function() {
    $(this).prop('autocomplete', 'off');
    $(this).closest('.dropdown').removeClass('show');
});

$("#searchInput").on('focus', function() {
    $(this).closest('.dropdown').removeClass('show');
});


$('.dropdown').on('shown.bs.dropdown', function () {
    $("#searchInput").blur();
});

$("#searchInput").on('keypress', function(e) {
    if (e.which === 13) {
        e.preventDefault();
        performSearch();
    }
});

$(".fa-search, .search-see-more").on('click', function() {
    performSearch();
});

function performSearch() {
    window.location.href = 'san-pham?action=filter&name=' + $("#searchInput").val();
}
	document.getElementById('btn-card').addEventListener(
			'mouseover',
			function() {
				document.querySelector('.top-cart-content').classList
						.add('active');
});

function renderSearchItems(items) {
	$.get('/templates/product-search-template.jsp', function (template) {
        var $productContainer = $('.product-list .product-container');
        $productContainer.empty();
        $.each(items, function (index, item) {
            var $product = $(template);
            $product.attr('data-product-id', item.id);
            $product.find('.product_thumb').attr('src', item.thumb);
            $product.find('.product_name').text(item.name);
			$product.find('.product_name').attr("href","ProductDetail?productId="+item.id);

			if (item.sale != null) {
                $product.find('.product_new_price').text(formatPrice(item.newPrice));
                $product.find('.product_unit_price').text(formatPrice(item.unitPrice));
            } else {
                $product.find('.product_new_price').text(formatPrice(item.unitPrice));
            }

            $productContainer.append($product);
        });
    }, "html");
}


document.querySelector('.top-cart-content').addEventListener(
    'mouseover',
    function() {
	document.querySelector('.top-cart-content').classList
		.add('active');
    });
document.querySelector('.top-cart-content').addEventListener(
    'mouseout',
    function() {
	document.querySelector('.top-cart-content').classList
		.remove('active');
    });

$(document)
    .ready(

	    function() {
		// Mảng chứa các placeholder khác nhau
		var placeholders = [ "Tìm kiếm theo tên sản phẩm",
			"Tìm kiếm theo danh mục",
			"Tìm kiếm theo thương hiệu" ];
		var currentIndex = 0;
		var currentPlaceholder = "";
		var placeholderIndex = 0;

		// Hàm cập nhật placeholder với từng chữ
		function updatePlaceholder() {
		    if (placeholderIndex <= placeholders[currentIndex].length) {
			currentPlaceholder = placeholders[currentIndex]
				.substring(0, placeholderIndex);
			$("#searchInput").attr("placeholder",
				currentPlaceholder);
			placeholderIndex++;
		    } else {
			// Khi hoàn thành, đặt lại index và chuyển sang placeholder tiếp theo
			placeholderIndex = 0;
			currentIndex = (currentIndex + 1)
				% placeholders.length;
		    }
		}

		// Thực hiện cập nhật mỗi giây
		setInterval(updatePlaceholder, 60);

		$("#dropdownMenuButton1").click(function() {
		    $("#userLinks").toggle();
		});
	    });

</script>

</html>