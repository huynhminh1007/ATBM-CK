<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html></html>

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

    .status {
        font-weight: bold;
        padding: 5px 10px;
        width: 250px;
        border-radius: 5px;
        color: #fff;
    }

    .status-container {
        display: flex;
        align-items: center;
        padding: 30px 0;
        justify-content: space-between;
    }

    .form-check-inline {
        position: relative;
        margin: 0 15px;
    }

    .form-check-inline::after {
        content: '';
        position: absolute;
        top: 50%;
        left: 110%;
        width: 100px;
        height: 3px;
        background-color: darkseagreen;
        transform: translateY(-50%);
    }

    .form-check-inline:last-child::after {
        display: none;
    }

    .form-check-input {
        transform: scale(1.5);
    }

    .form-check-label {
        font-weight: bold;
        margin-left: 5px;
    }

    /* Specific Status Styles */
    .status-4 {
        background-color: #007bff; /* Bootstrap primary color */
    }

    .status-5 {
        background-color: #fd7e14; /* Bootstrap orange color */
    }

    .status-6 {
        background-color: #28a745; /* Bootstrap green color */
    }

    .status-7 {
        background-color: #dc3545; /* Bootstrap red color */
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
            <h5>Quản lý đơn hàng</h5>
            <span class="date">Thứ 6, ngày 19/07/2024</span>
        </div>
        <div class="container-fluid">
            <div class="row w-100">
                <div class="col-12">
                    <div class=" mt-3 bg-white">
                        <div class="sub-title">
                            <h4>Chi tiết đơn hàng</h4>
                        </div>
                        <c:set var="order" scope="request" value="${requestScope.order}"/>
                        <div class="order-detail mt-3 row">
                            <div class="col-7">
                                <div>
                                    <h5>ID đơn hàng: ${order.id}</h5>
                                </div>
                                <div>
                                    <h5>Tên khách hàng: ${order.user.getFullName()}
                                        <a
                                                href="UserController?action=detail&userId=${order.user.id}"
                                                class="btn btn-secondary btn-sm me-1 btn-order-detail"
                                                data-target=${item.id}>
                                            <i class="fa-solid fa-circle-info"></i>
                                        </a>
                                    </h5>
                                </div>
                                <div>
                                    <h5>Phương thức thanh toán: ${order.paymentMethod}</h5>
                                </div>
                            </div>
                            <div class="col-5">
                                <div>
                                    <h5>
                                        Phí vận chuyển:
                                        <fmt:formatNumber type="currency"
                                                          value="${order.shippingFee}"/>
                                    </h5>
                                </div>
                                <div class="d-flex ">
                                    <h5>Phiếu giảm giá:</h5>
                                    <c:choose>
                                        <c:when test="${not empty requestScope.discount}">
                                            <h5>${requestScope.discount.code}</h5>
                                            <h5>-
                                                <fmt:formatNumber type="currency"
                                                                  value="${requestScope.discount.amount}"/>
                                            </h5>
                                        </c:when>
                                        <c:otherwise>
                                            <h5>Không có </h5>
                                        </c:otherwise>
                                    </c:choose></div>
                                <div>
                                    <h5>
                                        Tổng đơn hàng:
                                        <strong>
                                            <fmt:formatNumber type="currency" value="${order.totalPrice}"/>
                                        </strong>
                                    </h5>
                                </div>
                            </div>
                            <div>
                                <div class="d-flex ">
                                    <h5 class="me-5">Trạng thái: </h5>
                                    <h5 class="status status-${order.status.id}">${order.status.description}</h5>
                                </div>
                                <h5><strong>
                                    Cập nhập trạng thái
                                </strong></h5>
                                <%--                                <form action="OrderController" id="statusForm">--%>
                                <%--                                    <input type="hidden" name="action" value="put"> <input--%>
                                <%--                                        type="hidden" name="orderId" value="${order.id}"> <select--%>
                                <%--                                        class="form-select" name="statusId">--%>
                                <%--                                    <option id="status6" value="6">Đã hoàn thành</option>--%>
                                <%--                                    <option id="status7" value="7">Đã hủy</option>--%>
                                <%--                                    <option id="status4" value="4">Đang xử lý</option>--%>
                                <%--                                    <option id="status5" value="5">Đang vận chuyển</option>--%>
                                <%--                                </select>--%>
                                <%--                                </form>--%>
                            </div>
                        </div>

                        <div class="container  status-container">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="statusOptions"
                                <c:if test="${order.status.id == 4}">
                                       checked
                                </c:if>
                                       id="statusProcessing" value="4">
                                <label class=" form-check-label" for="statusProcessing">Đang xử lý</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="statusOptions"
                                <c:if test="${order.status.id == 5}">
                                       checked
                                </c:if>
                                       id="statusDelivering" value="5">
                                <label class="form-check-label" for="statusDelivering">Đang vận chuyển</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="statusOptions"
                                <c:if test="${order.status.id == 6}">
                                       checked
                                </c:if>
                                       id="statusCompleted" value="6">
                                <label class="form-check-label" for="statusCompleted">Đã hoàn thành</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="statusOptions"
                                <c:if test="${order.status.id == 7}">
                                       checked
                                </c:if>
                                       id="statusCanceled" value="7">
                                <label class="form-check-label" for="statusCanceled">Đã hủy</label>
                            </div>
                        </div>
                        <table class="table" id="orders">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Đơn giá</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${order.details}" var="item" varStatus="i">
                                <tr>
                                    <td>${i.count}</td>
                                    <td>${item.product.getName()}</td>
                                    <td><img src='../${item.product.getThumb()}'
                                             width="100px" height="150px"></td>
                                    <td>${item.quantity}</td>
                                    <td><fmt:formatNumber type="currency"
                                                          value="${item.price}"/></td>
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
<script type="text/javascript" src="../javascripts/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="../javascripts/main.js"></script>
<script type="text/javascript">
    $(document).ready(() => {

        let re = ' ${requestScope.result}';
        if (re != ' ') {
            showNotification();
        }
        $('input[type="radio"]').on('change', function () {
            let targetStatus = $(this).val();
            Swal.fire({
                title: "Cảnh báo",
                text: "Bạn có thật sự muốn cập nhập đơn hàng?",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Cập nhập",
                cancelButtonText: "Hủy"
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location = "OrderController?action=put&statusId=" + targetStatus + "&orderId=" +
                    ${requestScope.order.id}
                } else {
                    let currentRadio = $("input[type=radio][value=" + ${requestScope.order.status.id} +"]");
                    console.log(currentRadio);
                    currentRadio.prop("checked", true);
                }
            });
        });

        function disable(statusList) {
            $.each(statusList, function (index, status) {
                $("input[type=radio][value=" + status + "]").attr("disabled", true);
            });
        }

        setStatusConstrains();

        function setStatusConstrains() {
            let status = ${requestScope.order.status.id};
            switch (status) {
                case 4:
                    disable([6]);
                    break;
                case 5:
                    disable([4, 7]);
                    break;
                case 6:
                    disable([4, 5, 7]);
                    break;
                case 7:
                    disable([4, 5, 6]);
                    break;
            }
        }

        function showNotification() {
            notify2("Thông báo", re, "success", 1000);
        }


        $(".nav-link").removeClass("active");
        $("#orders-nav-link").addClass("active");
    })
</script>