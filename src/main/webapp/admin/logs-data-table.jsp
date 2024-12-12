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
</head>
<style>

    .btn-order-detail i {
        color: #fFffff;
    }

    .level {
        margin: 10px !important;
        padding: 20px !important;
    }

    .info {
        background-color: #3dd5f3 !important;
        padding: 10px !important;
        border-radius: 5px !important;
    }

    .danger {
        background-color: red;
        padding: 10px !important;
        border-radius: 5px !important;
    }

    .warning {
        background-color: orange;
        padding: 10px !important;
        border-radius: 5px !important;
    }

    .alertz {
        background-color: yellow;
        padding: 10px !important;
        border-radius: 5px !important;
    }

</style>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row">
    <jsp:include page="left-menu.jsp"></jsp:include>
    <div class="col-10 pt-3 ">
        <div
                class="container title d-flex justify-content-between bg-white rounded">
            <h5>Hệ thống</h5>
            <span class="date">Thứ 6, ngày 19/07/2024</span>
        </div>
        <div class="container-fluid ">
            <div class="row w-100">
                <div class="col-12">
                    <div class="mt-3 bg-white">
                        <div class="sub-title">
                            <h4>Bảng ghi log</h4>
                        </div>
                        <h5 class="mt-3">Bộ lọc</h5>
                        <div class="container d-flex justify-content-between p-2">
                            <div class="form-check form-switch">
                                <input class="form-check-input" type="checkbox"
                                       value="1"
                                       id="info-level">
                                <label class="form-check-label"
                                       for="info-level">INFO
                                </label>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input"
                                       type="checkbox"
                                       value="2"
                                       id="alert-level">
                                <label class="form-check-label"
                                       for="alert-level">
                                    ALERT
                                </label>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input"
                                       id="warning-level"
                                       value="3"
                                       type="checkbox">
                                <label class="form-check-label"
                                       for="warning-level">
                                    Warning
                                </label>
                            </div>
                            <div class="form-check form-switch">
                                <input class="form-check-input"
                                       id="danger-level"
                                       value="4"
                                       type="checkbox">
                                <label class="form-check-label"
                                       for="danger-level">
                                    Danger
                                </label>
                            </div>
                        </div>
                        <table class="cell-border hover nowrap w-100" id="log-table">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Địa chỉ IP</th>
                                <th scope="col">URL</th>
                                <th scope="col">LEVEL</th>
                                <th scope="col">Thời gian</th>
                                <th scope="col">Chức năng</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade " id="log-detail-modal-lg" tabindex="-1" role="dialog" aria-labelledby="logDetailModal"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-body container p-3">
                <h2 class="text-center">Chi tiết log </h2>
                <h4>Địa chỉ IP: <span id="modal-ipAddress"></span></h4>
                <h4>Quốc gia : <span id="modal-nation"></span></h4>
                <h4>URL=: <span id="modal-url"></span></h4>
                <h4>LEVEL: <span id="modal-level"></span></h4>
                <h4>Giá trị trước : <span id="modal-currentValue"> </span></h4>
                <h4>Giá trị sau: <span id="modal-afterValue"></span></h4>
                <h4>Thời gian : <span id="modal-dateCreated"></span></h4>
                <h4>Mô tả chi tiết: <span id="modal-description"></span></h4>
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
    $("#logs-nav-link").addClass("active");
    //data table
    let table = new DataTable("#log-table", {
        columns: [
            {data: 'id'},
            {data: "Địa chỉ IP"},
            {data: 'URL'},
            {data: 'LEVEL'},
            {data: 'Thời gian'},
            {data: 'Chức năng'},
        ],
        language: {
            url: "https://cdn.datatables.net/plug-ins/2.0.2/i18n/vi.json"
        },
        order: [[4, 'desc']]
    });
    //handle filter level
    $('input[type="checkbox"]').on('change', function () {
        let selectedCheckboxes = [];
        $('input[type="checkbox"]:checked').each(function () {
            selectedCheckboxes.push($(this).val());
        });
        filterLogs(selectedCheckboxes)
        // You can do other operations with the selectedCheckboxes array here
    });
    filterLogs([])

    function filterLogs(levels) {
        $.ajax({
                type: "GET",
                url: "/admin/LogController",
                data: {
                    action: "getFilter",
                    levels: levels.join(","),
                },
                success: (response) => {
                    renderTable(response);
                },
                error: () => {
                }
            }
        )
    }

    function renderTable(logs) {
        table.clear();
        table.draw();
        logs.forEach(log => {
            let levelClass;
            switch (log.level) {
                case 'INFO':
                    levelClass = 'info';
                    break;
                case 'ALERT':
                    levelClass = 'alertz';
                    break;
                case 'WARNING':
                    levelClass = 'warning';
                    break;
                case 'DANGER':
                    levelClass = 'danger';
                    break;
            }
            table.row.add({
                id: log.id,
                'Địa chỉ IP': log.ipAddress,
                URL: log.url,
                'LEVEL': `<span class="level \${levelClass}">\${log.level}</span>`,
                'Thời gian': log.dateCreated,
                'Chức năng': `
                    <div class="btn-group">
                        <button class="btn btn-success btn-sm detail-btn me-1" type="button" data-toggle="modal" data-target="#log-detail-modal-lg" data-log='\${JSON.stringify(log)}'>
                            <i class="fa-solid fa-circle-info"></i>
                        </button>
                        <button type="button" class="btn btn-warning btn-sm remove-btn" data-target="\${log.id}">
                            <i class="fa-solid fa-trash"></i>
                        </button>
                    </div>
                `
            }).draw();
        });
    }

    function renderModal(log) {
        $("#modal-ipAddress").text(log.ipAddress);
        $("#modal-nation").text(log.nation);
        $("#modal-url").text(log.url);
        $("#modal-level").text(log.level);
        $("#modal-currentValue").text(log.currentValue);
        $("#modal-afterValue").text(log.afterValue);
        $("#modal-dateCreated").text(log.dateCreated);
        $("#modal-description").text(log.description);
    }

    $(document).on('click', '.detail-btn', function () {
        let log = $(this).data("log");
        renderModal(log);
    });

    $(document).on('click', '.remove-btn', function () {
        let logId = $(this).data("target");
        let row = $(this).closest('tr');
        removeLog(logId, row);
    });

    function removeLog(logId, row) {
        $.ajax({
            type: "post",
            url: "/admin/LogController",
            data: {
                logId: logId,
                action: "remove"
            },
            success: function (response) {
                table.row(row).remove().draw();

            },
            error: function (xhr, status, error) {
                console.log("loi")
            }
        });
    }
</script>

</html>
