<%@ page import="Model.security.Key" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

        #key-table th {
            text-align: center;
            font-weight: bold;
        }

        #key-table td {
            text-align: center;
        }

        #key-table td p {
            margin: 0;
        }

        .btn-key-detail {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-key-detail:hover {
            background-color: #0056b3;
        }

        #key-table {
            border-collapse: collapse;
            width: 100%;
        }

        #key-table th,
        #key-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #key-table th {
            background-color: #679210;
        }

        #key-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .text-ellipsis {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 200px; /* Chiều rộng tối đa */
            display: inline-block;
        }
    </style>
</head>
<body>

<table id="key-table" class="dataTable" aria-describedby="key-table_info" style="width: 100%;">
    <thead>
    <tr>
        <th>#</th>
        <th>Khóa</th>
        <th>Thuật toán</th>
        <th>Ngày Bắt Đầu</th>
        <th>Ngày Kết Thúc</th>
        <th>Trạng Thái</th>
    </tr>
    </thead>
    <c:if test="${not empty keys}">
        <c:forEach var="key" items="${keys}" varStatus="status">
            <tr>
                <td class="text-center">
                    <p>${key.id}</p>
                </td>
                <td class="text-center">
                    <p class="text-ellipsis" title="${key.key}">${key.key}</p>
                </td>

                <td class="text-center">
                    <p>${key.algorithm}</p>
                </td>
                <td class="text-center">
                    <p>${key.beginDate}</p>
                </td>
                <td class="text-center">
                    <p>${key.updateDate}</p>
                </td>
                <td class="text-center" style="color: ${key.isActive ? 'green' : 'red'};">
                    <p>${key.isActive ? 'Active' : 'Inactive'}</p>
                </td>

            <%--                <td class="text-center" style="color:<c:if test="${key.isActive}==true">'green'</c:if> <c:if test="${key.isActive}==false">'red'</c:if>;">--%>
<%--                    <p><c:if test="${key.isActive}==true">'Active'</c:if> <c:if test="${key.isActive}==false">'Inactive'</c:if></p>--%>
<%--                </td>--%>
            </tr>
        </c:forEach>
    </c:if>
    <c:if test="${empty keys}">
        <tr>
            <td colspan="6" class="text-center">
                <p>Không có Key nào được tìm thấy.</p>
            </td>
        </tr>
    </c:if>
    </tbody>
</table>
<script>
    let table = new DataTable('#key-table', {
        paging: true, // Bật phân trang
        searching: true, // Bật tìm kiếm
        ordering: true, // Bật sắp xếp
        info: true, // Hiển thị thông tin
            language: {
                url: "https://cdn.datatables.net/plug-ins/2.0.2/i18n/vi.json"
            },
        }
    );
</script>
</body>
</html>
