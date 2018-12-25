$(function() {
  $(document).on('turbolinks:load', function() {
    $('.size-box').hide();

    //引数で渡したクラスのプルダウンだけ表示させる
    function hidePd(className) {
      $('.s-wear, .s-f-shoes, .s-m-shoes, .s-tire, .s-kids95, .s-kids100, .s-baby, .s-ski, .s-board').hide();
      $(className).show();
      }

    //中カテゴリのプルダウン生成
    //前編
    function mBuildPd1() {
      var mHtml1 = `
                    <select class="select-new mcate" method="post" name="item[category_id]">
                    <option value=""> --- </option>
                    `
    $('.cate').append(mHtml1);
    }
    //中編
    function mBuildPd2(mc) {
      var mHtml2 = `<option value="${mc.id}">${mc.name}</option>`
      $('.mcate').append(mHtml2);
    }
    //後編
    function mFormEnd() {
      var mHtml3 = `</select>`
      $('.mcate').append(mHtml3);
    }

    //小カテゴリのプルダウン生成
    //前編
    function sBuildPd1() {
      var sHtml1 = `
                    <select class="select-new scate" method="post" name="item[category_id]">
                    <option value=""> --- </option>
                    `
    $('.cate').append(sHtml1);
    }
    //中編
    function sBuildPd2(sc) {
      var sHtml2 = `<option value="${sc.id}" data-size="${sc.size_pulldown}">${sc.name}</option>`
      $('.scate').append(sHtml2);
    }
    //後編
    function sFormEnd() {
      var sHtml3 = `</select>`
      $('.scate').append(sHtml3);
    }

    //プルダウンが重複しないようにする
    //大カテゴリを選び直したとき
    function mRemovePD() {
      $('.size-box').hide();
      if ($('.mcate').length != 0) {
        $('.mcate, .scate').remove();
      }
    }
    //中カテゴリを選び直したとき
    function sRemovePD() {
      $('.size-box').hide();
      if ($('.scate').length != 0) {
        $('.scate').remove();
      }
    }

    // 大カテゴリをチョイス
    $("#item_category").on('change', function() {
      var val = $(this).val();
      mRemovePD();
      $('.size-box').hide();
      if (val.length != 0) {
        $.ajax({
          type: 'GET',
          url: '/categories',
          data: {id: val},
          dataType: 'json'
        })
        // 成功した時
        .done(function(data) {
          mRemovePD();
          mBuildPd1('mcate');
          data.forEach(function(mc) {
            mBuildPd2(mc)
            mFormEnd('.mcate')
          });
        })
        // 失敗した時
        .fail(function() {
          alert('ちょっとごめん、もう一回更新してやり直して');
        })
        .always(function() {
          $('#item_category').prop("disabled", false);
        })
      }
    })

    // 中カテゴリチョイス
    $(document).on('change','.mcate', function() {
      var val = $(this).val();
      sRemovePD();
      if (val.length != 0) {
        $.ajax({
          type: 'GET',
          url: '/categories',
          data: {key: val},
          dataType: 'json'
        })
        // 成功した時
        .done(function(data) {
          sRemovePD();
          if(data.length != 0) {
            sBuildPd1('scate');
            data.forEach(function(sc) {
              sBuildPd2(sc)
              sFormEnd('.scate')
            });
          }
        })
        // 失敗した時
        .fail(function() {
          alert('ちょっとごめん、もう一回更新してやり直して');
        })
        .always(function() {
          $('.mcate').prop("disabled", false);
        })
      }
    })



    // サイズプルダウンの出現、小カテゴリをチョイス
    $(document).on('change','.scate', function(event) {
      $('.size-box').show();
      var val = $('.scate option:selected').data('size');
      switch(val) {
        case 0 :
        $('.size-box').hide();
        break;
        case 1 :
        hidePd('.s-wear')
        break;
        case 2 :
        hidePd('.s-f-shoes')
        break;
        case 3 :
        hidePd('.s-m-shoes')
        break;
        case 4 :
        hidePd('.s-tire')
        break;
        case 5 :
        hidePd('.s-kids95')
        break;
        case 6 :
        hidePd('.s-kids100')
        break;
        case 7 :
        hidePd('.s-baby')
        break;
        case 8 :
        hidePd('.s-ski')
        break;
        case 9 :
        hidePd('.s-board')
        break;
      }
    })

    //送信ボタンを押した時に不必要なサイズプルダウンと配送の方法を消去して、サイズのないものにはサイズs0を入れる
    $('.new-itembox__create-btn').on('click', function() {
      if ($('#sw-in').css('display') != 'block') {
        $('#sw-in').remove();
      }
      if ($('#sw-out').css('display') != 'block') {
        $('#sw-out').remove();
      }
      if ($('.s-wear').css('display') != 'block') {
        $('.s-wear').remove();
      }
      if ($('.s-f-shoes').css('display') != 'block') {
        $('.s-f-shoes').remove();
      }
      if ($('.s-m-shoes').css('display') != 'block') {
        $('.s-m-shoes').remove();
      }
      if ($('.s-tire').css('display') != 'block') {
        $('.s-tire').remove();
      }
      if ($('.s-kids95').css('display') != 'block') {
        $('.s-kids95').remove();
      }
      if ($('.s-kids100').css('display') != 'block') {
        $('.s-kids100').remove();
      }
      if ($('.s-baby').css('display') != 'block') {
        $('.s-baby').remove();
      }
      if ($('.s-ski').css('display') != 'block') {
        $('.s-ski').remove();
      }
      if ($('.s-board').css('display') != 'block') {
        $('.s-board').remove();
      }
      if($('.size-box').css('display') != 'block') {
        var nopd = `<select class="select-new" method="post" name="item[size]">
                    <option value="s0"> --- </option>
                    </select>`
        $('.size-box').append(nopd);
      }
    })
  });
});
