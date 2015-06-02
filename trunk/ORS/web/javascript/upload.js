
var removeImg = function(img){
    var location = imageUrls.lastIndexOf(img);
    imageUrls = imageUrls.substring(0, location) + imageUrls.substring(location + img.length + 1);
    var list = imageUrls.split(",");
    $('#images').html("");
    for (var i = 0; i < list.length; i++) {
        var img = list[i];
        if (img){
            $('#images').append('<div class="upload-img">' +
            '<div class="img"><img src="'+img+'"></div>' +
            '<div class="remove" onclick="removeImg(\''+img+'\')">' +
            '<i class="fa fa-minus-circle"></i>Xóa' +
            '</div>' +
            '</div>');
        }
    }
};
var imageUrls = "";
$(document).ready(function () {

    $('input[type="file"]').ajaxfileupload({
        'action': '/upload',
        'params': {
            'office': '1'
        },
        'onComplete': function (response) {

            if (imageUrls.lastIndexOf(response) < 0) {

                imageUrls += response + ",";

                $('#images').append('<div class="upload-img">' +
                '<div class="img"><img src="'+response+'"></div>' +
                '<div class="remove" onclick="removeImg(\''+response+'\')">' +
                '<i class="fa fa-minus-circle"></i>Xóa' +
                '</div>' +
                '</div>');
                $('#imageUrls').val(imageUrls);
                $('#upload').hide();
            } else {
                alert("Hình ảnh này đã được upload, xin thử lại!");
            }

        },
        'onStart': function () {
            $('#upload').show();
        }
    });
});
