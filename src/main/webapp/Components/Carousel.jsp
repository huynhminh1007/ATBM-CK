<%@page import="Model.Carousel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css?version=1">
<title>Insert title here</title>
</head>
<body>

	<div id="carouselExampleDark" class="carousel carousel-dark slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleDark"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<c:forEach items="${carousels}" var="item" varStatus="status">
				<c:if test="${status.count == 1}">
					<div class="carousel-item active" data-bs-interval="2000">
				</c:if>
				<c:if test="${status.count != 1}">
					<div class="carousel-item" data-bs-interval="2000">
				</c:if>
				<img src="${item.thumb }" class="d-block w-100"
					style="height: 640px" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h5>${item.title }</h5>
					<p>${item.content}</p>
				</div>
		</div>
		</c:forEach>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleDark" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleDark" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
	</div>
</body>
<script type="text/javascript">
	
</script>
</html>