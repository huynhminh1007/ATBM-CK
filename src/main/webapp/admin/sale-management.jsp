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
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">

    <style>
        .product-name:hover {
            color: var(--primary-green);
            cursor: pointer;
        }

        .product-name {
            white-space: normal;
            word-wrap: break-word;
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
            margin-left: 16px;
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

        .ui-autocomplete {
            z-index: 9999999 !important;
            max-height: 200px;
            overflow-y: auto;
            overflow-x: hidden;
        }

        .ui-autocomplete li {
            padding: 5px;
            cursor: pointer;
        }

        .dt-center {
            text-align: center !important;
        }

        .highlight {
            background: var(--primary-green) !important;
            color: white;
        }

        .step-hide {
            display: none;
        }

        .dropdown-item {
            cursor: pointer;
        }

        .scroll-container {
            scroll-snap-type: y mandatory;
            overflow-y: scroll;
            height: 100vh;
            scrollbar-width: none;
            -ms-overflow-style: none;
        }
        .section-item {
            padding-top: 10px;
            scroll-snap-align: start;
            box-sizing: border-box;
            height: 100vh;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row">
    <jsp:include page="left-menu.jsp"></jsp:include>

    <div class="scroll-container col-10 pt-3">
        <div class="container-fluid">
            <div class="row w-100">
                <div>
                    <div class="section-item col-12">
                        <div class="bg-white">
                            <div class="sub-title">
                                <h4>Quản lý sản phẩm giảm giá</h4>
                            </div>
                            <div class="table-container mt-3">
                                <div class="mb-3">
                                    <div class="table-control d-flex align-items-center">
                                        <button type="button" id="btn-filter" class="btn btn-info"
                                                data-toggle="modal" data-target="#filterModal">
                                            <i class="fa-solid fa-filter"></i>Bộ lọc
                                        </button>

                                        <div class="ms-auto text-end btn-container-dropdown">
                                            <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Xuất File
                                            </button>
                                            <div id="optionExportDisplay" class="dropdown-menu export-menu">
                                                <span class="dropdown-item">Copy</span>
                                                <span class="dropdown-item">CSV</span>
                                                <span class="dropdown-item">Excel</span>
                                                <span class="dropdown-item">PDF</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table id="datatable-products-display" class="row-border hover nowrap w-100">
                                    <thead>
                                    <tr>
                                        <th></th>
                                        <th class="text-center">Mã sản phẩm</th>
                                        <th style="min-width: 10vw">Tên sản phẩm</th>
                                        <th class="text-center">Hình ảnh</th>
                                        <th class="text-right">Giảm giá</th>
                                        <th class="text-right">Giá gốc</th>
                                        <th class="text-right">Giá mới</th>
                                        <th class="text-right">Số lượng</th>
                                        <th class="text-right">Đã bán</th>
                                        <th class="text-center">Ngày bắt đầu</th>
                                        <th class="text-center">Ngày kết thúc</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="section-item col-12">
                        <div class="bg-white">
                            <div class="sub-title">
                                <h4>Thêm sản phẩm giảm giá</h4>
                            </div>
                            <div class="table-container mt-3">
                                <div class="mb-3">
                                    <div class="table-control d-flex align-items-center">
                                        <button id="btnImport" class="btn btn-secondary"
                                                data-toggle="modal" data-target="#importModal">Thêm sản phẩm
                                        </button>
                                        <div class="btn-control btn-container-dropdown">
                                            <button type="button" class="btn btn-secondary dropdown-toggle"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Nhập từ File
                                            </button>
                                            <div class="dropdown-menu export-menu">
                                                <span class="dropdown-item">CSV</span>
                                                <span class="dropdown-item"
                                                      data-toggle="modal" data-target="#importFileModal">Excel</span>
                                            </div>
                                        </div>
                                        <div class="ms-auto text-end btn-container-dropdown">
                                            <button type="button" class="btn btn-warning dropdown-toggle"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                                <table id="datatable-products" class="cell-border hover nowrap w-100">
                                    <thead>
                                    <tr>
                                        <th class="text-center">Mã sản phẩm</th>
                                        <th style="min-width: 10vw">Tên sản phẩm</th>
                                        <th class="text-right">Giảm giá</th>
                                        <th class="text-right">Giá gốc</th>
                                        <th class="text-right">Giá mới</th>
                                        <th class="text-right">Số lượng</th>
                                        <th class="text-center">Ngày bắt đầu</th>
                                        <th class="text-center">Ngày kết thúc</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="importModal" tabindex="-1" role="dialog"
                 aria-labelledby="importModalCenterTitle"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <form autocomplete="off" id="formImport">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="filterModalLongTitle">Thêm giảm giá sản phẩm</h5>
                                <i data-dismiss="modal" class="close fa-solid fa-xmark"></i>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <div class="form-group row align-items-center ui-widget">
                                        <label class="col-4">Mã sản phẩm</label>
                                        <div class="col-8">
                                            <input class="form-control input-number" id="productIdInput" type="text"
                                                   inputmode="numeric" pattern="[0-9]*" required>
                                        </div>
                                    </div>

                                    <div class="form-group row align-items-center">
                                        <label class="col-4">Tên sản phẩm</label>
                                        <div class="col-8">
                                            <input class="form-control" id="productNameInput" type="text"
                                                   required>
                                        </div>
                                    </div>

                                    <div class="form-group row align-items-center">
                                        <label class="col-4">Giảm giá</label>
                                        <div class="col-8">
                                            <div class="input-group">
                                                <input class="form-control input-price" id="saleInput"
                                                       type="text" inputmode="numeric" pattern="[0-9,\.]*" required>

                                                <div class="input-group-prepend">
                                                    <select class="form-control" id="saleTypeInput">
                                                        <option selected value="đ">đ</option>
                                                        <option value="%">%</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row align-items-center">
                                        <label class="col-4" for="productUnitPrice">Giá gốc</label>
                                        <div class="col-8">
                                            <div class="input-group">
                                                <input class="form-control input-price" id="productUnitPrice"
                                                       type="text" inputmode="numeric" pattern="[0-9,\.]*" required disabled>

                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">đ</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row align-items-center">
                                        <label class="col-4">Giá mới</label>
                                        <div class="col-8">
                                            <div class="input-group">
                                                <input class="form-control input-price" id="productNewPrice"
                                                       type="text" inputmode="numeric" pattern="[0-9,\.]*" required disabled>

                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">đ</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group row align-items-center">
                                        <div class="col">
                                            <label class="mb-2" for="productSaleQuantityInput">Số lượng giảm giá</label>
                                            <input class="form-control input-price" id="productSaleQuantityInput"
                                                   type="text" inputmode="numeric" pattern="[0-9,\.]*" required>
                                        </div>

                                        <div class="col">
                                            <label class="mb-2" for="productUnitInStock">Tồn kho</label>
                                            <input class="form-control input-number" id="productUnitInStock"
                                                   type="text" inputmode="numeric" pattern="[0-9]*" required disabled>
                                        </div>
                                    </div>

                                    <div class="form-group row align-items-center">
                                        <label class="col-4">Ngày bắt đầu</label>
                                        <div class="col-8">
                                            <input class="form-control" id="startDateInput"
                                                   type="datetime-local" required>
                                        </div>
                                    </div>

                                    <div class="form-group row align-items-center">
                                        <label class="col-4">Ngày kết thúc</label>
                                        <div class="col-8">
                                            <input class="form-control" id="endDateInput"
                                                   type="datetime-local" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                <button id="btnAdd" class="btn btn-success" type="submit">Thêm</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="modal fade" id="importFileModal" tabindex="-1" role="dialog"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <form id="formImportFile">
                            <div class="step js-steps-content" id="step1">
                                <div class="modal-header">
                                    <h5 class="modal-title">Chọn File</h5>
                                    <i data-dismiss="modal" class="close fa-solid fa-xmark"></i>
                                </div>

                                <div class="modal-body">
                                    <div class="form-group">
                                        <input id="fileImport" type="file" class="form-control" data-show="step2">
                                        <div class="invalid-feedback">
                                            Tệp không hợp lệ. Vui lòng chọn tệp Excel có định dạng .xls hoặc .xlsx.
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                </div>
                            </div>

                            <div class="step js-steps-content step-hide" id="step2">
                                <div class="modal-header">
                                    <h5 class="modal-title">Chọn cột dữ liệu tương ứng</h5>
                                    <i data-dismiss="modal" class="close fa-solid fa-xmark"></i>
                                </div>

                                <div class="modal-body">
                                    <div class="form-group">
                                        <h5 class="mb-4" style="font-size: 16px; text-align: center; font-weight: normal;
                                        color: var(--primary-green)"
                                        >Chọn cột Excel mà bạn muốn sử dụng dữ liệu cho từng trường.</h5>
                                        <div id="selectCol">
                                            <div class="form-group row">
                                                <label class="col">Mã sản phẩm</label>
                                                <div class="col">
                                                    <select class="form-select"></select>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col">Tên sản phẩm</label>
                                                <div class="col">
                                                    <select class="form-select"></select>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col">Giảm giá</label>
                                                <div class="col">
                                                    <select class="form-select"></select>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col">Giá gốc</label>
                                                <div class="col">
                                                    <select class="form-select"></select>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col">Giá mới</label>
                                                <div class="col">
                                                    <select class="form-select"></select>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col">Số lượng</label>
                                                <div class="col">
                                                    <select class="form-select"></select>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col">Ngày bắt đầu</label>
                                                <div class="col">
                                                    <select class="form-select"></select>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col">Ngày kết thúc</label>
                                                <div class="col">
                                                    <select class="form-select"></select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                    <button id="btnImportFile" type="button" class="btn btn-success">Nhập</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="filterModal" tabindex="-1" role="dialog"
                 aria-labelledby="filterModalCenterTitle"
                 aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Bộ lọc sản phẩm</h5>
                            <i data-dismiss="modal" class="close fa-solid fa-xmark"></i>
                        </div>
                        <div class="modal-body">
                            <form id="form-filter">
                                <div class="form-group row align-items-center">
                                    <div class="col">
                                        <label class="mb-2">Ngày bắt đầu</label>
                                        <div class="input-group">
                                            <input class="form-control" id="startDateFilter"
                                                   type="date">
                                        </div>
                                    </div>

                                    <div class="col">
                                        <label class="mb-2">Ngày kết thúc</label>
                                        <div class="input-group">
                                            <input class="form-control" id="endDateFilter"
                                                   type="date">
                                        </div>
                                    </div>
                                </div>

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
                                    <label class="col" for="categoriesList">Loại giảm giá</label>
                                    <div class="col">
                                        <select id="saleTypeFilter" class="form-select">
                                            <option value="%">%</option>
                                            <option value="đ">đ</option>
                                            <option selected value="-1">Tất cả</option>
                                        </select>
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

        <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
            <div id="liveToast" class="toast hide" role="alert" aria-live="assertive" aria-atomic="true" data-delay="3000">
                <div class="toast-header" style="background-color: var(--primary-green); color: white">
                    <i class="fa-solid fa-bell me-2"></i>
                    <strong class="me-auto">Thông báo</strong>
                    <small>1s ago</small>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <span class="toast-content"></span>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../javascripts/popper.min.js"></script>
<script type="text/javascript" src="../javascripts/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script type="text/javascript" src="../Datatables-V2/bootstrap.min.js"></script>
<script type="text/javascript" src="../Datatables-V2/datatables.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
<script type="text/javascript">
    function formatNumber(number, unit) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, unit);
    }

    function formatCurrency(amount) {
        return new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(amount);
    }

    function getHeaders(sheet) {
        var headers = [];
        var range = XLSX.utils.decode_range(sheet['!ref']);
        var firstRow = range.s.r; // Lấy hàng đầu tiên

        for (var col = range.s.c; col <= range.e.c; ++col) {
            var cell = sheet[XLSX.utils.encode_cell({r: firstRow, c: col})];
            var hdr = "UNKNOWN " + col; // Nếu không có tiêu đề, đặt tên là UNKNOWN
            if (cell && cell.t) hdr = XLSX.utils.format_cell(cell);
            headers.push(hdr);
        }
        return headers;
    }

    function populateSelect(headers) {
        var $selectColDiv = $('#selectCol');

        $selectColDiv.find('.form-group').each(function (index) {
            var $formGroup = $(this);
            var $label = $formGroup.find('label');
            var columnName = $label.text().trim();

            var $select = $formGroup.find('select');
            var colIndex = index + 1;

            $select.empty();

            var foundHeader = headers.find(function (header) {
                return header.toLowerCase() === columnName.toLowerCase();
            });

            headers.forEach(function (header, headerIndex) {
                var option = $('<option>', {
                    value: header,
                    text: header,
                    'data-header-index': headerIndex
                });

                if (foundHeader && header === foundHeader) {
                    option.prop('selected', true);
                } else if (!foundHeader && headers.indexOf(header) === colIndex - 1) {
                    option.prop('selected', true);
                }

                $select.append(option);
            });
        });
    }

    function formatDetailRow(data) {
        return (
            '<dl>' +
            formatSubDetailOnRow('Danh mục', data.categories.name) +
            '<br>' +
            formatSubDetailOnRow('Tồn kho', formatNumber(data.unitsInStock, ',')) +
            '<br>' +
            formatSubDetailOnRow('Đã bán', parseInt(data.quantitySold / data.quantity * 100) + '%') +
            '</dl>'
        );
    }

    function formatSubDetailOnRow(label, data) {
        return '<b>' + label + ': </b>' + data;
    }

    $(document)
        .ready(
            function () {
                $('#productSaleQuantityInput').on('input', function () {
                    var input = $(this);
                    var value = parseInt(input.val().replace(/\D/g, ''));
                    var unitsInStock = parseInt($('#productUnitInStock').val().replace(/\D/g, ''));

                    if(value > unitsInStock) {
                        input.val('');
                        input.addClass('is-invalid');
                    }
                    else {
                        input.removeClass('is-invalid');
                    }
                });

                var productIdInput = $('#productIdInput');

                productIdInput.autocomplete({
                    source: function (request, response) {
                        $.ajax({
                            url: "quan-ly-giam-gia",
                            type: 'POST',
                            data: {
                                action: 'search',
                                request: 'find-id-list',
                                id: request.term
                            },
                            success: function (resp) {
                                var data = resp.data;
                                if (data != null) {
                                    response(data.map(num => String(num)));
                                }
                            }
                        });
                    },
                    minLength: 1,
                    select: function (event, ui) {
                        $(this).val(ui.item.value);
                        $(this).blur();
                        return false;
                    }
                });

                productIdInput.change(function (change) {
                    var id = $(this).val();
                    if (id !== '') {
                        $.ajax({
                            url: 'quan-ly-giam-gia',
                            type: 'POST',
                            data: {
                                action: 'search',
                                request: 'find-product',
                                id: id
                            },
                            success: function (resp) {
                                var product = resp.data;

                                if (product !== null) {
                                    $('#productNameInput').val(product.name);
                                    $('#productUnitPrice').val(formatNumber(product.unitPrice, '.'));
                                    $('#productUnitInStock').val(formatNumber(product.unitsInStock, ','));

                                    $('#productCostPriceInput').trigger('input');
                                    $('#productWeightInput').trigger('input');
                                } else {
                                    $('#formImport')[0].reset();
                                }
                            }
                        });
                    } else {
                        $('#formImport')[0].reset();
                    }
                });

                let controlBar = document.createElement('div');

                controlBar.innerHTML = `
                            <div class="align-items-center">
                            <label>Tìm kiếm sản phẩm</label>
                            <input style="padding-left: 5px; margin-left: 10px" id="search" class="search form-control" type="search" name="name" placeholder="Tìm kiếm...">
                            </div>
                            `;

                let controlBarDisplay = document.createElement('div');

                controlBarDisplay.innerHTML = `
                            <div class="align-items-center">
                            <label>Tìm kiếm sản phẩm</label>
                            <input style="padding-left: 5px; margin-left: 10px" id="search" class="search form-control" type="search" name="name" placeholder="Tìm kiếm...">
                            </div>
                            `;

                let btnSave = document.createElement('div');
                btnSave.innerHTML = '<button id="btnSave" class="btn btn-success my-2">Xác nhận' + '</button>';

                $('#btnApplyFilter').click(function (event) {
                    $('#datatable-products-display').DataTable().ajax.reload();
                });

                let tableDisplay = $('#datatable-products-display').DataTable({
                    serverSide: true,
                    pageLength: 25,
                    scrollX: true,
                    scrollCollapse: true,
                    scrollY: '55vh',
                    order: [],
                    ajax: {
                        url: 'quan-ly-giam-gia',
                        type: 'POST',
                        data: function (d) {
                            NProgress.start();
                            d.action = 'get';
                            d.categoryId = $('#categoriesList').val();
                            d.saleType = $('#saleTypeFilter').val();
                            d.startDate = $('#startDateFilter').val();
                            d.endDate = $('#endDateFilter').val();
                            NProgress.done();
                        }
                    },
                    rowCallback: function (row, data) {
                        $(row).attr('data-id', data.id);
                    },
                    columnDefs: [
                        {targets: 1, name: 'id'},
                        {targets: 2, name: 'name'},
                        {targets: 3, name: 'thumb', orderable: false},
                        {targets: 4, name: 'sale'},
                        {targets: 5, name: 'unitPrice'},
                        {targets: 6, name: 'newPrice'},
                        {targets: 7, name: 'quantity'},
                        {targets: 8, name: 'quantitySold'},
                        {targets: 9, name: 'startDate'},
                        {targets: 10, name: 'endDate'},
                        {
                            targets: [4, 5, 6, 7, 8],
                            className: 'dt-right'
                        },
                        {
                            targets: [1, 9, 10],
                            className: 'dt-center'
                        },
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
                        {data: 'sale'},
                        {
                            data: 'unitPrice',
                            render: function (data, type, row) {
                                return formatCurrency(data)
                            }
                        },
                        {
                            data: 'newPrice',
                            render: function (data, type, row) {
                                return formatCurrency(data)
                            }
                        },
                        {
                            data: 'quantity',
                            render: function (data, type, row) {
                                return formatNumber(data, ',');
                            }
                        },
                        {
                            data: 'quantitySold',
                            render: function (data, type, row) {
                                return formatNumber(data, ',');
                            }
                        },
                        {
                            data: 'startDateDiscount',
                            render: function (data, type, row) {
                                return moment(data, 'MMM D, YYYY, h:mm:ss A').format('DD-MM-YYYY HH:mm');
                            }
                        },
                        {
                            data: 'endDateDiscount',
                            render: function (data, type, row) {
                                return moment(data, 'MMM D, YYYY, h:mm:ss A').format('DD-MM-YYYY HH:mm');
                            }
                        }
                    ],
                    layout: {
                        topStart: controlBarDisplay,
                        topEnd: 'pageLength',
                    },
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            title: 'Danh sách sản phẩm giảm giá ' + new Date().toISOString().slice(0, 10),
                            exportOptions: {
                                columns: function (idx, data, node) {
                                    return idx !== 0 && idx !== 3;
                                }
                            },
                        },
                        {
                            extend: 'excelHtml5',
                            filename: 'Danh sách sản phẩm giảm giá ' + new Date().toISOString().slice(0, 10),
                            title: '',
                            exportOptions: {
                                columns: function (idx, data, node) {
                                    return idx !== 0 && idx !== 3;
                                }
                            },
                        },
                        {
                            extend: 'csvHtml5',
                            title: 'Danh sách sản phẩm giảm giá ' + new Date().toISOString().slice(0, 10),
                            exportOptions: {
                                columns: function (idx, data, node) {
                                    return idx !== 0 && idx !== 3;
                                }
                            },
                        },
                        {
                            extend: 'pdfHtml5',
                            title: 'Danh sách sản phẩm giảm giá ' + new Date().toISOString().slice(0, 10),
                            exportOptions: {
                                columns: function (idx, data, node) {
                                    return idx !== 0 && idx !== 3;
                                }
                            },
                        }
                    ],
                    language: {
                        "sProcessing": "Đang xử lý...",
                        "sLengthMenu": "Hiển thị _MENU_ mục",
                        "sZeroRecords": "Không tìm thấy dữ liệu",
                        "sInfo": "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
                        "sInfoEmpty": "Hiển thị 0 đến 0 của 0 mục",
                        "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                        "emptyTable": "Vui lòng thêm dữ liệu",
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
                        }
                    },
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

                tableDisplay.on('requestChild.dt', function (e, row) {
                    row.child(format(row.data())).show();
                });

                tableDisplay.on('click', 'td.dt-control', function (e) {
                    let tr = e.target.closest('tr');
                    let row = tableDisplay.row(tr);

                    if (row.child.isShown()) {
                        // This row is already open - close it
                        row.child.hide();
                    } else {
                        // Open this row
                        row.child(formatDetailRow(row.data())).show();
                    }
                });

                let table = $('#datatable-products').DataTable({
                    pageLength: 25,
                    scrollX: true,
                    scrollCollapse: true,
                    scrollY: '55vh',
                    order: [],
                    columnDefs: [
                        {targets: 0, name: 'id', type: 'num'},
                        {targets: 1, name: 'name'},
                        {targets: 2, name: 'sale'},
                        {targets: 3, name: 'unitPrice', type: 'num'},
                        {targets: 4, name: 'newPrice', type: 'num'},
                        {targets: 5, name: 'quantity', type: 'num'},
                        {targets: 6, name: 'startDate'},
                        {targets: 7, name: 'endDate'},
                        {
                            targets: [2, 3, 4, 5],
                            className: 'dt-right'
                        },
                        {
                            targets: [0, 6, 7],
                            className: 'dt-center'
                        },
                    ],
                    columns: [
                        {data: 'id'},
                        {
                            data: 'name',
                            render: function (data, type, row) {
                                return '<span class="product-name">' + data + '</span>';
                            }
                        },
                        {data: 'sale'},
                        {
                            data: 'unitPrice',
                            render: function (data, type, row) {
                                return formatCurrency(data)
                            }
                        },
                        {
                            data: 'newPrice',
                            render: function (data, type, row) {
                                return formatCurrency(data)
                            }
                        },
                        {
                            data: 'quantity',
                            render: function (data, type, row) {
                                return formatNumber(data, ',');
                            }
                        },
                        {
                            data: 'startDateDiscount',
                            render: function (data, type, row) {
                                return moment(data, 'DD-MM-YYYY HH:mm').format('DD-MM-YYYY HH:mm');
                            }
                        },
                        {
                            data: 'endDateDiscount',
                            render: function (data, type, row) {
                                return moment(data, 'DD-MM-YYYY HH:mm').format('DD-MM-YYYY HH:mm');
                            }
                        }
                    ],
                    layout: {
                        topStart: controlBar,
                        topEnd: 'pageLength',
                        bottomStart: null,
                        bottomEnd: btnSave,
                        bottom2Start: 'info',
                        bottom2End: 'paging'
                    },
                    buttons: [
                        {
                            extend: 'copyHtml5',
                            title: 'Danh sách thêm sản phẩm giảm giá ' + new Date().toISOString().slice(0, 10),
                        },
                        {
                            extend: 'excelHtml5',
                            filename: 'Danh sách thêm sản phẩm giảm giá ' + new Date().toISOString().slice(0, 10),
                            title: '',
                        },
                        {
                            extend: 'csvHtml5',
                            title: 'Danh sách thêm sản phẩm giảm giá ' + new Date().toISOString().slice(0, 10),
                        },
                        {
                            extend: 'pdfHtml5',
                            title: 'Danh sách thêm sản phẩm giảm giá ' + new Date().toISOString().slice(0, 10),
                        }
                    ],
                    language: {
                        "sProcessing": "Đang xử lý...",
                        "sLengthMenu": "Hiển thị _MENU_ mục",
                        "sZeroRecords": "Không tìm thấy dữ liệu",
                        "sInfo": "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
                        "sInfoEmpty": "Hiển thị 0 đến 0 của 0 mục",
                        "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                        "emptyTable": "Vui lòng thêm dữ liệu",
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
                        }
                    },
                });

                $(document).on('click', '.product-name', function () {
                    var productId = $(this).closest('tr').data('id');
                    let href = "AdminProductController?action=detail&productId=" + productId;
                    location.href = href;
                });

                $('#saleInput').on('input', function () {
                    var type = $('#saleTypeInput').val();
                    var sale = $('#saleInput').val().replace(/\D/g, '');
                    var unitPrice = $('#productUnitPrice').val().replace(/\D/g, '');
                    var newPrice;

                    if(type == 'đ') {
                       newPrice = unitPrice - sale;
                    }
                    else {
                        newPrice = unitPrice - unitPrice * sale / 100;
                    }

                    $('#productNewPrice').val(formatNumber(newPrice, '.'));
                });

                $('#saleTypeInput').on('change', function () {
                    $('#saleInput').trigger('input');
                });

                $('.input-number').on('input', function () {
                    let value = $(this).val();
                    value = value.replace(/\D/g, '');
                    value = value.replace(/^0+/, '');
                    $(this).val(value);
                });

                $('.input-price').on('input', function () {
                    let value = $(this).val();
                    value = value.replace(/\D/g, '');

                    if (value == "") {
                        $(this).val(value);
                        return;
                    }

                    $(this).val(parseInt(value).toLocaleString("vi-VN"));
                });

                $('#formImport').submit(function (e) {
                    e.preventDefault();

                    let id = $('#productIdInput').val().trim();
                    let name = $('#productNameInput').val();
                    let sale = $('#saleInput').val();
                    let saleType = $('#saleTypeInput').val();
                    let unitPrice = $('#productUnitPrice').val().replace(/\D/g, '');
                    let newPrice = $('#productNewPrice').val().replace(/\D/g, '');
                    let quantity = $('#productSaleQuantityInput').val().replace(/\D/g, '');
                    let startDate = moment($('#startDateInput').val()).format('DD-MM-YYYY HH:mm');
                    let endDate = moment($('#endDateInput').val()).format('DD-MM-YYYY HH:mm');

                    let product = {
                        id: id,
                        name: name,
                        sale: sale + saleType,
                        unitPrice: unitPrice,
                        newPrice: newPrice,
                        quantity: quantity,
                        startDateDiscount: startDate,
                        endDateDiscount: endDate
                    };

                    var rowNode = table.row.add(product).draw()
                        .node();

                    $(rowNode).addClass('highlight');

                    setTimeout(function () {
                        $(rowNode).removeClass('highlight');
                    }, 2000);

                    $('#importModal').modal('hide');
                    $('#formImport')[0].reset();
                });

                $(document).on('click', '#btnSave', function () {
                    var data = table.rows().data().toArray();

                    if(data.length > 0) {
                        $.ajax({
                            url: "quan-ly-giam-gia",
                            type: 'POST',
                            data: {
                                action: 'import',
                                data: JSON.stringify(data)
                            },
                            success: function (resp) {
                                var numAffected = resp.affected;
                                var length = data.length;
                                var msg;

                                if(numAffected === length) {
                                    msg = 'Đã thêm giảm giá thành công cho ' + numAffected + ' sản phẩm';
                                }
                                else {
                                    if(numAffected > 0) {
                                        msg = 'Đã thêm giảm giá thành công cho ' + numAffected + ' sản phẩm.<br>' +
                                            (length - numAffected) + ' dữ liệu giảm giá đã tồn tại';

                                    }
                                    else {
                                        msg = 'Thêm giảm giá thất bại. Dữ liệu đã tồn tại';
                                    }
                                }

                                $('.toast-content').html(msg);
                                $('.toast').toast('show');

                                table.clear().draw();
                            },
                            error: function (error) {

                            }
                        });
                    }
                });

                $('#fileImport').on('change', function () {
                    var fileInput = $(this);
                    var filePath = fileInput.val();
                    var allowedExtensions = /(\.xls|\.xlsx)$/i;

                    if (allowedExtensions.exec(filePath)) {
                        var file = fileInput[0].files[0];
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            var data = new Uint8Array(e.target.result);
                            var workbook = XLSX.read(data, {type: 'array'});
                            var firstSheet = workbook.Sheets[workbook.SheetNames[0]];
                            var headers = getHeaders(firstSheet);

                            var range = XLSX.utils.decode_range(firstSheet['!ref']);
                            var numRecords = range.e.r;

                            $('#btnImportFile').text('Nhập ' + numRecords + ' records');

                            populateSelect(headers);

                            $('#step1').addClass('step-hide');
                            $('#step2').removeClass('step-hide');
                        };

                        reader.readAsArrayBuffer(file);
                    } else {
                        fileInput.addClass('is-invalid');
                        fileInput.val('');
                    }
                });

                $('#btnImportFile').on('click', function () {
                    NProgress.start();

                    var selectedColumns = [];
                    $('#selectCol select').each(function () {
                        var columnIndex = $(this).find('option:selected').data('header-index');
                        selectedColumns.push(columnIndex);
                    });

                    var fileInput = $('#fileImport')[0].files[0];
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        var data = new Uint8Array(e.target.result);
                        var workbook = XLSX.read(data, {type: 'array'});
                        var firstSheet = workbook.Sheets[workbook.SheetNames[0]];
                        var excelData = XLSX.utils.sheet_to_json(firstSheet, {header: 1});

                        excelData.shift();

                        var importedData = excelData.map(function (row) {
                            var saleValue = row[selectedColumns[2]];

                            return {
                                id: row[selectedColumns[0]],
                                name: row[selectedColumns[1]],
                                sale: parseFloat(saleValue) <= 1? parseFloat(saleValue) * 100 + '%' : saleValue,
                                unitPrice: String(row[selectedColumns[3]]).replace(/\D/g, ''),
                                newPrice: String(row[selectedColumns[4]]).replace(/\D/g, ''),
                                quantity: String(row[selectedColumns[5]]).replace(/\D/g, ''),
                                startDateDiscount: row[selectedColumns[6]],
                                endDateDiscount: row[selectedColumns[7]]
                            };
                        });

                        var rowNodes = table.clear().rows.add(importedData).draw().nodes();

                        $(rowNodes).addClass('highlight');
                        setTimeout(function () {
                            $(rowNodes).removeClass('highlight');
                        }, 2000);

                        $('#importFileModal').modal('hide');
                        NProgress.done();
                    };

                    reader.readAsArrayBuffer(fileInput);
                });

                $('#importFileModal').on('hidden.bs.modal', function () {
                    $('.js-steps-content').each(function () {
                        if ($(this).attr('id') === 'step1') {
                            $(this).removeClass('step-hide');
                        } else {
                            $(this).addClass('step-hide');
                        }
                    });
                    $('#formImportFile')[0].reset();
                });

                $('#optionExport .dropdown-item').on('click', function () {
                    var exportType = $(this).text().toLowerCase();
                    table.button('.buttons-' + exportType).trigger();
                });

                $('#optionExportDisplay .dropdown-item').on('click', function () {
                    var exportType = $(this).text().toLowerCase();
                    tableDisplay.button('.buttons-' + exportType).trigger();
                });
            });

    $(".nav-link").removeClass("active");
    $("#product-sales-nav-link").addClass("active");
</script>
</html>