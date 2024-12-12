<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link rel="stylesheet" type="text/css" media="all"
		  href="../styles/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../styles/base.css">
	<link rel="stylesheet" type="text/css" href="../styles/main.css">

	<link rel="stylesheet" href="styles/admin.css?dd">
	<link rel="stylesheet" type="text/css" href="../Datatables-V2/datatables.css">
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
	<style>
		.product-name:hover {
			color: var(--primary-green);
			cursor: pointer;
		}

		.product-name {
			white-space: normal !important;
			word-wrap: break-word !important;
		}

		.break-word {
			white-space: normal;
			word-wrap: break-word;
		}

		.close {
			cursor: pointer;
		}

		.btn-info {
			color: #fff !important;
			background-color: #17a2b8 !important;
			border-color: #17a2b8 !important;
		}

		.btn-info:hover {
			color: #fff;
			background-color: #138496;
			border-color: #117a8b;
		}

		.btn-control {
			margin-left: 10px;
			vertical-align: inherit !important;
		}

		.btn-control i {
			margin-right: 6px;
		}

		.form-group {
			margin-bottom: 20px;
		}

		.select-option {
			cursor: pointer;
		}

		.custom-select, .search {
			width: auto !important;
			display: inline-block !important;
		}

		.dropdown-item {
			cursor: pointer;
		}

		.btn-container-dropdown {
			position: relative;
		}

		.btn-container-dropdown .dropdown-menu {
			min-width: 100% !important;
		}
	</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid"></div>
<div class="row">
	<jsp:include page="left-menu.jsp"></jsp:include>
	<div class="col-10 pt-3">
		<div class="container-fluid">
			<div class="row w-100">
				<div class="col-12">
					<div class="bg-white">
						<div class="sub-title">
							<h4>Quản lý sản phẩm</h4>
						</div>
						<div class="table-container mt-3">
							<div class="mb-3">
								<div class="table-control d-flex">
									<div>
										<button id="newProduct" data-target="AdminProductController?action=forward"
												class="btn btn-success">
											<i class="fa-solid fa-plus" style="margin-right: 6px"></i>Tạo sản phẩm mới
										</button>
										<button type="button" id="btn-filter" class="btn btn-info btn-control"
												data-toggle="modal" data-target="#filterModal">
											<i class="fa-solid fa-filter"></i>Bộ lọc
										</button>
									</div>
									<div class="ms-auto text-end btn-container-dropdown">
										<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											Xuất File
										</button>
										<div id="optionExport" class="dropdown-menu export-menu">
											<span class="dropdown-item">Copy</span>
											<span class="dropdown-item">CSV</span>
											<span class="dropdown-item">Excel</span>
											<span class="dropdown-item">PDF</span>
										</div>
									</div>
								</div>
							</div>
							<table id="datatable" class="row-border hover nowrap">
								<thead>
								<tr>
									<th></th>
									<th class="text-center">Mã sản phẩm</th>
									<th style="min-width: 10vw">Tên sản phẩm</th>
									<th class="text-center">Hình ảnh</th>
									<th class="text-right">Giá nhập</th>
									<th class="text-right">Giá bán</th>
									<th class="text-right">Tồn kho</th>
									<th>Danh mục</th>
								</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="filterModal" tabindex="-1" role="dialog"
				 aria-labelledby="filterModalCenterTitle"
				 aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="filterModalLongTitle">Bộ lọc sản phẩm</h5>
							<i data-dismiss="modal" class="close fa-solid fa-xmark"></i>
						</div>
						<div class="modal-body">
							<form id="form-filter">
								<div class="form-group row align-items-center">
									<label class="col" for="categoriesList">Danh mục sản phẩm</label>
									<div class="col">
										<select id="categoriesList" class="form-select">
											<c:forEach items="${categoriesList}" var="item">
												<option value="${item.id}">${item.name}</option>
											</c:forEach>
											<option selected value="-1">Tất cả</option>
										</select>
									</div>
								</div>

								<div class="form-group row align-items-center">
									<label class="col" for="statusList">Tình trạng sản phẩm</label>
									<div class="col">
										<select id="statusList" class="form-select">
											<option value="Còn hàng">Còn hàng</option>
											<option value="Hết hàng">Hết hàng</option>
											<option selected value="-1">Tất cả</option>
										</select>
									</div>
								</div>

								<div class="form-group row align-items-center">
									<label class="col">Ngày cập nhật</label>
									<div class="col">
										<input class="form-control" type="date" id="lastUpdatedFilter">
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
							<button id="btnApplyFilter" class="btn btn-success" data-dismiss="modal">Áp dụng</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="../javascripts/popper.min.js"></script>
<script type="text/javascript" src="../javascripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../javascripts/jquery-3.7.1.js"></script>
<script type="text/javascript" src="../Datatables-V2/datatables.js"></script>
<script type="text/javascript">
	function formatNumber(number) {
		return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	function formatCurrency(amount) {
		return new Intl.NumberFormat('vi-VN', {
			style: 'currency',
			currency: 'VND'
		}).format(amount);
	}

	function formatDetailRow(data) {
		return (
				'<dl>' +
				formatSubDetailOnRow('Trọng lượng', formatNumber(data.weight)) + ' kg' +
				'<br>' +
				formatSubDetailOnRow('Trạng thái', data.status.description) +
				'<br>' +
				formatSubDetailOnRow('Ngày cập nhật', moment(data.lastUpdated, 'MMM D, YYYY, h:mm:ss A').format('DD-MM-YYYY HH:mm')) +
				'</dl>'
		);
	}

	function formatSubDetailOnRow(label, data) {
		return '<b>' + label + ': </b>' + data;
	}

	$(document)
			.ready(
					function () {
						$("#newProduct").click(function() {
							let href = $(this).data("target");
							location.href = href;
						});

						let controlBar = document.createElement('div');

						controlBar.innerHTML = `
                            <div class="align-items-center">
                            <label>Tìm kiếm sản phẩm</label>
                            <input style="padding-left: 5px; margin-left: 10px" id="search" class="search form-control" type="search" name="name" placeholder="Tìm kiếm...">
                            </div>
                            `;

						let table = $('#datatable').DataTable({
							serverSide: true,
							pageLength: 25,
							scrollX: true,
							scrollCollapse: true,
							scrollY: '55vh',
							order: [],
							ajax: {
								url: 'quan-ly-san-pham',
								type: 'POST',
								data: function (d) {
									NProgress.start();
									d.action = 'get';
									d.categoryId = $('#categoriesList').val();
									d.status = $('#statusList').val();
									d.lastUpdated = $('#lastUpdatedFilter').val();
									NProgress.done();
								}
							},
							rowCallback: function (row, data) {
								$(row).attr('data-id', data.id);
							},
							columnDefs: [
								{
									targets: [1, 3],
									className: 'dt-center'
								},
								{
									targets: [4, 5, 6],
									className: 'dt-right'
								},
								{
									targets: [3, 7],
									orderable: false
								},
								{targets: 1, name: 'id'},
								{targets: 2, name: 'name'},
								{targets: 4, name: 'costPrice'},
								{targets: 5, name: 'unitPrice'},
								{targets: 6, name: 'unitsInStock'}
							],
							columns: [
								{
									className: 'dt-control',
									orderable: false,
									data: null,
									defaultContent: ''
								},
								{data: 'id'},
								{
									data: 'name',
									render: function (data, type, row) {
										return '<span class="product-name">' + data + '</span>';
									}
								},
								{
									data: 'thumb',
									render: function (data, type, row) {
										return '<img src="../' + data + '" width="100px" height="100px">';
									}
								},
								{
									data: 'costPrice',
									render: function (data, type, row) {
										return formatCurrency(data);
									}
								},
								{
									data: 'unitPrice',
									render: function (data, type, row) {
										return formatCurrency(data);
									}
								},
								{
									data: 'unitsInStock',
									render: function (data, type, row) {
										return formatNumber(data);
									}
								},
								{
									data: 'categories.name',
									render: function (data, type, row) {
										return '<span class="break-word">' + data + '</span>';
									}
								}
							],
							language: {
								"sProcessing": "Đang xử lý...",
								"sLengthMenu": "Hiển thị _MENU_ mục",
								"sZeroRecords": "Không tìm thấy dữ liệu",
								"sInfo": "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
								"sInfoEmpty": "Hiển thị 0 đến 0 của 0 mục",
								"sInfoFiltered": "(được lọc từ _MAX_ mục)",
								"sInfoPostFix": "",
								"sSearch": "Tìm kiếm:",
								"sUrl": "",
								"oPaginate": {
									"sFirst": "Đầu",
									"sPrevious": "Trước",
									"sNext": "Tiếp",
									"sLast": "Cuối"
								},
								"oAria": {
									"sSortAscending": ": kích hoạt để sắp xếp cột tăng dần",
									"sSortDescending": ": kích hoạt để sắp xếp cột giảm dần"
								},
								"emptyTable": "Không tìm thấy dữ liệu",
							},
							layout: {
								topStart: controlBar,
								topEnd: 'pageLength'
							},
							buttons: [
								{
									extend: 'copyHtml5',
									title: 'Danh sách sản phẩm ' + new Date().toISOString().slice(0, 10),
									exportOptions: {
										columns: function (idx, data, node) {
											return idx !== 0 && idx !== 3; // Loại bỏ cột thứ 0 và 3
										}
									},
								},
								{
									extend: 'excelHtml5',
									filename: 'Danh sách sản phẩm ' + new Date().toISOString().slice(0, 10),
									title: '',
									exportOptions: {
										columns: function (idx, data, node) {
											return idx !== 0 && idx !== 3; // Loại bỏ cột thứ 0 và 3
										}
									},
								},
								{
									extend: 'csvHtml5',
									title: 'Danh sách sản phẩm ' + new Date().toISOString().slice(0, 10),
									exportOptions: {
										columns: function (idx, data, node) {
											return idx !== 0 && idx !== 3; // Loại bỏ cột thứ 0 và 3
										}
									},
								},
								{
									extend: 'pdfHtml5',
									title: 'Danh sách sản phẩm ' + new Date().toISOString().slice(0, 10),
									exportOptions: {
										columns: function (idx, data, node) {
											return idx !== 0 && idx !== 3; // Loại bỏ cột thứ 0 và 3
										}
									},
								}
							],
							initComplete: function () {
								var api = this.api();
								var searchInput = $('#search');
								var debounceTimeout;

								function debounce(func, delay) {
									var context = this;
									clearTimeout(debounceTimeout);
									debounceTimeout = setTimeout(function () {
										func.apply(context);
									}, delay);
								}

								searchInput.on('keyup', function () {
									var value = this.value;
									debounce(function () {
										api.search(value).draw();
									}, 300);
								});
							}
						});

						$(document).on('click', '.product-name', function () {
							var productId = $(this).closest('tr').data('id');
							let href = "AdminProductController?action=detail&productId=" + productId;
							location.href = href;
						});

						$('#btnApplyFilter').click(function (event) {
							reloadDataTable();
						});

						function reloadDataTable() {
							$('#datatable').DataTable().ajax.reload();
						}

						$('.input-number').on('input', function () {
							let value = $(this).val();
							value = value.replace(/\D/g, '');
							value = value.replace(/^0+/, '');
							$(this).val(value);
						});

						table.on('requestChild.dt', function (e, row) {
							row.child(format(row.data())).show();
						});

						table.on('click', 'td.dt-control', function (e) {
							let tr = e.target.closest('tr');
							let row = table.row(tr);

							if (row.child.isShown()) {
								// This row is already open - close it
								row.child.hide();
							} else {
								// Open this row
								row.child(formatDetailRow(row.data())).show();
							}
						});

						$('#optionExport .dropdown-item').on('click', function () {
							var exportType = $(this).text().toLowerCase();
							table.button('.buttons-' + exportType).trigger();
						});
					});

	$(".nav-link").removeClass("active");
	$("#products-nav-link").addClass("active");
</script>

</html>