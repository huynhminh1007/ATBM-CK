<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="card radius-green product" data-product-id="${id}">
	<div class="row g-0">
		<div class="col-md-4 d-flex align-items-center p-2 position-relative">
			<c:if test="${not empty param.sale}">
				<span class="span-sale product_sale position-absolute top-0 start-0"
					>Giảm
					${param.sale}</span>
			</c:if>
			<img src="${param.thumb}" alt="" class="card-img mx-auto">
		</div>
		<div class="col-md-8">
			<div class="card-body d-flex flex-column product" data-product-id="${param.id}">
				<h3 class="card-title">
					<a class="product_name" href="ProductDetail?productId=${param.id}">${param.name}</a>
				</h3>
				</h3>
				<div class="price-box">
					<fmt:setLocale value='vi-VN' />
					<fmt:formatNumber value="${param.newPrice}" type="currency" />
					<c:if test="${not empty param.unitPrice}">
						<span class="price-compare"> <fmt:formatNumber
								value="${param.unitPrice}" type="currency" />
						</span>
					</c:if>
				</div>
				<div class="button-control mt-2">
					<div class="btn-green btn-small add_cart">
						<i class="fa-solid fa-basket-shopping"></i>
					</div>
					<div class="btn-green btn-small search_detail">
						<i class="fa-solid fa-magnifying-glass"></i>
					</div>
					<div class="btn-green btn-small heartIcon">
						<i class="fa-solid fa-heart"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>