<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
</head>
<body>
	<div class="aside-content bg-light-green">
		<div class="title-head-large text-primary-green mb-3">Danh mục
			sản phẩm</div>
		<nav class="nav-category">
			<ul class="nav-list ">
				<c:forEach items="${categories}" var="item">
					<c:if test="${empty  item.children}">
						<li class="nav-item" data-category=${item.id}><a>${item.name}</a>
							<i class="fa-regular fa-plus open-menu" style="color: #000000;"></i></li>
					</c:if>
					<c:if test="${not empty item.children}">
						<li class="nav-item" data-category=${item.id}><a>${item.name}
						</a> <i class="fa-regular fa-plus open-menu" style="color: #000000;"></i>
						</li>
						<ul class="nav-list chilren-list">
							<c:forEach items="${item.children}" var="child">
								<li class="nav-item " data-category=${child.id}><a
									class="text-primary-green">${child.name} </a></li>
							</c:forEach>
						</ul>
					</c:if>
				</c:forEach>
			</ul>

		</nav>
	</div>

</body>
<style>
.text-primary-green {
	color: green !important;
}
</style>
<script type="text/javascript">
	$(".chilren-list").hide();
	$(".aside-content  .nav-category .nav-list  .nav-item").click(function() {
		let child = $(this).next("ul.nav-list");
		child.slideToggle();
	});
</script>
</html>