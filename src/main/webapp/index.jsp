<%@page import="java.util.Set" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="Model.ProductSale" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="Model.Wishlist" %>
<%@ page import="Model.Product" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Luong Thuc Viet</title>
    <link rel="stylesheet" type="text/css" href="styles/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="styles/base.css?version=1">
    <link rel="stylesheet" type="text/css" href="styles/slick.css?version=1"/>
    <link rel="stylesheet" type="text/css" href="styles/main.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css?version=1">
    <link rel="stylesheet" type="text/css" href="styles/news.css?version=1">
    <link rel="stylesheet" type="text/css" href="styles/nav.css?dsds">
    <link rel="stylesheet" type="text/css"
          href="styles/lightslider.css?version=1">

</head>
<%
    if (request.getAttribute("dsGao") == null) {
        response.sendRedirect("/Home");
    }
%>

<body>
<jsp:include page="Components/header.jsp"/>
<!--Slider-->
<jsp:include page="Components/Carousel.jsp"/>
<!--Danh mục sản phẩm-->
<div class="container" id="catalogs">
    <div class="group_title">
        <div class="title">
            <a class="title-name" href=""> Danh mục nổi bật </a>
        </div>
        <div class="button-control">
            <div class="btn-green btn-small disabled">
                <i class="fa-solid fa-chevron-left fa-chevron"></i>
            </div>
            <div class="btn-green btn-small">
                <i class="fa-solid fa-chevron-right fa-chevron"></i>
            </div>
        </div>
    </div>
    <div class="container product-catalog overflow-auto ">
        <div class="d-flex justify-content-between">
            <div class="catalog-item" data-target="Category?categoryId=1">
                <img src="images/catalogs/gao.png" alt="" class="catalog-image ">
                <p class="catalog-name text-primary-green">Gạo</p>
            </div>
            <div class="catalog-item" data-target="Category?categoryId=8">
                <img src="images/catalogs/ngu-coc.png" height="100px" alt=""
                     class="catalog-image ">
                <p class="catalog-name text-primary-green">Ngũ cốc</p>
            </div>
            <div class="catalog-item" data-target="Category?categoryId=7">
                <img src="images/catalogs/rau-cu.png" alt="" class="catalog-image">
                <p class="catalog-name text-primary-green">Củ quả</p>
            </div>
            <div class="catalog-item" data-target="Category?categoryId=9">
                <img src="images/catalogs/hat.png" alt="" class="catalog-image">
                <p class="catalog-name text-primary-green">Hạt</p>
            </div>
            <div class="catalog-item" data-target="Category?categoryId=11">
                <img src="images/catalogs/dau.png" alt="" class="catalog-image">
                <p class="catalog-name text-primary-green">Đậu</p>
            </div>
            <div class="catalog-item" data-target="Category?categoryId=10">
                <img src="images/catalogs/danhmuc_8.webp" alt=""
                     class="catalog-image">
                <p class="catalog-name text-primary-green">Sản phẩm khác</p>
            </div>
        </div>
    </div>
    <!-- khuyến mãi-->
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12" id="product-slider-7">
                    <div class="group_title">
                        <div class="title">
                            <a class="title-name" href=""> Khuyến mãi hấp dẫn </a> <span
                                class="title-content"> Chương trình khuyến mãi hấp dẫn
									đang chờ đợi bạn </span>
                        </div>
                        <div class="button-control">
                            <div class="btn-green btn-small btn-prev">
                                <i class="fa-solid fa-chevron-left fa-chevron"></i>
                            </div>
                            <div class="btn-green btn-small btn-next">
                                <i class="fa-solid fa-chevron-right fa-chevron"></i>
                            </div>
                        </div>
                    </div>
                    <div class="card-deck d-flex mr-child-20 product-container">
                        <c:forEach items="${productsSale}" var="item">
                            <div class="card radius-green product"
                                 data-product-id="${item.id}">
                                <span class="span-sale">${item.sale}</span> <span
                                    class="span-sale">Giảm 10%</span> <img class="card-img-top"
                                                                           src="${item.thumb}" alt="">
                                <div class="icons">
                                    <button href="#"
                                            class="fas fa-heart heartIcon ${wishlistId.contains(item.id) ? 'favorited' : ''}"></button>
                                    <button href="#" class="fas add_cart">
                                        <i class="fa-solid fa-cart-shopping"></i>
                                    </button>
                                    <button class="fas search_detail">
                                        <a> <i class="fa-solid fa-magnifying-glass"> </i></a>
                                    </button>
                                </div>
                                <div class="card-body">
                                    <h3 class="card-title">

                                        <a class="product_name"
                                           href="ProductDetail?productId=${item.id}">${item.name}</a>

                                    </h3>
                                    <div class="card-text">
                                        <div class="price-box">
												<span class="product_new_price"> <fmt:setLocale
                                                        value='vi-VN'/> <fmt:formatNumber
                                                        value="${item.newPrice}" type="currency"/>
												</span> <span class="price-compare product_unit_price"> <fmt:setLocale
                                                value='vi-VN'/> <fmt:formatNumber
                                                value="${item.unitPrice}" type="currency"/>
												</span>
                                        </div>
                                    </div>
                                    <div class="product-state">
                                        <div class="progress-bar small-progress-bar">
                                            <div class="fill bg-primary-green"
                                                 style="width: ${item.calculatePercentageSold()}%"></div>
                                        </div>
                                        <span class="product-sold">Đã bán ${item.quantitySold}
											</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="see-more">
                        <a href="" class="">Xem tất cả</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="Components/dichVu.jsp"></jsp:include>

    <!-- review sp -->
    <jsp:include page="Components/cuQua.jsp"></jsp:include>

    <jsp:include page="Components/banner1.jsp"></jsp:include>

    <jsp:include page="Components/gao.jsp"></jsp:include>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a href="" class="image-effect"> <img class="br-5"
                                                          src="images/product_test/Banner1.png" alt="">
                    </a>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="Components/hat.jsp"></jsp:include>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <a href="" class="image-effect"> <img class="br-5"
                                                          src="images/product_test/Banner2.png" alt="">
                    </a>
                </div>
            </div>
        </div>
    </section>
    <section>
        <div class="container">
            <div class="row">
                <jsp:include page="Components/dau.jsp"/>
                <jsp:include page="Components/nguCoc.jsp"/>
                <jsp:include page="Components/sanPhamKhac.jsp"/>
            </div>
        </div>
    </section>
</div>
</div>
<!-- Tin tức mới nhất           -->
<div class="container" id="news">
    <div class="row">
        <div class="col-md-12">
            <div class="group_title">
                <div class="title">
                    <a class="title-name" href="">Tin tức mới nhất</a> <span
                        class="title-content">Tin tức mới nhất được chúng tôi cập
							nhật thường xuyên</span>
                </div>
                <div class="button-control">
                    <div class="btn-green btn-small disabled">
                        <i class="fa-solid fa-chevron-left fa-chevron"></i>
                    </div>
                    <div class="btn-green btn-small">
                        <i class="fa-solid fa-chevron-right fa-chevron"></i>
                    </div>
                </div>
            </div>
            <div class="news-container card-deck d-flex mr-child-20">
                <div class="card">
                    <div
                            class="time-post text-primary-white fw-bold text-center bg-primary-green">
							<span>24 <br> Tháng 5
							</span>
                    </div>
                    <img src="images/news/new1.webp" alt="" class="card-img">
                    <div class="card-body box-content">
                        <h3 class="card-title">
                            <a href="">9 'siêu thực phẩm' cần có trong chế độ ăn uống
                                của người cao tuổi</a>
                        </h3>
                        <p class="card-text">Người cao tuổi có sự hấp thụ và chuyển
                            hóa các chất kém hơn so với người trẻ tuổi, vì thế chế độ ăn hợp
                            ý là một việc rất...</p>
                        <a href="" class="viewmore">Đọc tiếp</a>
                    </div>
                </div>
                <div class="card">
                    <div
                            class="time-post text-primary-white fw-bold text-center bg-primary-green">
							<span>24 <br> Tháng 5
							</span>
                    </div>
                    <img src="images/news/new1.webp" alt="" class="card-img">
                    <div class="card-body box-content">
                        <h3 class="card-title">
                            <a href="">9 'siêu thực phẩm' cần có trong chế độ ăn uống
                                của người cao tuổi</a>
                        </h3>
                        <p class="card-text">Người cao tuổi có sự hấp thụ và chuyển
                            hóa các chất kém hơn so với người trẻ tuổi, vì thế chế độ ăn hợp
                            ý là một việc rất...</p>
                        <a href="" class="viewmore">Đọc tiếp</a>
                    </div>
                </div>
                <div class="card">
                    <div
                            class="time-post text-primary-white fw-bold text-center bg-primary-green">
							<span>24 <br> Tháng 5
							</span>
                    </div>
                    <img src="images/news/new1.webp" alt="" class="card-img">
                    <div class="card-body box-content">
                        <h3 class="card-title">
                            <a href="">9 'siêu thực phẩm' cần có trong chế độ ăn uống
                                của người cao tuổi</a>
                        </h3>
                        <p class="card-text">Người cao tuổi có sự hấp thụ và chuyển
                            hóa các chất kém hơn so với người trẻ tuổi, vì thế chế độ ăn hợp
                            ý là một việc rất...</p>
                        <a href="" class="viewmore">Đọc tiếp</a>
                    </div>
                </div>
                <div class="card">
                    <div
                            class="time-post text-primary-white fw-bold text-center bg-primary-green">
							<span>24 <br> Tháng 5
							</span>
                    </div>
                    <img src="images/news/new1.webp" alt="" class="card-img">
                    <div class="card-body box-content">
                        <h3 class="card-title">
                            <a href="">9 'siêu thực phẩm' cần có trong chế độ ăn uống
                                của người cao tuổi</a>
                        </h3>
                        <p class="card-text">Người cao tuổi có sự hấp thụ và chuyển
                            hóa các chất kém hơn so với người trẻ tuổi, vì thế chế độ ăn hợp
                            ý là một việc rất...</p>
                        <a href="" class="viewmore">Đọc tiếp</a>
                    </div>
                </div>
            </div>
            <div class="d-grid gap-2 col-2 mx-auto py-3">
                <button class="btn btn-green" type="button">Xem tất cả</button>
            </div>
        </div>
    </div>
</div>
</div>
<!--    footer-->
<footer id="footer">
    <jsp:include page="Components/footer.jsp"/>
</footer>
<a href="#"
   class="back-to-top d-flex align-items-center justify-content-center"><i
        class="fa-solid fa-arrow-up"></i></a>
</body>

<script type="text/javascript" src="javascripts/lightslider.js"></script>
<script type="text/javascript" src="javascripts/jquery-3.7.1.js"></script>
<script type="text/javascript" src="javascripts/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="javascripts/shopping-cart.js?"></script>
<script type="text/javascript" src="javascripts/main.js?j"></script>
<script>

    <%String error = request.getAttribute("error") != null ? request.getAttribute("error") + " " : " ";%>
    let error = '<%=error%>';
    if (error != ' ') {
        notify("Thông báo", "Danh mục này hiện tại đã ngưng hoạt động",
            "warning");
    }
    $(".catalog-item").click(function () {
        let href = $(this).data("target");
        location.href = href;
    })

    document.getElementById('btn-card').addEventListener(
        'mouseover',
        function () {
            document.querySelector('.top-cart-content').classList
                .add('active');
        });

    document.querySelector('.top-cart-content').addEventListener(
        'mouseover',
        function () {
            document.querySelector('.top-cart-content').classList
                .add('active');
        });
    document.querySelector('.top-cart-content').addEventListener(
        'mouseout',
        function () {
            document.querySelector('.top-cart-content').classList
                .remove('active');
        });

    document.addEventListener('DOMContentLoaded', function () {
        var backToTopButton = document.querySelector('.back-to-top');

        // Thêm sự kiện cuộn tranG
        window.addEventListener('scroll', function () {
            if (window.scrollY > 300) {
                // Hiển thị nút khi cuộn xuống
                backToTopButton.style.visibility = 'visible';
            } else {
                // Ẩn nút khi cuộn lên đầu
                backToTopButton.style.visibility = 'hidden';
            }
        });

        // Thêm sự kiện click để cuộn về đầu trang
        backToTopButton.addEventListener('click', function () {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    });

    $(document).ready(function () {

    });

    function redirectToPage(page) {

    }

    $(document)
        .ready(
            function () {

                // Mảng chứa các placeholder khác nhau
                var placeholders = ["Tìm kiếm theo tên sản phẩm",
                    "Tìm kiếm theo danh mục",
                    "Tìm kiếm theo thương hiệu"];
                var currentIndex = 0;
                var currentPlaceholder = "";
                var placeholderIndex = 0;

                // Hàm cập nhật placeholder với từng chữ
                function updatePlaceholder() {
                    if (placeholderIndex <= placeholders[currentIndex].length) {
                        currentPlaceholder = placeholders[currentIndex]
                            .substring(0, placeholderIndex);
                        $("#searchInput").attr("placeholder",
                            currentPlaceholder);
                        placeholderIndex++;
                    } else {
                        // Khi hoàn thành, đặt lại index và chuyển sang placeholder tiếp theo
                        placeholderIndex = 0;
                        currentIndex = (currentIndex + 1)
                            % placeholders.length;
                    }
                }

                // Thực hiện cập nhật mỗi giây
                setInterval(updatePlaceholder, 60);
            });
</script>
</html>