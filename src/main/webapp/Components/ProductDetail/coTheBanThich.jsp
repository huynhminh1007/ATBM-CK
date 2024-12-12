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
	<div class=" mt-4">
		<div class="group_title">
			<h5 class="title text-primary-green">Có thể bạn thích</h5>
		</div>
		<div class="vertical-items-container d-flex flex-column">
			<c:forEach items="${recommendedProducts}" var="item">
				<div class="item d-flex border-s-r-5 border-hover-green p-2 mb-2"
					data-target="ProductDetail?productId=${item.id}">
					<c:if test="${item.getClass().getSimpleName() eq 'ProductSale'}">
						<img src="${item.thumb}" alt="" class="mr-2" width="80px"
							height="80px">
						<div>
							<p class="max-width-50">${item.name}</p>
							<span class="text-primary-green fw-bold"> <fmt:formatNumber
									value="${item.newPrice}" type="currency"> </fmt:formatNumber>
							</span> <small
								class="text-decoration-line-through text-secondary text-sm">
								<fmt:formatNumber value="${item.unitPrice}" type="currency"> </fmt:formatNumber>
							</small>
						</div>
					</c:if>
					<c:if test="${item.getClass().getSimpleName() ne 'ProductSale'}">
						<img src="${item.thumb}" alt="" class="mr-2" width="80px"
							height="80px">
						<div>
							<p class="max-width-50">${item.name}</p>
							<span class="text-primary-green fw-bold"> <fmt:formatNumber
									value="${item.unitPrice}" type="currency">

							</fmt:formatNumber>
							</span>
						</div>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script type="text/javascript">
    $(".vertical-items-container .item").click(function() {
	let href = $(this).data("target");
	location.href = href;
    })
</script>
</html>