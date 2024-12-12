<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>DataTable Example</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.6/css/dataTables.dataTables.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .adress-form-content form input, select {
            width: 30% !important;
            margin-right: 10px;
        }

        .dt-length {
            display: flex !important;
            align-items: center;
            flex-direction: row;
        }

        #order-table th {
            text-align: center;
            font-weight: bold;
        }

        #order-table td {
            text-align: center;
        }

        #order-table td p {
            margin: 0;
        }

        .btn-order-detail {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-order-detail:hover {
            background-color: #0056b3;
        }

        #order-table {
            border-collapse: collapse;
            width: 100%;
        }

        #order-table th,
        #order-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #order-table th {
            background-color: #679210;
        }

        #order-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<table id="order-table" class="dataTable" aria-describedby="order-table_info" style="width: 100%;">
    <thead>
    <tr>
        <th>Đơn hàng</th>
        <th>Ngày</th>
        <th>Địa chỉ</th>
        <th>Giá trị đơn hàng</th>
        <th>TT đơn hàng</th>
        <th>Xem chi tiết</th>
    </tr>
    </thead>
    <c:if test="${user ne null}">
        <c:forEach var="order" items="${user.getOrders()}">
            <tr>
                <td class="text-center">
                    <p>${order.getId()}</p>
                </td>
                <td class="text-center">
                    <p>${order.getDateCreated()}</p>
                </td>
                <td class="text-center">
                    <p>${order.getAddress()}</p>
                </td>
                <td class="text-center">
                        ${order.getTotalPrice()}
                </td>
                <td class="text-center" style="color: #e39b04">
                    <p>${order.getStatus().getDescription()}</p>
                </td>
                <td class="text-center">
                    <div class="btn-group">
                        <a target="_blank"
                           href="UserOrderController?action=detail&orderId=${order.id}">
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
    </c:if>
</table>
<script>
    let table = new DataTable('#order-table', {
            language: {
                url: "https://cdn.datatables.net/plug-ins/2.0.2/i18n/vi.json"
            },
        }
    );
</script>
</body>
</html>
