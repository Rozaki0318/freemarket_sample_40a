$(function(){
  var $f = $("#fileinput");
  var $d = $("#dragarea");
  var $c = $("#clickarea");
  var output = document.getElementById('output');

  $f.on("change", function(){
    handleFiles(this.files);
  });

  $c.on("click", function(e){
    if( $f.length > 0 ){
      $f.click();
    }
    e.preventDefault();
  });

  $d.on("dragenter", function(e){
    e.stopPropagation();
    e.preventDefault();
  });
  $d.on("dragover", function(e){
    e.stopPropagation();
    e.preventDefault();
  });

  $d.on("drop", function(_e){
        var e = _e;
        if( _e.originalEvent ){
            e = _e.originalEvent;
        }
        e.stopPropagation();
        e.preventDefault();

        var dt = e.dataTransfer;
        var files = dt.files;
        handleFiles(files);
  });
});

function handleFiles(files){
  console.log("files", files);
  var length = files.length,
      i = 0, file;
  for (; i < length; i++){
    file = files[i];
    if (!file || file.type.indexOf('image/') < 0){
      continue;
    }
  }
  outputImage(file);
};

function outputImage(blob){
  var image = new Image(),
      blobURL = URL.createObjectURL(blob);
      newItem = document.createElement('li');
      upbtn = document.createElement('div');
      upbtn.className = 'sell-upload-button';
      upbtn_edit = document.createElement('a');
      upbtn_edit.className = 'sell-upload-button_edit';
      upbtn_edit.textContent = "編集";
      upbtn_delete = document.createElement('a');
      upbtn_delete.className = 'sell-upload-button_delete';
      upbtn_delete.textContent = "削除";
      upbtn.append(upbtn_edit);
      upbtn.append(upbtn_delete);

  image.src = blobURL;
  newItem.className = ('sell-upload-item');
  newItem.innerHTML = '<img src =' + image.src + ' id = "itemfig" >';
  newItem.append(upbtn);

  image.addEventListener('load', function(){
    URL.revokeObjectURL(blobURL);
    output.append(newItem);

    var len = $('#output li').length;
    $('.new-upload__image').css( { width: 100 - 25 * len + "%" } );
  });
};

$(document).on('click','.sell-upload-button_delete', function(){
    $(this).parent().parent().remove();
    var len = $('#output li').length;
    $('.new-upload__image').css( { width: 100 - 25 * len + "%" } );
});
