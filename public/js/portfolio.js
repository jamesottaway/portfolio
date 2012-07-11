var id = 0;
var portfolio = {};

var init = function(json) {
  portfolio = json;
}

var show = function(photo, callback) {
  $('#photo').css('background-image', 'url(/images/' + photo.bg + ')');
  $('#photo > img').attr('src', '/images/' + photo.src);
  $('#photo > img').load(function() {
    $(this).css('padding-top', ($('#photo').height() - $('#photo > img').height()) / 2);
    if (typeof(callback) == typeof(Function)) {
      callback();
    }
  });
}

var wireClick = function() {
  $('#photo > img').click(function() {
    if (id == '0') 
      id = 1;
    else
      id = 0;

    fade(function() {
      show(portfolio.photos[id], function() {
        fade();
      });
    });
  });
}

var fade = function(callback) {
  var opacity;
  if ($('#photo').css('opacity') == "1") {
    opacity = 0;
  } else {
    opacity = 1;
  }
  $('#photo').fadeTo('fast', opacity, callback);
}

var run = function() {
  $(function() {
    show(portfolio.photos[id]);
    wireClick();
  });
}
