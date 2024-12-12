<%@page import="Model.Wishlist"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="Model.ProductSale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Formatter"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap.css">
<link rel="stylesheet" type="text/css" href="styles/base.css">
<link rel="stylesheet" type="text/css" href="styles/main.css">
	<link rel="stylesheet" href="styles/nav.css">
<link rel="stylesheet" type="text/css" href="styles/lightslider.css">
<link rel="stylesheet" type="text/css"
	href="styles/san-pham-khuyen-mai.css">
<link rel="stylesheet" type="text/css" href="styles/aside.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<title></title>
</head>
<body>
	<jsp:include page="Components/header.jsp" />

	<jsp:include page="top-title.jsp">
		<jsp:param name="title" value="Sản phẩm yêu thích" />
	</jsp:include>

	<div id="wrapper" style="margin: 60px 0;">
		<div class="container mt-3">
			<div class="row gx-4">
				<div class="col-md-12">
					<div class="products-view-grid">
						<div class="row mb-child-20 product-container wishlist-container">
							<c:forEach items="${wishlist}" var="item">
								<c:set var="isSale"
									value="${item.getClass().getSimpleName() eq 'ProductSale'}">
								</c:set>

								<div class="col-6 col col-xl-3" style="max-width: 20%;">
									<jsp:include page="/templates/product-template.jsp">
										<jsp:param name="id" value="${item.id}" />
										<jsp:param name="name" value="${item.name}" />
										<jsp:param name="thumb" value="${item.thumb}" />
										<jsp:param name="newPrice" value="${isSale ? item.newPrice : item.unitPrice}" />
										<jsp:param name="unitPrice" value="${isSale ? item.unitPrice : ''}" />
										<jsp:param name="sale" value="${isSale ? item.sale : ''}" />
										<jsp:param name="favorited" value="${true}" />
									</jsp:include>
								</div>
							</c:forEach>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="Components/footer.jsp" />
	</footer>
</body>

<script type="text/javascript" src="javascripts/jquery-3.7.1.js"></script>
<script type="text/javascript" src="javascripts/lightslider.js"></script>
<script type="text/javascript" src="javascripts/main.js?abc"></script>
<script type="text/javascript" src="javascripts/shopping-cart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="javascripts/lightslider.js"></script>
<script type="text/javascript" src="javascripts/pagination.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#imageGallery').lightSlider({
			gallery : true,
			item : 1,
			loop : true,
			auto : true,
			thumbItem : 6,
			slideMargin : 0,
			enableDrag : true,
			currentPagerPosition : 'left',
			onSliderLoad : function(el) {
				el.lightGallery({
					selector : '#imageGallery .lslide'
				});
			}
		});
		var showDesBtn = $("#show-des-btn");
		var showGuideBtn = $("#show-guide-btn");
		$(".buy-guide-box").hide();
		showDesBtn.click(function(event) {
			$(".description-box").show();
			$(".buy-guide-box").hide();
			showDesBtn.addClass('active');
			showGuideBtn.removeClass('active');
		});
		showGuideBtn.click(function(event) {
			$(".description-box").hide();
			$(".buy-guide-box").show();
			showGuideBtn.addClass('active');
			showDesBtn.removeClass('active');
		});
	});
</script>

</html>