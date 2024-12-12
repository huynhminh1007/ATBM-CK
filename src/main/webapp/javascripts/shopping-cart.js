let emptyCartMessDiv = $(".empty-message");
let cartTotalInfoDiv = $(".cart-total-info");
let emptyCart = $(".empty-cart");
let cartFooter = $(".cart-footer");
$(document).on('click', '.add_cart', function () {
    var id = $(this).closest('.product').data('product-id');
    addToCartByProductId(id);
    console.log("add to cart");

});
$(document).on('click', '.search_detail', function () {
    var id = $(this).closest('.product').data('product-id');
    location.href = "ProductDetail?productId=" + id;
});


$(document).on('click', '.cart-item .cart_increase', function () {
    var cartItem = $(this).closest('.cart-item');
    var quantity = parseInt(cartItem.find('.cart_quantity').val(), 10);
    var maxQuantity = $(this).closest('.cart-item').data('stock-quantity');
    console.log(maxQuantity)
    if (quantity < maxQuantity) {
        console.log("fsfsaddsv")
        updateCartItem(cartItem.data('cart-id'), quantity + 1);
    } else {
        Swal.fire({
            title: "Xin lỗi",
            text: "Số lượng sản phẩm bạn chọn vượt quá số lượng trong kho!",
            icon: "error",
            timer: 1000
        });
    }
});

$(document).on('click', '.cart-item .cart_decrease', function () {
    var cartItem = $(this).closest('.cart-item');
    var quantity = parseInt(cartItem.find('.cart_quantity').val(), 10);
    updateCartItem(cartItem.data('cart-id'), quantity - 1);
});

$(document).on('click', '.cart-item .cart_delete span', function () {
    var cartItem = $(this).closest('.cart-item');
    updateCartItem(cartItem.data('cart-id'), 0);
});

$(document).on({
    focus: function () {
        $(this).data('default-value', $(this).val());
    },
    change: function () {
        var inputQuantity = $(this);
        var quantity = parseInt(inputQuantity.val(), 10);
        var maxQuantity = parseInt(inputQuantity.data('stock-quantity'), 10);

        if (!isNaN(quantity) && quantity >= 0 && quantity <= maxQuantity) {
            updateCartItem(inputQuantity.closest('.cart-item').data('cart-id'), quantity);
        } else {
            Swal.fire({
                title: "Xin lỗi",
                text: "Số lượng sản phẩm bạn chọn vượt quá số lượng trong kho!",
                icon: "error",
                timer: 1000
            });
            inputQuantity.val(inputQuantity.data('default-value'));
        }
    }
}, '.input-quantity.cart_quantity');

function updateCartItem(idProduct, quantity) {
    $.ajax({
        type: "POST",
        url: "/CartController",
        dataTpe: "json",
        data: {
            action: "UPDATE",
            idProduct: idProduct,
            quantity: quantity
        },
        success: function (response) {
            var totalItems = response.totalItems;

            if (totalItems > 0) {
                $('#btn-card .badge').text(totalItems);
            } else {
                $('#btn-card .badge').text('');
            }

            $('.cart_total_price').text(formatPrice(response.totalPrice));

            var item = response.item;
            var itemDisplay = $('[data-cart-id="' + idProduct + '"]');

            if (item === null || item === undefined) {
                if (totalItems <= 0) {
                    emptyCartMessDiv.css("display", "block");
                    cartTotalInfoDiv.css("display", "none");
                    emptyCart.css("display", "block");
                    cartFooter.css("display", "none");
                }
                itemDisplay.remove();

            } else {
                itemDisplay.find('.cart_quantity').val(item.quantity);
                itemDisplay.find('.cart_price').text(formatPrice(response.itemTotalPrice));
            }

        },
        error: function (error) {
            console.log(error);
            Swal.fire({
                title: "Xin lỗi",
                text: "Số lượng sản phẩm bạn chọn vượt quá số lượng trong kho!",
                showConfirmButton: false,
                icon: "error",
                timer: 1000
            });
        }
    });
}

function addToCartByProductId(idProduct) {
        $.ajax({
            type: "POST",
            url: "/CartController",
            dataTpe: "json",
            data: {
                action: "ADD",
                idProduct: idProduct
            },
            success: function (response) {
                $('#btn-card .badge').text(response.totalItems);
                $('.cart_total_price').text(formatPrice(response.totalPrice));

                var item = response.item;

                var itemDisplay = $('[data-cart-id="' + idProduct + '"]');

                if (itemDisplay.length === 0) {
                    renderCartItem(item, response.itemTotalPrice, 1);
                } else {
                    itemDisplay.find('.cart_quantity').val(item.quantity);
                    itemDisplay.find('.cart_price').text(formatPrice(response.itemTotalPrice));
                }
                Swal.fire({
                    title: "Chúc mừng",
                    text: "Bạn đã thêm vào giỏ hàng thành công !",
                    showConfirmButton: false,
                    icon: "success",
                    timer: 800
                });
            },
            error: function (error) {
                console.log(error);
                Swal.fire({
                    title: "Xin lỗi",
                    text: "Số lượng sản phẩm bạn chọn vượt quá số lượng trong kho!",
                    showConfirmButton: false,
                    icon: "error",
                    timer: 1000
                });
            }
        });
}

function addToCart(idProduct, quantity) {

    return new Promise((resolve, reject) => {
        $.ajax({
            type: "POST",
            url: "/CartController",
            dataType: "json",
            data: {
                action: "ADD",
                idProduct: idProduct,
                quantity: quantity,
            },
            success: function (response) {
                $('#btn-card .badge').text(response.totalItems);
                $('.cart_total_price').text(formatPrice(response.totalPrice));

                var item = response.item;

                var itemDisplay = $('[data-cart-id="' + idProduct + '"]');

                if (itemDisplay.length === 0) {
                    renderCartItem(item, response.itemTotalPrice, item.quantity);
                } else {
                    console.log("clicked 2")
                    itemDisplay.find('.cart_quantity').val(item.quantity);
                    itemDisplay.find('.cart_price').text(formatPrice(response.itemTotalPrice));
                }
                resolve(true);
            },
            error: function (error) {
                reject(false);
            }
        })
    })
}

function renderCartItem(item, itemTotalPrice, quantity) {
    if (itemTotalPrice > 0) {
        emptyCartMessDiv.css("display", "none");
        emptyCart.css("display", "none");
        cartFooter.css("display", "block");
        cartTotalInfoDiv.css("display", "block");
    } else {
        emptyCartMessDiv.css("display", "block");
        cartTotalInfoDiv.css("display", "none");
        emptyCart.css("display", "block");
        cartFooter.css("display", "none");
    }
    $.get('/templates/cart-item-template.jsp', function (template) {
        var $cartItem = $(template);

        $cartItem.attr('data-cart-id', item.product.id);
        $cartItem.attr('data-stock-quantity', item.product.unitsInStock);
        $cartItem.find('.cart_img').attr('src', item.product.thumb);
        $cartItem.find('.cart_title').attr('href', "ProductDetail?productId="+item.product.id);
        $cartItem.find('.cart_title').text(item.product.name);
        $cartItem.find('.cart_quantity').val(quantity);
        $cartItem.find('.cart_price').text(formatPrice(itemTotalPrice));

        $('.cart-container').append($cartItem);
    }, "html");
}

function formatPrice(price) {
    return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    }).format(price);
};