var portfolio = {};

var init = function(json) {
	portfolio = json;
}

$(function() {
	var photo = $('#photo');
	var img = photo.children('img');
	photo.css('background-image', 'url(/images/' + portfolio.photos[0].bg + ')');
	img.attr('src', '/images/' + portfolio.photos[0].src);
	img.load(function() {
		$(this).css('padding-top', (photo.height() - img.height()) / 2);
	});
});