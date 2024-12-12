<%@page import="Model.User" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <title>Star Rating JavaScript</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<% User user = session.getAttribute("user") == null ? null : (User) session.getAttribute("user");
    boolean
            isLogin = user == null ? false : true; %>

<body>
<div class="review-list">
    <c:forEach var="item" items="${productDetail.reviews}" varStatus="status">
        <div class="review mb-3 p-2" id=review${status.count}>
            <div class="d-flex justify-content-between">
                <h6>${item.userName}</h6>
                <c:if test="${item.userId == user.getId()}">
                    <div class="edit" data-stars='${item.rating}' data-content='${item.content}'
                         data-order='${status.count}'>
                        <i class="fas fa-edit"></i>
                    </div>
                </c:if>
            </div>
            <div class="stars" data-stars=${item.rating}></div>
            <div class="content">${item.content}</div>
            <div class="date">${item.dateCreatedString}</div>
        </div>
    </c:forEach>
</div>
<div class="container-review">
    <div></div>
    <div class="content" style="text-align: center;">
        <p style="font-size: 30px;">
            <b>Đánh giá sản phẩm này</b>
        </p>
        <p>Nếu bạn đã trải nghiệm sản phẩm tại Lương Thực Việt, hãy chia
            sẻ đánh giá của mình để giúp cộng đồng chọn lựa sản phẩm tốt nhất!</p>
    </div>
    <div class="post">
        <div class="text-primary-green">
            <h4>Cảm ơn bạn đã đánh giá</h4>
        </div>

    </div>
    <div class="star-rating" id="rating-box">
        <input type="radio" name="rate" id="rate-5" value=5> <label for="rate-5"
                                                                    class="fas fa-star"></label> <input type="radio"
                                                                                                        name="rate"
                                                                                                        id="rate-4"
                                                                                                        value=4> <label
            for="rate-4" class="fas fa-star"></label> <input type="radio" name="rate" id="rate-3"
                                                             value=3> <label for="rate-3" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-2" value=2> <label for="rate-2"
                                                                    class="fas fa-star"></label> <input type="radio"
                                                                                                        name="rate"
                                                                                                        id="rate-1"
                                                                                                        value=1> <label
            for="rate-1" class="fas fa-star"></label>
        <form id="review-form">
            <div class="textarea">
                <textarea cols="30" placeholder="Miêu tả nhận xét của bạn về sản phẩm"></textarea>
            </div>
            <div class="btn-review">
                <button type="button">Đánh Giá</button>
            </div>
            <input type="hidden" id="action" value="post">
            <input type="hidden" id="order" value="">
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        function ajaxReview() {
            if (<%= isLogin %>)
            {
                let contents = $(".textarea textarea").val();
                let rating = $(".star-rating input[type='radio']:checked").val();
                let action = $("#action").val();
                let review = {
                    "rating": rating,
                    "contents": contents,
                    "productId": ${ productDetail.id },
                    "action": action
                }
                $.ajax({
                    type: "post",
                    url: "/ReviewController",
                    data: review,
                    success: function (response) {
                        notify("Chúc mừng", "Bạn đã nhận xét thành công!", "success");
                        const post = $(".post");
                        const widget = $(".star-rating");
                        widget.hide();
                        post.show();
                        let updated = action == "put" ? true : false;
                        renderNewReview(response, updated);
                    },
                    error: function (xhr, status, error) {
                        notify("Thông báo", xhr.responseText, "error");
                    }
                });
            }
        else
            {
                notify("Thông báo?", "Bạn phải đăng nhập để để lại nhận xét", "warning");
            }
        }

        function renderNewReview(response, updated) {
            let stars = response.rating;
            let content = response.content;
            let userName = response.userName;

            let order = $("#order").val();
            if (updated) {
                let reviewItem = $("#review" + order);
                reviewItem.find(".stars").data("stars", stars);
                $(".edit").data("stars", stars);
                reviewItem.find(".content").text(content);
            } else {
                let reviewListContainer = $(".review-list");
                order = reviewListContainer.children(".review").length + 1;
                let reviewitem = $("<div>").addClass("review mb-3 p-2");
                reviewitem.attr("id", "review" + order);
                let nameContainer = $("<div>").addClass("d-flex justify-content-between");
                let editIcon = $("<div>").addClass("edit");
                editIcon.attr("data-stars", stars);
                editIcon.attr("data-content", content);
                editIcon.attr("data-order", order);
                editIcon.append($("<i>").addClass("fas fa-edit"));
                editIcon.click(editReview);
                let userNameElement = $("<h6>").text(userName);
                nameContainer.append(userNameElement);
                nameContainer.append(editIcon);
                let starsElement = $("<div>").addClass("stars").data("stars", stars);
                let contentElement = $("<div>").addClass("content").text(content);
                reviewitem.append(nameContainer);
                reviewitem.append(starsElement);
                reviewitem.append(contentElement);
                reviewListContainer.append(reviewitem);
            }
            renderStars()
        }

        function editReview() {
            $("#rating-box").show();
            $(".post").hide();
            const widget = $("#review-form");
            let content = $(this).data("content");
            let rating = $(this).data("stars");
            let order = $(this).data("order");
            widget.find("textarea").text(content);
            let starElement = $(".star-rating input[type=radio][value=" + rating + "]");
            starElement.prop("checked", true);
            widget.show();
            $('html, body').animate({
                scrollTop: $("#rating-box").offset().top - 400
            }, 500);
            $("#order").val(order);
            $("#action").val("put");
        }

        $(".edit").click(editReview);

        // bat ajax goi them review
        $(".btn-review button").click(function () {
            ajaxReview();
        })
        //render stars
        renderStars();

        function createStarElement(number) {
            let re = $("<div>");
            for (let i = 0; i < 5; i++) {
                let starElement;
                if (i < number) {
                    starElement = $("<span>").addClass("fa fa-star checked");
                } else {
                    starElement = $("<span>").addClass("fa fa-star ");
                }
                re.append(starElement);
            }
            return re;
        }

        function renderStars() {
            let starsContainer = $(".stars");
            starsContainer.empty();
            starsContainer.each(function () {
                $(this).append(createStarElement($(this).data("stars")));
            })
        }

    });
</script>

</html>