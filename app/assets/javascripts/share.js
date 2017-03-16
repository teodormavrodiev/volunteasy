(function($) {
  $('.js-share').click(function(e) {
    e.preventDefault();
    var href = $(this).attr('data-href');
    var content = $(this).attr('data-content');
    var shareAddress = "https://www.facebook.com/share.php?u="+encodeURIComponent(href)+"&title="+encodeURIComponent(content);
    window.open(shareAddress, "Facebook", "height=269,width=550,resizable=1");
  });
})(jQuery);
