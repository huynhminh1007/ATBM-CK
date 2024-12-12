<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">


</head>

<body>
	<div id="relative-product" class="relative-product ">
		<div class="group_title mt-5">
			<div class="title">
				<a class="title-name" href="">Sản phẩm liên quan </a>
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
		<div class="card-deck d-flex mr-child-20 overflow-hidden ">
			<div class="swiper">
				<div class="swiper-wrapper">
					<c:forEach items="${relativeProducts}" var="item">
						<div class="card radius-green swiper-slide product "
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
								<c:if test="${item.getClass().getSimpleName() eq 'ProductSale'}">
									<span class="span-sale">Giảm ${item.sale}</span>
									<img class="card-img-top" src="${item.thumb}" alt="">
									<h3 class="card-title">
										<a href=""> ${item.name}</a>
									</h3>
									<div class="price-box">
										<fmt:setLocale value='vi-VN' />
										<fmt:formatNumber value="${item.newPrice}" type="currency" />
										<span class="price-compare"> <fmt:formatNumber
												value="	 ${item.unitPrice} " type="currency" />
										</span>
									</div>
								</c:if>
								<c:if test="${item.getClass().getSimpleName() ne 'ProductSale'}">
									<img class="card-img-top" src="${item.thumb}" alt="">
									<h3 class="card-title">
										<a href=""> ${item.name}</a>
									</h3>
									<div class="price-box">
										<fmt:setLocale value='vi-VN' />
										<fmt:formatNumber value="${item.unitPrice}" type="currency" />
									</div>
								</c:if>
							</div>
						</div>
					</c:forEach>
					<c:if test="${relativeProducts.size() < 4}">
						<c:forEach begin="1" end="${4-relativeProducts.size()}">
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
					$(document).ready(function () {
						function updateArrowStatus(index, arrow) {
							arrows.removeClass("disabled");
							if (index > ${ relativeProducts.size() - 5 } || index == 0) {
								$(arrow).addClass("disabled");
							}
						}
						var swiper = new Swiper("#relative-product > .card-deck > .swiper", {
							slidesPerView: 4,
							spaceBetween: 20,
						});
						var arrows = $("#relative-product > .group_title > .button-control > .btn-small");
						let index = 0;
						arrows.on("click", function () {
							let direction = $(this).data("direction");
							if (direction == "right" && index <= ${ relativeProducts.size() - 5 }) {
							swiper.slideNext();
							index++;
						} else if (direction == "left" && index > 0) {
							index--;
							swiper.slidePrev();
						}
						updateArrowStatus(index, this);
					});
				
				}
				);
				</script>
</body>

</html>