<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="product" data-product-id="${param.id}"
	style="border-bottom: 1px solid #eee">
	<div class="row g-0">
		<div class="col-md-2 d-flex align-items-center p-2">
			<img src="${param.thumb}" alt=""
				class="card-img mx-auto search-product-img product_thumb">
		</div>
		<div class="col-md-10">
			<div class="card-body d-flex flex-column">
				<h3 class="card-title" style="color: #000; height: auto;">

					<a class="product_name">${param.name}</a>
				</h3>
				<div class="price-box">
					<span class="product_new_price"> <fmt:setLocale
							value='vi-VN' /> <fmt:formatNumber value="${param.newPrice}"
							type="currency" />
					</span> <span class="price-compare product_unit_price"> <c:if
							test="${not empty param.unitPrice}">
							<fmt:setLocale value='vi-VN' />
							<fmt:formatNumber value="${param.unitPrice}" type="currency" />
						</c:if>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>