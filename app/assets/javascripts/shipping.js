$(function() {
  $(document).on('turbolinks:load', function() {
    $('#sw-in, #sw-out').hide();
    $("select.fee").on('change', function() {
      var val = $(this).val();
      console.log(val);
      switch(val) {
        case "f0" :
        $('#sw-in').hide();
        $('#sw-out').hide();
        break;
        case "f1" :
        $('#sw-in').show();
        $('#sw-out').hide();
        break;
        case "f2" :
        $('#sw-out').show();
        $('#sw-in').hide();
        break;
      }
    })
  });
});
