$(function() {
  $(document).on('turbolinks:load', function() {
    $('.price-container__field--right-input').on('keyup', function() {
      var input = $('.price-container__field--right-input').val();
      if(input >= 300 && input <= 9999999) {
        //販売手数料を出す
        preCommission = Math.floor(input / 10);
        commission = String(preCommission).replace(/(\d)(?=(\d\d\d)+$)/g, '$1,');
        $('.commission').html("￥" + commission);
        //販売利益を計算
        preProfits = input - preCommission
        profits = String(preProfits).replace(/(\d)(?=(\d\d\d)+$)/g, '$1,');
        $('.profits').html("￥" + profits)
      } else {
        $('.commission, .profits').html("-");
      }
    })
  });
});
