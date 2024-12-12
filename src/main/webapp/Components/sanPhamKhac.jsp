<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Formatter"%>
<%@page import="java.util.logging.SimpleFormatter"%>
<%@page import="Model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	List<Product> products = (List<Product>) request.getAttribute("dsSanPhamKhac");
	NumberFormat numberFormat = NumberFormat.getCurrencyInstance();
%>
<body>
	<div class="col-md-4" id="product-slider-6">
		<div class="group_title">
			<div class="title">
				<a class="title-name" href=""> Thực phẩm khác </a>
			</div>
			<div class="button-control">
				<div class="btn-green btn-small btn-prev">
					<i class="fa-solid fa-chevron-up"></i>
				</div>
				<div class="btn-green btn-small btn-next">
					<i class="fa-solid fa-chevron-down"></i>
				</div>
			</div>
		</div>
		<div class="card-desk mb-child-20 product-container">
			<c:forEach items="<%=products%>" var="item">
				<c:set var="isSale" value="${item.getClass().getSimpleName() eq 'ProductSale'}" />

				<jsp:include page="/templates/product-horizontal-template.jsp">
					<jsp:param name="id" value="${item.id}" />
					<jsp:param name="name" value="${item.name}" />
					<jsp:param name="thumb" value="${item.thumb}" />
					<jsp:param name="newPrice" value="${isSale ? item.newPrice : item.unitPrice}" />
					<jsp:param name="unitPrice" value="${isSale ? item.unitPrice : ''}" />
					<jsp:param name="sale" value="${isSale ? item.sale : ''}" />
					<jsp:param name="favorited" value="${wishlistId.contains(item.id)}" />
				</jsp:include>
			</c:forEach>
		</div>
		<div class="see-more">
			<a href="san-pham?action=filter&page=1&category=10" class="">Xem tất cả</a>
		</div>
	</div>
</body>

<script type="text/javascript" src="javascripts/slick.js"></script>
<script type="text/javascript">
	function initializeSlider(sliderId, vertical, slidesToShow, slidesToScroll) {
		var productSlider = $('#' + sliderId);
		var productContainer = productSlider.find('.product-container');
		var btnPrev = productSlider.find('.btn-prev');
		var btnNext = productSlider.find('.btn-next');

		btnPrev.css('display', 'inline-flex');
		btnNext.css('display', 'inline-flex');
		
		$(productContainer).slick({
			dots : false,
			infinite : false,
			speed : 600,
			vertical : vertical,
			slidesToShow : slidesToShow,
			slidesToScroll : slidesToScroll,
			draggable : false,
			prevArrow : btnPrev,
			nextArrow : btnNext
		});
		
		var childElement = $('.slick-slide').children().children();
		childElement.css('width', '');

		btnPrev.on('click', function() {
			productContainer.slick('slickPrev');
		});

		btnNext.on('click', function() {
			productContainer.slick('slickNext');
		});

		$(productContainer).on(
				'beforeChange',
				function(event, slick, currentSlide, nextSlide) {
					if (nextSlide === 0) {
						btnPrev.addClass('disabled');
					} else {
						btnPrev.removeClass('disabled');
					}

					var lastSlideIndex = slick.slideCount
							- slick.options.slidesToShow;
					if (nextSlide >= lastSlideIndex) {
						btnNext.addClass('disabled');
					} else {
						btnNext.removeClass('disabled');
					}
				});

		updateButtonVisibility(productContainer.slick('getSlick'));

		function updateButtonVisibility(slick) {
			var currentSlide = slick.currentSlide;

			if (currentSlide <= 0) {
				btnPrev.addClass('disabled');
			} else {
				btnPrev.removeClass('disabled');
			}
			
			if (slick.slideCount <= slick.options.slidesToShow) {
				btnNext.addClass('disabled');
			} else {
				btnNext.removeClass('disabled');
			}
		}
	}

	initializeSlider('product-slider-1', false, 4, 4);
	initializeSlider('product-slider-2', false, 4, 4);
	initializeSlider('product-slider-3', false, 4, 4);
	initializeSlider('product-slider-4', true, 4, 4);
	initializeSlider('product-slider-5', true, 4, 4);
	initializeSlider('product-slider-6', true, 4, 4);
	initializeSlider('product-slider-7', false, 5, 5);
</script>
</html>