$(function() {
  $(document).on('turbolinks:load', function() {
    $('.size-box').hide();
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
    function mRemovePD() {
      // console.log(cate);
      if ($('.mcate').length != 0) {
        $('.mcate, .scate').remove();
      }
    }
    function sRemovePD() {
      // console.log(cate);
      if ($('.scate').length != 0) {
        $('.scate').remove();
      }
    }

    // 大カテゴリをチョイス
    $("#item_category").on('change', function() {
      var val = $(this).val();
      // console.log(val);
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
    })

    // 中カテゴリチョイス
    $(document).on('change','.mcate', function() {
      var val = $(this).val();
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
        $('.size-box, .s-f-shoes, .s-m-shoes, .s-tire, .s-kids95, .s-kids100, .s-baby, .s-ski, .s-board').hide();
        $('.size-box, .s-wear').show();
        break;
        case 2 :
        $('.size-box, .s-wear, .s-m-shoes, .s-tire, .s-kids95, .s-kids100, .s-baby, .s-ski, .s-board').hide();
        $('.size-box, .s-f-shoes').show();
        break;
        case 3 :
        $('.size-box, .s-wear, .s-f-shoes, .s-tire, .s-kids95, .s-kids100, .s-baby, .s-ski, .s-board').hide();
        $('.size-box, .s-m-shoes').show();
        break;
        case 4 :
        $('.size-box, .s-wear, .s-f-shoes, .s-m-shoes, .s-kids95, .s-kids100, .s-baby, .s-ski, .s-board').hide();
        $('.size-box, .s-tire').show();
        break;
        case 5 :
        $('.size-box, .s-wear, .s-f-shoes, .s-m-shoes, .s-tire, .s-kids100, .s-baby, .s-ski, .s-board').hide();
        $('.size-box, .s-kids95').show();
        break;
        case 6 :
        $('.size-box, .s-wear, .s-f-shoes, .s-m-shoes, .s-tire, .s-kids95, .s-baby, .s-ski, .s-board').hide();
        $('.size-box, .s-kids100').show();
        break;
        case 7 :
        $('.size-box, .s-wear, .s-f-shoes, .s-m-shoes, .s-tire, .s-kids95, .s-kids100, .s-ski, .s-board').hide();
        $('.size-box, .s-baby').show();
        break;
        case 8 :
        $('.size-box, .s-wear, .s-f-shoes, .s-m-shoes, .s-tire, .s-kids95, .s-kids100, .s-baby, .s-board').hide();
        $('.size-box, .s-ski').show();
        break;
        case 9 :
        $('.size-box, .s-wear, .s-f-shoes, .s-m-shoes, .s-tire, .s-kids95, .s-kids100, .s-baby, .s-ski').hide();
        $('.size-box, .s-board').show();
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
