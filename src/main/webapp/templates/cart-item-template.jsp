<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" type="text/css" href="styles/icon.css?d">
<div class="cart-item" data-cart-id="${param.productId}"  data-stock-quantity="${param.unitsInStock}"
     style="border-bottom: 1px solid #eee">
    <div class="row g-0">
        <div class="col-md-4 d-flex align-items-center p-2">
            <img src="${param.productThumb}" alt=""
                 class="card-img mx-auto cart_img">
        </div>
        <div class="col-md-8">
            <div class="card-body d-flex flex-column">
                <h3 class="card-title" style="color: #000; height: auto;">
                    <a class="cart_title" href="ProductDetail?productId=${param.productId}">${param.productName}</a>
                </h3>
                <div class="cart_delete" style="margin-bottom: 10px;">
                    <span>Xóa</span>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <div class="button-control d-flex"
                         style="border: 1px solid #000; border-radius: 4px; padding: 2px;">
                        <div class="btn-green btn-small cart_decrease"
                             style="width: 26px; height: 26px; border-radius: 4px;">
                            <i class="">-</i>
                        </div>
                        <input type="number" class="input-quantity cart_quantity"
                               name="input-quantity"
                               data-stock-quantity="${param.unitsInStock}"
                               style="width: 32px; height: 26px; text-align: center; color: #000; border: none;"
                               value="${param.quantity}">
                        <div class="btn-green btn-small cart_increase"
                             data-stock-quantity="${param.unitsInStock}"
                             style="width: 26px; height: 26px; border-radius: 4px;">
                            <i class="fa-solid fa-plus"></i>
                        </div>
                    </div>
                    <div class="price-box cart_price" style="">
                        <fmt:setLocale value='vi-VN'/>
                        <fmt:formatNumber value="${param.totalPrice}" type="currency"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>