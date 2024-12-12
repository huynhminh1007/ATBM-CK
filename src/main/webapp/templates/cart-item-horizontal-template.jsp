<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="cart_product d-flex text-center cart-item"
	data-cart-id="${param.productId}"   data-stock-quantity="${param.unitsInStock}">
	<a href="" class="cart_img" title="Kim chi"><img
		src="${param.productThumb}" style="width: 120px"></a>
	<div class="cart_info d-flex col-xl-10">
		<div class="cart_name col-xl-6 text-lg-start text-center">
			<a href="ProductDetail?productId=${param.productId}" class="h6 fw-bold text-dark cart_title">${param.productName}</a>
			<span class="variant-title d-block">${param.productWeight} Kg</span>
			<div class="cart_delete" style="margin-bottom: 10px;">
				<span>Xóa</span>
			</div>
		</div>
		<div class="grid d-flex col-xl-2">
			<div class="price-box cart_product_price" style="">
				<fmt:setLocale value='vi-VN' />
				<fmt:formatNumber value="${param.price}" type="currency" />
			</div>
		</div>
		<div class="grid col-xl-2">
			<div class="button-control d-flex justify-content-between"
				style="border: 1px solid #000; border-radius: 4px; padding: 2px;">
				<div class="btn-green btn-small cart_decrease"
					style="width: 26px; height: 26px; border-radius: 4px;">
					<i class="">-</i>
				</div>
				<label>
					<input type="number" class="input-quantity cart_quantity"
						   id="input-quantity"
						   data-stock-quantity="${param.unitsInStock}"
							name="input-quantity"

						style="width: 32px; height: 26px; text-align: center; color: #000; border: none;"
						value="${param.quantity}"/>
				</label>
				<div class="btn-green btn-small cart_increase" data-stock-quantity="${param.unitsInStock}"
					style="width: 26px; height: 26px; border-radius: 4px;">
					<i class="fa-solid fa-plus"></i>
				</div>
			</div>
		</div>
		<div class="grid col-xl-2 text-center">
			<div class="price-box cart_price" style="">
				<fmt:setLocale value='vi-VN' />
				<fmt:formatNumber value="${param.totalPrice}" type="currency" />
			</div>
		</div>
	</div>
</div>
