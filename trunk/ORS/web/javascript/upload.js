var renderImg = function() {
    var list = imageUrls.split(",");
    for (var i = 0; i < list.length; i++) {
        var img = list[i];
        if (img) {
            $('#images').append('<div class="upload-img">' +
                '<div class="img"><img src="' + img + '"></div>' +
                '<div class="remove" onclick="removeImg(\'' + img + '\')">' +
                '<i class="fa fa-minus-circle"></i>Xóa' +
                '</div>' +
                '</div>');
        }
    }
    $("#imageUrls").val(imageUrls);
};
var removeImg = function (img) {
    var location = imageUrls.lastIndexOf(img);
    imageUrls = imageUrls.substring(0, location) + imageUrls.substring(location + img.length + 1);
    $('#images').html("");
    renderImg();
};
var imageUrls = "";
$(document).ready(function () {
    var time = new Date().getTime();
    imageUrls = $("#imageUrls").val();
    renderImg();
    $('input[type="file"]').ajaxfileupload({
        'action': '/upload',
        'params': {
            'office': time
        },
        'onComplete': function (response) {

            if (imageUrls.lastIndexOf(response) < 0) {

                imageUrls += response + ",";

                $('#images').append('<div class="upload-img">' +
                '<div class="img"><img src="' + response + '"></div>' +
                '<div class="remove" onclick="removeImg(\'' + response + '\')">' +
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

var amenityList = [];
function deleteAmenity(amenity) {
    for (var i = 0; i < amenityList.length; i++) {
        if (amenityList[i] == amenity) {
            amenityList.splice(i, 1);
        }
    }
    $("#amenity-list").html("");
    for (var i = 0; i < amenityList.length; i++) {
        $("#amenity-list").append('<div>' + amenityList[i] + ' <span class="color10 fa fa-remove" onclick="deleteAmenity(\'' + amenityList[i] + '\')"></span></div>');
    }
    $("#amenityList").val(amenityList);
}
function addAmenity() {
    var amenity = $("#amenity").val();
    amenityList.push(amenity);
    $("#amenity-list").append('<div>' + amenity + ' <span class="color10 fa fa-remove" onclick="deleteAmenity(\'' + amenity + '\')"></span></div>');
    $("#amenity").val("");
    $("#amenityList").val(amenityList);
}

$('#form').on('keyup keypress', function(e) {
    if (e.target.type != "textarea") {
        var code = e.keyCode || e.which;
        if (code == 13) {
            e.preventDefault();
            return false;
        }
    }
});

$("#amenity").on('keyup', function (event) {
    if (event.keyCode == 13) {
        //event.preventDefault();
        addAmenity();
        $("#amenity").val("");
    }
});

$.ajax({url: "/api?action=amenity", success: function(result){
    var data = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        local: result
    });
    $('input.typeahead').typeahead({
        hint: true,
        highlight: true,
        minLength: 1
    }, {
        name: 'amenity',
        source: data,
        limit: 5
    });
}});

$("#area, #floor, #minArea, #minTime, #price, #ownerPhone ").keydown(function (e) {
    // Allow: backspace, delete, tab, escape, enter and .
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
            // Allow: Ctrl+A
        (e.keyCode == 65 && e.ctrlKey === true) ||
            // Allow: Ctrl+C
        (e.keyCode == 67 && e.ctrlKey === true) ||
            // Allow: Ctrl+X
        (e.keyCode == 88 && e.ctrlKey === true) ||
            // Allow: home, end, left, right
        (e.keyCode >= 35 && e.keyCode <= 39)) {
        // let it happen, don't do anything
        return;
    }
    // Ensure that it is a number and stop the keypress
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
});
var dropdown = $("#priceTerm");
var minArea = $("#divMinArea");
dropdown.find("option[value=1]").show();
dropdown.find("option[value=2]").hide();
dropdown.find("option[value=3]").hide();
dropdown.find("option[value=4]").show();
function changeCategory() {
    if ($("#category").val() == 1) {
        dropdown[0].selectedIndex = 0;
        dropdown.find("option[value=1]").show();
        dropdown.find("option[value=2]").hide();
        dropdown.find("option[value=3]").hide();
        dropdown.find("option[value=4]").show();
        minArea.hide();
    } else {
        dropdown[0].selectedIndex = 1;
        dropdown.find("option[value=1]").hide();
        dropdown.find("option[value=2]").show();
        dropdown.find("option[value=3]").show();
        dropdown.find("option[value=4]").show();
        minArea.show();
    }
}
$("#category").change(function(){
    changeCategory();
});
changeCategory();
var price = $("#price");
function changeDropdown() {
    if (dropdown[0].selectedIndex == 3) {
        price.val("");
        price[0].disabled = true;
    } else {
        price[0].disabled = false;
    }
}
changeDropdown();
dropdown.change(function(){
    changeDropdown();
    onChangeBasePrice();
});
var isPercent = $("#isPercent");
var commission = $("#commission");
isPercent.click( function(){
    checkPercent();
});
function checkPercent() {
    onChangeBasePrice();
    if (isPercent[0].checked) {
        commission[0].readOnly = false;
        price[0].readOnly = true;
    } else {
        commission.val("");
        commission[0].readOnly = true;
        price[0].readOnly = false;
    }
}
checkPercent();
function onChangeBasePrice() {
    var basePrice = $("#basePrice");
    var price = $("#price");
    if (isPercent[0].checked && dropdown[0].selectedIndex != 3) {
        price.val(basePrice.val());
    }
}