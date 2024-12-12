<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link rel="stylesheet" type="text/css" media="all"
	href='../styles/bootstrap.css'>
<link rel="stylesheet" type="text/css" href="../styles/base.css">
<link rel="stylesheet" type="text/css" href="../styles/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="styles/admin.css?dddsdsds">
<script src="javascripts/chart.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container-fluid"></div>
	<div class="row">
		<jsp:include page="left-menu.jsp"></jsp:include>
		<div class="col-9 pt-3">
			<div
				class="container title d-flex justify-content-between bg-white rounded">
				<h5>Quản lý danh mục</h5>
				<span class="date">Thứ 6, ngày 19/07/2024</span>
			</div>
			<div class="container-fluid"></div>
			<div class="row w-100">
				<div class="col-12">
					<div class="list-orders mt-3 bg-white">
						<div class="sub-title">
							<h4>Danh sách các danh mục</h4>
						</div>
						<div class="btns mt-3 btn-sm">
							<button id="createCategory" class="btn btn-success "
								data-togle="modal" data-target="#newCategoryModal">
								<i class="fa-solid fa-plus"></i>Tạo danh mục mới
							</button>
						</div>
						<table class="table" id="orders">
							<thead>
								<tr>
									<th scope="col">ID danh mục</th>
									<th scope="col">Tên danh mục</th>
									<th scope="col">Tên danh mục cha</th>
									<th scope="col">Trạng thái</th>
									<th scope="col">Chức năng</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${categories}" var="item">
									<c:if test="${not empty item.children}">
										<c:forEach items="${item.children}" var="child">
											<tr id=${child.id}>
												<td>${child.id}</td>
												<td name="name">${child.name}</td>
												<td name='parentId' data-parent=${item.id}>${item.name}</td>
												<c:if test="${child.active eq 1 }">
													<td class="status status-active">Hoạt động</td>

												</c:if>
												<c:if test="${child.active ne 1 }">
													<td class="status status-delivering">Ẩn</td>
												</c:if>
												<td>
													<div class="btn-group">
														<button class="btn btn-warning btn-sm detail-btn"
															data-target=${child.id}>
															<i class="fa-solid fa-pen-to-square"></i>
														</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${empty item.children}">
										<tr id=${item.id}>
											<td>${item.id}</td>
											<td name="name">${item.name}</td>
											<td>Không có</td>
											<c:if test="${item.active eq 1 }">
												<td class="status status-active">Hoạt động</td>
											</c:if>
											<c:if test="${item.active ne 1 }">
												<td class="status status-delivering">Ẩn</td>
											</c:if>
											<td>
												<div class="btn-group">
													<button class="btn btn-warning btn-sm detail-btn"
														data-target=${item.id}>
														<i class="fa-solid fa-pen-to-square"></i>
													</button>
												</div>
											</td>
										</tr>
									</c:if>
								</c:forEach>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal HTML Markup -->
	<div id="newCategoryModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title text-xs-center">Tạo danh mục mới</h4>
				</div>
				<div class="modal-body">
					<form role="form" method="POST" action="Category">
						<input type="hidden" id="hidden" name="action" value="post">
						<input type="hidden" id="CategoryId" name="CategoryId" value=1>
						<div class="form-floating mb-3">
							<input type="text" name="category-name" class="form-control"
								id="categoryName" placeholder="" required> <label
								for="floatingInput">Tên danh mục</label>
						</div>
						<div class="form-floating">
							<select class="form-select mb-3" id="parentCategory"
								name="category-parent-id" required>
								<option selected value=0>Không có</option>
								<c:forEach items="${categories}" var="item">
									<c:if test="${not emptyiten.children}">
										<option value=${item.id } id='parent${item.id}'>${item.name}</option>
									</c:if>
								</c:forEach>
							</select> <label>Danh mục cha</label>
						</div>
						<div class="form-floating">
							<select class="form-select mb-3" id="categoryStatus"
								name='status' required>
								<option selected value=1>Hoạt động</option>
								<option value=0>Ẩn</option>
							</select> <label>Trạng thái</label>
						</div>
						<div class="d-flex justify-content-center">
							<button id="addNewCategory" class="btn btn-success btn-md"
								type="submit">Lưu danh mục</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="../javascripts/jquery-3.7.1.js"></script>
<script type="text/javascript" src="../javascripts/main.js"></script>
<script src="../javascripts/bootstrap.min.js"></script>
<script src="../javascripts/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
    let re = ' ${requestScope.result}';
    if (re != ' ') {
	showNotification();
    }
    function showNotification() {
	notify2("Thông báo", re, "success", 1000);
    }
    $(".detail-btn").click(
	    function() {
		$('#newCategoryModal').modal('show');
		let id = $(this).data("target");
		let categoryName = $("#" + id + " td[name='name']").text();
		let parentCategoryIndex = $("#" + id + " td[name='parentId']")
			.data("parent");
		$("#parentCategory #parent" + parentCategoryIndex).attr(
			"selected", 'selected');
		$("#categoryName").val(categoryName);
		let input = $("#hidden").val("put");
		$("#CategoryId").val(id);
	    })
    $("#createCategory").click(function() {
	let input = $("#hidden").val("post");
	$('#newCategoryModal').modal('show');
    })
</script>

</html>