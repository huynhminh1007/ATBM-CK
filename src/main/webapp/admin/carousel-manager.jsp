<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Quản lý trang trình chiếu</title>
<link rel="stylesheet" type="text/css" media="all"
	href='../styles/bootstrap.css'>
<link rel="stylesheet" type="text/css" href="../styles/base.css">
<link rel="stylesheet" type="text/css" href="../styles/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="styles/admin.css?fef">
</head>
<style>
.container-fluid {
	padding: 0;
}

.col-4 form {
	margin: 10px 0;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	overflow: hidden;
}

.col-4 img {
	width: 100%;
	border-bottom: 1px solid #ddd;
}

form {
	padding: 20px;
}

input[type="text"], textarea {
	margin: 10px 0;
	padding: 10px;
	width: 100%;
	box-sizing: border-box;
	border: 1px solid #ddd;
	border-radius: 4px;
}

input[type="submit"] {
	background-color: #4caf50;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

.title {
	margin: 20px 0;
	padding: 10px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.date {
	color: #888;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container-fluid"></div>
	<div class="row">
		<jsp:include page="left-menu.jsp"></jsp:include>
		<div class="col-9 pt-3">
			<div
				class="container title d-flex justify-content-between bg-white rounded">
				<h5>Quản lý trang trình chiếu</h5>
				<span class="date">Thứ 2, ngày 30/10/2023 - 11 giờ 25 phút</span>
			</div>
			<div class="container-fluid">
				<div class="row">
					<c:forEach items="${carousels}" var="item">
						<div class="col-4 ">
							<form action="Carousel" method="post" class="d-flex flex-column" enctype="multipart/form-data">
								<input type="hidden" name="pos" value="${item.id}"> <input
									type="hidden" name="thumb" value="${item.thumb}"> <img
									src="../${item.thumb}" alt=""
									style="width: 300px; height: 150px" id=thumb${item.id}> 
									<input
									type="file" class="img" name="img" data-target=${item.id} accept="image/*"> <input
									type="text" placeholder="Tiêu đề" name="title"
									value="${item.title }">
								<textarea name="content" id="" cols="30" rows="10">
								${item.content}
								</textarea>
								<input type="submit" value="Lưu">
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(".nav-link").removeClass("active");
	$("#carousel-nav-link").addClass("active");
	$(".img").on("change", function(event) {
		const fileInput = event.target;
		let imgId = $(this).data("target");
		const file = fileInput.files[0];
		if (file && file.type.startsWith('image/')) {
			renderImage(file,imgId);
		} else {
			alert('Please choose a valid image file.');
		}
	})
	function renderImage(imageFile,imgId) {
		$("#thumb"+imgId).attr("src", URL.createObjectURL(imageFile));
	}
</script>

</html>