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
          href='../styles/bootstrap.css'>
    <link rel="stylesheet" type="text/css" href="../styles/base.css">
    <link rel="stylesheet" type="text/css" href="../styles/main.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="styles/admin.css?aa">
    <script src="javascripts/chart.js"></script>
</head>
<style>
    .btn-order-detail i {
        color: #fFffff;
    }

    /* General Styles for Status */
    .status {
        font-weight: bold;
        padding: 5px 10px;
        width: 180px;
        border-radius: 5px;
        display: inline-block;
        color: #fff;
        text-align: center;
    }

    /* Specific Status Styles */
    .status-processing {
        background-color: #007bff; /* Bootstrap primary color */
    }

    .status-delivering {
        background-color: #fd7e14; /* Bootstrap orange color */
    }

    .status-completed {
        background-color: #28a745; /* Bootstrap green color */
    }

    .status-canceled {
        background-color: #dc3545; /* Bootstrap red color */
    }

</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row">
    <jsp:include page="left-menu.jsp"></jsp:include>
    <div class="col-10 pt-3">
        <div
                class="container title d-flex justify-content-between bg-white rounded">
            <h5>Quản lý đơn hàng</h5>
            <span class="date">Thứ 6, ngày 19/07/2024</span>
        </div>
        <div class="container-fluid">
            <div class="row w-100">
                <div class="col-12">
                    <div class=" mt-3 bg-white">
                        <div class="sub-title">
                            <h4>Danh sách đơn hàng</h4>
                        </div>
                        <h5 class="mt-3">Bộ lọc</h5>
                        <div class="container d-flex p-2">
                            <div class="form-check form-switch me-5">
                                <input class="form-check-input" type="checkbox"
                                       value="4"
                                       <c:if test="${requestScope.statusCode == 4}">checked</c:if>
                                       id="status-4">
                                <label class="form-check-label"
                                       for="status-4">Đang xử lý
                                </label>
                            </div>
                            <div class="form-check form-switch me-5">
                                <input class="form-check-input"
                                       type="checkbox"
                                       <c:if test="${requestScope.statusCode == 5}">checked</c:if>
                                       value="5"
                                       id="status-5">
                                <label class="form-check-label"
                                       for="status-5">
                                    Đang vận chuyển
                                </label>
                            </div>
                            <div class="form-check form-switch me-5">
                                <input class="form-check-input"
                                       type="checkbox"
                                       <c:if test="${requestScope.statusCode == 6}">checked</c:if>
                                       value="6"
                                       id="status-6">
                                <label class="form-check-label"
                                       for="status-6">
                                    Đã hoàn thành
                                </label>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input"
                                       type="checkbox"
                                       <c:if test="${requestScope.statusCode == 7}">checked</c:if>
                                       value="7"
                                       id="status-7">
                                <label class="form-check-label"
                                       for="status-7">
                                    Đã hủy
                                </label>
                            </div>
                        </div>
                        <table class="cell-border hover nowrap w-100" id="order-table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Tổng tiền</th>
                                <th scope="col">Trạng thái</th>
                                <th scope="col">Ngày tạo đơn hàng</th>
                                <th scope="col">Chức năng</th>
                            </tr>
                            </thead>
                            <tbody id="${item.id}">
                            <c:forEach items="${orders}" var="item">
                                <tr>
                                    <td>${item.id}</td>
                                    <td>${item.user.fullName}</td>
                                    <td><fmt:formatNumber value="${item.totalPrice}"
                                                          type="currency"/></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.status.id == 4}">
                                                <span class="status status-processing">${item.status.description}</span>
                                            </c:when>
                                            <c:when test="${item.status.id == 5}">
                                                <span class="status status-delivering">${item.status.description}</span>
                                            </c:when>
                                            <c:when test="${item.status.id == 6}">
                                                <span class="status status-completed">${item.status.description}</span>
                                            </c:when>
                                            <c:when test="${item.status.id == 7}">
                                                <span class="status status-canceled">${item.status.description}</span>
                                            </c:when>
                                            <c:otherwise>
                                                ${item.status.description}
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${item.getDateCreated()}</td>
                                    <td class="text-center">
                                        <div class="btn-group">
                                            <a href="OrderController?action=detail&orderId=${item.id}">
                                                <button
                                                        class="btn btn-secondary btn-sm me-1 btn-order-detail"
                                                        data-target=${item.id}>
                                                    <i class="fa-solid fa-circle-info"></i>
                                                </button>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script src="../DataTables/datatables.min.js"></script>
<script src="../javascripts/bootstrap.min.js"></script>
<link href="../DataTables/datatables.min.css" rel="stylesheet">
<script type="text/javascript">
    $(".nav-link").removeClass("active");
    $("#orders-nav-link").addClass("active");
    $('input[type="checkbox"]').on('change', function () {
        let filterStatus = $(this).val();
        window.location = "OrderController?action=getFilter&status=" + filterStatus;
    });
    let table = new DataTable("#order-table", {
        columns: [
            {data: '#'},
            {data: "Tên khách hàng"},
            {data: 'Tổng tiền'},
            {
                data: 'Trạng thái',
            },
            {data: 'Ngày tạo đơn hàng'},
            {data: 'Chức năng'},
        ],
        language: {
            url: "https://cdn.datatables.net/plug-ins/2.0.2/i18n/vi.json"
        },
        order: [[4, 'desc']]
    });
</script>

</html>