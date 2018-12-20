$(document).on('turbolinks:load',function() {
  $('.owl-dot').mouseover(function(){
    var i = $(this).index();
    $('.owl-dot').removeClass('active');
    $(this).addClass('active');
    $('.owl-stage').css( { left: -300 * i + "px" } )
  });
});
