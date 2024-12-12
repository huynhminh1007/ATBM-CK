<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="visitedProduct" class="relative-product">
		<div class="group_title mt-5">
			<div class="title">
				<a class="title-name" href=""> Sản phẩm đã xem </a>
			</div>
			<div class="button-control">
				<div class="btn-green btn-small disabled" data-direction="left">
					<i class="fa-solid fa-chevron-left fa-chevron"></i>
				</div>
				<div class="btn-green btn-small" data-direction="right">
					<i class="fa-solid fa-chevron-right fa-chevron"></i>
				</div>
			</div>
		</div>
		<div class="card-deck d-flex mr-child-20">
			<div class="swiper">
				<div class="swiper-wrapper">
					<c:set var="visitedProducts"
						value="${sessionScope.visitedProducts}" />
					<c:forEach items="${visitedProducts}" var="item">
						<div class="card radius-green swiper-slide product"
							data-product-id="${item.id}">
							<div class="icons">
								<button href="#" class="fas fa-heart heartIcon"></button>
								<button href="#" class="fas add_cart">
									<i class="fa-solid fa-cart-shopping"></i>
								</button>
								<button class="fas">
									<a href="ProductDetail?productId=${item.id}"> <i
										class="fa-solid fa-magnifying-glass"> </i>
									</a>
								</button>
							</div>
							<div class="card-body">
								<c:if test="${not empty item.sale}">
									<span class="span-sale">Giảm ${item.sale}</span>
								</c:if>
								<img class="card-img-top" src="${item.thumb}" alt="">
								<h3 class="card-title">
									<a href=""> ${item.name}</a>
								</h3>
								<div class="price-box">
									<c:if test="${item.newPrice >0}">
										<fmt:setLocale value='vi-VN' />
										<fmt:formatNumber value="${item.newPrice}" type="currency" />
										<span class="price-compare"> <fmt:formatNumber
												value="${item.unitPrice}" type="currency" />
										</span>
									</c:if>
									<c:if test="${item.newPrice ==0}">
										<fmt:setLocale value='vi-VN' />
										<fmt:formatNumber value="${item.unitPrice}" type="currency" />
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
					<c:if test="${visitedProducts.size() < 4}">
						<c:set var="size" value="${4 - visitedProducts.size()}" />
						<c:forEach var="i" begin="0" end="${size}">
							<div class="swiper-slide"></div>
						</c:forEach>
					</c:if>
				</div>
			</div>


		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script type="text/javascript">
	var visitedSwiper = new Swiper("#visitedProduct > .card-deck > .swiper", {
	    slidesPerView : 4,
	    spaceBetween : 20,
	});
	var visitedArrows = $("#visitedProduct > .group_title >  .button-control > .btn-small");
	let visitedIndex = 0;
	visitedArrows.on("click", function() {
	    let direction = $(this).data("direction");
	    if (direction == "right" && visitedIndex <= ${visitedProducts.size()-5}) {
		visitedSwiper.slideNext();
		visitedIndex++;
	    } else if (direction == "left" && visitedIndex > 0) {
		visitedIndex--;
		visitedSwiper.slidePrev();
	    }
		updateArrowStatus(visitedIndex,this);
	});
	function updateArrowStatus(visitedIndex,arrow) {
	    visitedArrows.removeClass("disabled");
		if(visitedIndex > ${visitedProducts.size()-5} || visitedIndex ==0){
			$(arrow).addClass("disabled");
		}
	}
    </script>
</body>
</html>