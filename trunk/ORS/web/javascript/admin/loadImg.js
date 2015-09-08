/**
 * Created by Thành on 28/07/2015.
 */
var renderImg = function() {
    var list = imageUrls.split(",");
    for (var i = 0; i < list.length; i++) {
        var img = list[i];
        if (img) {
            $('#images').append('<div class="upload-img">' +
            '<div class="img"><img src="' + img + '"></div>' +
            '</div>');
        }
    }
};

var imageUrls = "";
$(document).ready(function () {
    var time = new Date().getTime();
    imageUrls = $("#imageUrls").val();
    renderImg();

});


