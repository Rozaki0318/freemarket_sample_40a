$(document).on('turbolinks:load',function() {
  $('.mypage-tab-container-notification-todo .mypage-tabs li').on("click", function(){
    var index = $('.mypage-tab-container-notification-todo .mypage-tabs li').index(this);
    $('.mypage-tab-container-notification-todo .mypage-tabs li').removeClass('active');
    $(this).addClass('active');
    $('.mypage-tab-container-notification-todo .tab-content ul').removeClass('move-show').eq(index).addClass('move-show');
    return false;
  });

  $('.mypage-tab-container .mypage-tabs li').on("click", function(){
    var index = $('.mypage-tab-container .mypage-tabs li').index(this);
    $('.mypage-tab-container .mypage-tabs li').removeClass('active');
    $(this).addClass('active');
    $('.mypage-tab-container .tab-content ul').removeClass('move-show').eq(index).addClass('move-show');
    return false;
  });

  $(function(){
    $('.mypage-nav-list li a').each(function(){
      var href = $(this).attr('href');
      var href = 'http://localhost:3000' + href;
      if(location.href === href) {
      $(this).addClass('active');
      } else {
      $(this).removeClass('active');
      }
    });
  });

  $('.mypage-nav-list-item').hover(function() {
    $(this).find(".far.fa-angle-rig").animate({'right': '10px'},100);
    },function() {
    $(this).find(".far.fa-angle-rig").animate({'right':'16px'},100);
  });

  $(".mypage-nav-list-item").on("mouseover",function(){
      $(this).css({
          backgroundColor: "#F2F2F2"
      });
  });

  $(".mypage-nav-list-item").on("mouseout",function(){
      $(this).css({
          backgroundColor: ""
      });
  });

});
