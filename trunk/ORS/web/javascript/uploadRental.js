
$(document).ready(function () {
    $('input[type="file"]').ajaxfileupload({
        'action': '/upload',
        'params': {
            'office': 'rental'
        },
        'onComplete': function (response) {

                $('#imageUrl').val(response);

                $('#images').html('<div class="upload-img">' +
                '<div class="img"><img src="' + response + '"></div>' +
                '</div>');
                $('#upload').hide();
        },
        'onStart': function () {
            $('#upload').show();
        }
    });
});