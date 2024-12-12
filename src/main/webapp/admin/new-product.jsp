<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

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
    <link rel="stylesheet" href="styles/admin.css">
    <link
            href="https://cdn.jsdelivr.net/npm/froala-editor@latest/css/froala_editor.pkgd.min.css"
            rel="stylesheet" type="text/css"/>

    <style>
        .label {
            font-size: 14px;
            font-weight: bold;
            color: var(--primary-green);
        }

        .form-control {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid"></div>
<div class="row">
    <jsp:include page="left-menu.jsp"></jsp:include>
    <div class="col-9 pt-3">
        <div
                class="container title d-flex justify-content-between bg-white rounded">
            <h5>Thêm sản phẩm mới</h5>
            <span class="date">Thứ 6, ngày 19/07/2024</span>
        </div>
        <form class="px-5" action="AdminProductController" method="post"
              enctype="multipart/form-data">
            <input type="hidden" name="action" value="${requestScope.action}">
            <input type="hidden" name="product_id" value="${product.id}">
            <div class="row">
                <div class="col-6">
                    <label class="label" for="product-id">Mã sản phẩm</label>
                    <div class="input-group">

                        <input class="form-control" id="product-id" type="text" placeholder="Mã sản phẩm"
                               disabled value=${product.id}>
                        <div class="input-group-append" style="margin-top: 10px;">
                            <div class="input-group-text">#</div>
                        </div>
                    </div>
                    <label class="label" for="product-name">Tên sản phẩm</label>
                    <input class="form-control" id="product-name" name="product_name" type="text"
                           placeholder="Tên sản phẩm" required value='${product.name}'>
                    <label class="label" for="product-sell-price">Giá bán</label>
                    <input type="number" class="form-control" id="product-sell-price"
                           name="product_sell_price" placeholder="Giá bán" required
                           value=${product.unitPrice}>
                    <label class="label" for="product-buy-price">Giá nhập</label>
                    <input type="number"
                           class="form-control" id="product-buy-price" name="product_buy_price"
                           placeholder="Giá nhập" required value=${product.costPrice}>
                </div>
                <div class="col-6">
                    <label class="label" for="product-quantity">Số lượng</label>
                    <input class="form-control" id="product-quantity" type="number" name="product_quantity"
                           type="text" placeholder="Số lượng" required
                           value=${product.unitsInStock}>
                    <label class="label" for="product-weight">Trọng lượng</label>
                    <input
                            class="form-control" type="number" id="product-weight" name="product_weight"
                            type="text" placeholder="Trọng lượng" required
                            value=${product.weight}>
                    <label class="label" for="danhMuc">Danh mục</label>
                    <select name="danhMuc"
                            id="danhMuc" class="form-control" required>
                        <option hidden value="">Danh mục</option>
                        <c:forEach var="item" items="${categories}">
                            <c:if test="${not empty item.children }">
                                <c:forEach items="${item.children}" var="child">
                                    <c:if test="${product.categories.getId() eq child.id}">
                                        <option value=${child.id } selected>${child.name}</option>
                                    </c:if>
                                    <c:if test="${product.categories.getId() ne child.id}">
                                        <option value=${child.id}>${child.name}</option>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty item.children }">
                                <c:if test="${product.categories.getId() eq item.id}">
                                    <option value=${item.id } selected>${item.name}</option>
                                </c:if>
                                <c:if test="${product.categories.getId() ne item.id}">
                                    <option value=${item.id}>${item.name}</option>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-12">
                    <div class="file-upload-wrapper">
                        <input type="file" class="file-upload" accept="image/*" multiple
                               onchange="loadImages(this)" name="images">
                        <div class="text-center">
                            <h6>Chọn các hình ảnh hiện thị cho sản phảm</h6>
                            <i class="fa-solid fa-upload fs-2"></i>
                        </div>
                    </div>
                    <div class="images-wraper d-flex">
                        <c:forEach items="${product.images}" var="item">
                            <div id=${item.id}>
                                <img src='../${item.path}' class="product-image">
                                <div style="display: flex; justify-content: center;">
                                    <button class="btn btn-danger btn-sm remove-btn" type="button"
                                            data-target=${item.id}>
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="product-description">
                        <h4 class="text-primary-green">Miêu tả sản phẩm</h4>
                        <textarea name="blog" class="wys">${product.blog.getContent()}</textarea>
                    </div>
                    <input type="hidden" name="blogId" value='${product.blog.getId()}'>
                    <div class="container d-flex justify-content-center p-2">
                        <button class="btn btn-warning me-2">Quay lại</button>
                        <button class="btn btn-success">Lưu sản phẩm</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<style type="text/css">
    .file-upload {
        position: absolute;
        opacity: 0;
        width: 100%;
        height: 100%;
    }

    .images-wraper {
        margin-top: 20px;
        width: 100%;
        padding: 20px;
        /*    height: 300px;*/
    }

    .file-upload-wrapper:hover {
        background-color: #679210;
        color: white;
        border: 3px dashed rgba(0, 0, 0, 0.2);
    }

    .file-upload-wrapper {
        margin-top: 10px;
        color: #679210;
        position: relative;
        width: 200px;
        height: 100px;
        border: 3px dashed rgba(0, 0, 0, 0.5);
        border-radius: 10px;
        transition: 0.4s ease;
    }

    .product-image {
        width: 200px;
        height: 200px;
        margin-right: 10px;
        display: block;
    }

    input, select {
        margin-top: 10px;
    }
</style>
<script src="javascripts/chart.js"></script>
<script type="text/javascript" src="../javascripts/jquery-3.7.1.js"></script>
<script type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/froala-editor@latest/js/froala_editor.pkgd.min.js"></script>
<script type="text/javascript">
    $(".nav-link").removeClass("active");
    $("#products-nav-link").addClass("active");
    $(".images-wraper").on("click", ".remove-btn", function () {
        let imageId = $(this).data("target");
        console.log(imageId);
        $("#" + imageId).remove();
    })

    var editor = new FroalaEditor('.wys', {
        // Disable image uploading
        imageUpload: false,

        // Disable drag and drop image upload
        imagePaste: false,

        // Disable HTML clean up
        htmlRemoveTags: []
    });

    // Listen for paste event
    editor.events.on('paste.after', function (e, editor, data) {
        // Access the clipboard data
        var clipboardData = data.clipboardData;

        // Check if clipboard contains HTML content
        if (clipboardData && clipboardData.getData) {
            // Get the HTML content from the clipboard
            var pastedHtml = clipboardData.getData('text/html');

            // Insert the HTML content into the editor
            editor.html.insert(pastedHtml);

            // Prevent default paste behavior
            e.preventDefault();
        }
    });

    /* 	new FroalaEditor(".wys"); */
    function loadImages(input) {
        console.log("load iamge");
        if (input.files.length < 6) {
            for (var i = 0; i < input.files.length; i++) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var image = $("<img>").attr({
                        "src": e.target.result,
                        "class": 'product-image'
                    });
                    var removeBtn = $("<button>").addClass(
                        'btn btn-danger btn-sm remove-btn');
                    removeBtn.attr("type", "button");
                    removeBtn.attr("data-target", i);
                    removeBtn.append($("<i>").addClass("fa-solid fa-trash"));
                    var btns = $("<div>").css({
                        "width": "100%",
                        "display": "flex",
                        "justifyContent": "center"
                    });
                    btns.append(removeBtn);
                    imageContainer = $("<div>");
                    imageContainer.attr("id", i);
                    imageContainer.append(image).append(btns);
                    var imageWraper = $(".images-wraper");
                    if (imageWraper.children("div").length < 6) {
                        imageWraper.append(imageContainer);
                        console.log(imageWraper.children("div").length);
                    } else {
                        alert("Không thể upload quá nhiều hình")
                    }
                }
                reader.readAsDataURL(input.files[i]);
            }
        } else {
            alert("Khong the up load nhieu hon 6 hinh anh")
        }
    }
</script>

</html>