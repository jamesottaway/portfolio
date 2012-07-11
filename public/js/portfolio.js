var id = 0;
var portfolio = {};

var init = function(json) {
  portfolio = json;
}

var show = function(photo) {
  $('#photo').css('background-image', 'url(/images/' + photo.bg + ')');
  $('#photo > img').attr('src', '/images/' + photo.src);
  $('#photo > img').load(function() {
    $(this).css('padding-top', ($('#photo').height() - $('#photo > img').height()) / 2);
  });
}

var wireClick = function() {
  $('#photo > img').click(function() {
    if (id == '0') 
      id = 1;
    else
      id = 0;

    show(portfolio.photos[id]);
  });
}

var run = function() {
  $(function() {
    show(portfolio.photos[id]);
    wireClick();
  });
}
