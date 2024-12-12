// Render product
function renderProduct(item) {
	$.get('/templates/product-template.jsp', function(template) {
		var $product = $(template);

		$product.attr('data-product-id', item.id);
		$product.find('.product_thumb').attr('src', item.thumb);
		$product.find('.product_name').text(item.name);

		if (item.sale != null) {
			$product.find('.product_sale').text('Giảm ' + item.sale);
			$product.find('.product_new_price').text(formatPrice(item.newPrice));
			$product.find('.product_unit_price').text(formatPrice(item.unitPrice));
		} else {
			$product.find('.product_new_price').text(formatPrice(item.unitPrice));
		}

		$('.product-container').append($product);
	}, "html");
}

function renderProducts(items) {
	$.get('/templates/product-template.jsp', function(template) {
		var $productContainer = $('.product-container');
		$productContainer.empty();

		var $row = $('<div class="row mb-child-20">');

		$.each(items, function(index, item) {
			var $product = $(template);

			$product.attr('data-product-id', item.id);
			$product.find('.product_thumb').attr('src', item.thumb);
			$product.find('.product_name').text(item.name);

			if (item.sale != null) {
				$product.find('.product_sale').text('Giảm ' + item.sale).show();
				$product.find('.product_new_price').text(formatPrice(item.newPrice));
				$product.find('.product_unit_price').text(formatPrice(item.unitPrice));
			} else {
				$product.find('.product_new_price').text(formatPrice(item.unitPrice));
			}

			var $col = $('<div class="col-6 col-md-4 col-xl-3">');
			$col.append($product);
			$row.append($col);
		});

		$productContainer.append($row);
	}, "html");
}

function formatPrice(price) {
	return new Intl.NumberFormat('vi-VN', {
		style: 'currency',
		currency: 'VND'
	}).format(price);
};
function notify2(title, text, icon, time) {
	Swal.fire({
		title: title,
		text: text,
		showConfirmButton: false,
		icon: icon,
		timer: time
	});
}
function notify(title, text, icon) {
	Swal.fire({
		title: title,
		text: text,
		icon: icon
	});
}




function showCustomNotification(message, linkText, linkUrl, time) {
	var notification = $(
		'<div data-notify="container" class="col-xs-11 col-sm-4 alert alert-success animated fadeInDown fadeOutRight" role="alert" data-notify-position="top-right" style="display: inline-block; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out 0s; z-index: 1031; top: 20px; right: 20px; max-width: 300px;">' +
		'<button type="button" aria-hidden="true" class="close" data-notify="dismiss" style="font-size: 18px; color: #000; background-color: transparent; border: none; position: absolute; right: 10px; top: 5px; z-index: 1033;">×</button>' +
		'<span style="font-size: 14px;" data-notify="icon" class="glyphicon glyphicon-ok"></span>' +
		'<span style="font-size: 14px;" data-notify="title"><strong>Tuyệt vời</strong><br></span>' +
		'<span style="font-size: 14px;" data-notify="message">' + message + ' Bấm vào <a href="' + linkUrl + '" style="font-size: 12px; color: black;"><b>' + linkText + '</b></a> để đến trang yêu thích</span>' +
		'<a href="#" target="_blank" data-notify="url"></a>' +
		'</div>'
	);

	$('body').append(notification);
	notification.fadeIn();

	setTimeout(function() {
		notification.fadeOut();
	}, time);
}

$(document).on('click', '.heartIcon', function() {
	var $heartIcon = $(this);
	var productId = $heartIcon.closest('.product').data('product-id');

	$.post('/san-pham-yeu-thich', { productId: productId }, function(data) {
		if (data.status === 'add') {
			$heartIcon.addClass('favorited');

			showCustomNotification('Bạn đã thêm sản phẩm vào danh sách yêu thích.', 'đây',
				'/san-pham-yeu-thich', 1500);
		} else if (data.status === 'remove') {
			$heartIcon.removeClass('favorited');
			$('.wishlist-container .product[data-product-id="' + productId + '"]').parent().remove();
		}

		$('.wishlist').text(data.totalWishlist);
	});
});