<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="section_coupon container mt-3">
    <div class="coupon-slider">
        <c:forEach items="${discounts}" var="item">
            <div class="card card-coupon ">
                <a class="btn-info coupon-detail" data-code="${item.code}" data-description="${item.description}" data-expdate="${item.expDate}" data-category="${item.categoryId}" data-condition="${item.condition}">i</a>
                <div class="card-title font-weight">
                    <strong>${item.code}</strong>
                    <div class="coupon-info">
                        <span class="">${item.description}</span>
                    </div>
                </div>
                <div class="coupon-footer">
                        <span class="small-text text-light-color">HSD:
                                ${item.expDate}</span>
                    <div class="coupon-copy" data-target="${item.code}">Sao chép</div>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
<script type="text/javascript">
    $(document).ready(function () {
        $('.coupon-slider').slick({
            infinite: true,
            slidesToShow: 4,
            slidesToScroll: 3
        });
        var categories = [
            <c:forEach items="${categories}" var="category" varStatus="loop">
            {
                id: ${category.id},
                name: "${category.name}",
                children: [
                    <c:forEach items="${category.children}" var="child" varStatus="childLoop">
                    {
                        id: ${child.id},
                        name: "${child.name}",
                        children: [

                        ]
                    }<c:if test="${!childLoop.last}">,</c:if>
                    </c:forEach>
                ]
            }<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];


        console.log(categories);

        $(".coupon-footer .coupon-copy").click(function () {
            let copyBtn = $(this);

            $(".coupon-footer .coupon-copy").not(copyBtn).text('Sao chép').removeClass('copied');

            let code = copyBtn.data("target");

            navigator.clipboard.writeText(code).then(() => {
                Swal.fire({
                    title: "Chúc mừng",
                    text: "Bạn đã lưu mã giảm giá " + code + " thành công",
                    icon: "success",
                    timer: 800,
                    showConfirmButton: false
                });

                copyBtn.text('Đã lưu').addClass('copied');
            }).catch(err => {
                Swal.fire({
                    title: "Lỗi",
                    text: "Không thể sao chép mã giảm giá. Vui lòng thử lại.",
                    icon: "error",
                    timer: 800,
                    showConfirmButton: false
                });
            });
        });

        $(".coupon-detail").click(function () {
            let code = $(this).data("code");
            let description = $(this).data("description");
            let expDate = $(this).data("expdate");
            let categoryId =$(this).data("category");
            let condition = $(this).data("condition");
            let categoryName = findCategoryName(categoryId);
            console.log(categoryName);
            Swal.fire({
                title: "Thông tin chi tiết mã: "+code,
                html: "<p>Điều kiện: "+ description+ ", áp dụng cho danh mục: " + categoryName+ " và đơn hàng từ " +  formatPrice(condition)+ " trở lên.</p><p>Hạn sử dụng: " +expDate +"</p>",
                icon: "info",
                confirmButtonText: "Đóng"
            });
        });
        function findCategoryName(categoryId) {
            function findCategoryInArray(categories, categoryId) {
                for (var i = 0; i < categories.length; i++) {
                    if (categories[i].id === categoryId) {
                        return categories[i].name;
                    } else if (categories[i].children && categories[i].children.length > 0) {
                        let foundName = findCategoryInArray(categories[i].children, categoryId);
                        if (foundName) {
                            return foundName;
                        }
                    }
                }
                return "Tất cả danh mục";
            }
            return findCategoryInArray(categories, categoryId);
        }

        function formatPrice(price) {
            return new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND'
            }).format(price);
        }
    });
</script>
