<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="id" value="${param.id}"/>
<div class="card radius-green product" data-product-id="${id}">
	<span class="span-sale product_sale"
          <c:if test="${empty param.sale}">style="display:none;"</c:if>>Giảm
        ${param.sale}</span> <img class="card-img-top product_thumb"
                                  src="${param.thumb}" alt="">
    <div class="icons">
        <button href="#" class="fas fa-heart heartIcon ${param.favorited ? 'favorited' : ''}"></button>
        <button href="#" class="fas add_cart">
            <i class="fa-solid fa-cart-shopping"></i>
        </button>
        <button class="fas search_detail">
            <a> <i class="fa-solid fa-magnifying-glass"> </i>
            </a>
        </button>
    </div>
    <div class="card-body">
        <h3 class="card-title">
            <a class="product_name" href="ProductDetail?productId=${param.id}">${param.name}</a>
        </h3>
        <div class="card-text">
            <div class="price-box">
				<span class="product_new_price"> <fmt:setLocale value='vi-VN'/>
					<fmt:formatNumber value="${param.newPrice}" type="currency"/>
				</span> <span class="price-compare product_unit_price"> <c:if
                    test="${not empty param.unitPrice}">
                <fmt:setLocale value='vi-VN'/>
                <fmt:formatNumber value="${param.unitPrice}" type="currency"/>
            </c:if>
				</span>
            </div>
        </div>
    </div>
</div>
