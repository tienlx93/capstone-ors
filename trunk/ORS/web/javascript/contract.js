var removeImg = function (img) {
    var location = imageUrls.lastIndexOf(img);
    imageUrls = imageUrls.substring(0, location) + imageUrls.substring(location + img.length + 1);
    $('#images').html("");
    renderImg();
};
var renderImg = function () {
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
};
var imageUrls = "";
$(document).ready(function () {
    calculatePaymentFee();
    var time = new Date().getTime();
    imageUrls = $("#imageUrl").val();
    console.log(imageUrls);
    renderImg(imageUrls);
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
                $('#imageUrl').val(imageUrls);
                $('#upload').hide();
            } else {
                alert("Hình ảnh này đã được upload, xin thử lại!");
            }

        },
        'onStart': function () {
            $('#upload').show();
        }
    });
    var paymentFeeValue = document.getElementById('paymentFeeValue');
    if(paymentFeeValue != null) {
        paymentFeeValue.value = numberWithCommas(paymentFeeValue.value);
    }
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

    var start = $('#startDate').datepicker({
        format: 'dd-mm-yyyy',
        onRender: function (date) {
            return date.valueOf() < now.valueOf() ? 'disabled' : '';
        }
    }).on('changeDate', function (ev) {
        calculateEndDate();
        calculatePaymentFee();
    }).data('datepicker');

//        document.getElementById('paymentFee').value = numberWithCommas(document.getElementById('paymentFee').value);
    $('.signForm').submit(function () {
        var currentForm = this;
        event.preventDefault();
        bootbox.dialog({
            size: 'small',
            message: "Bạn đồng ý tạo hợp đồng với các thông tin đã ghi nhận?",
            buttons: {
                cancel: {
                    label: "Quay lại",
                    className: "btn-default",
                    callback: function () {

                    }
                }, ok: {
                    label: "Đồng ý",
                    className: "btn-primary",
                    callback: function () {
                        currentForm.submit();
                    }
                }
            }
        });

    });
});

function calculatePaymentFee() {
    var paymentTerm = document.getElementById('paymentTerm').value;
    var officeArea = document.getElementById('officeArea').value;
    formatPaymentFee();
    var paymentFee = document.getElementById('paymentFeeValue').value;
    if(paymentFee != ''){
        paymentFee = parseFloat(paymentFee.replace(/\./g, ''));
    }
    var contractTime = document.getElementById('time').value;
    var deposit = document.getElementById('deposit').value;
    var time;
    switch (paymentTerm) {
        case '1':
            time = 1;
            break;
        case '2':
            time = 3;
            break;
        case '3':
            time = 6;
            break;
    }
    if (paymentTerm != '' && officeArea != null && paymentFee != "") {
        var total = numberWithCommas(parseInt(paymentFee) * officeArea * time);
        var price = document.getElementById('price');
        price.innerHTML = numberWithCommas(total);
        document.getElementById('term').innerHTML = time + ' tháng';
        var contractTotal = numberWithCommas((officeArea * contractTime * parseInt(paymentFee)));
        document.getElementById('total').value = contractTotal;
    }
}
;

function calculateEndDate() {
    var end = document.getElementById('endDate');
    var start = document.getElementById('startDate').value.split("-");
    var startTime = Date.parse(new Date(start[2], start[1] - 1, start[0]));
    var endTime;
    var time = document.getElementById('time').value;
    endTime = startTime + (86400000 * time * 30);
    end.value = formatTime(endTime) != undefined ? formatTime(endTime) : "";
}
;
function formatTime(time) {
    if (time) {
        var formatTime = new Date(time);
        var day = formatTime.getDate();
        var month = formatTime.getMonth() + 1;
        if (day < 10) {
            day = '0' + day
        }
        if (month < 10) {
            month = '0' + month
        }
        var year = formatTime.getFullYear();

        return day + '-' + month + '-' + year;
    }

}
;
function validateArea() {
    var parentArea = document.createContract.parentArea.value;
    var minArea = document.createContract.minArea.value;
    var area = document.createContract.officeArea.value;

    if (parseFloat(area) > parseFloat(parentArea)) {
        alert('Diện tích văn phòng con không được lớn hơn diện tích văn phòng cha!');
        return false;
    } else if (parseFloat(minArea) > parseFloat(area)) {
        alert('Diện tích thuê không được nhỏ hơn diện tích tối thiểu');
        return false;
    }
    return true;
}
;
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}
;

function daysInMonth(month, year) {
    return new Date(year, month, 0).getDate();
}
;
function formatPaymentFee() {
    var paymentFee = document.getElementById('paymentFeeValue').value != '' ? document.getElementById('paymentFeeValue').value : 0;
    if (paymentFee != 0) {
        document.getElementById('paymentFee').value = parseFloat(paymentFee.replace(/\./g, ''));
        document.getElementById('paymentFeeValue').value = numberWithCommas(document.getElementById('paymentFee').value);
    }
}
;
function formatDeposit() {
    var deposit = document.getElementById('deposit').value != '' ? document.getElementById('deposit').value : 0;
    if (deposit != 0) {
        document.getElementById('depositValue').value = parseFloat(deposit.replace(/\./g, ''));
        document.getElementById('deposit').value = numberWithCommas(document.getElementById('depositValue').value);
    }
}
;
function validatePaymentTerm() {
    var paymentTerm = document.getElementById('paymentTerm').value;
    var contractTime = document.getElementById('time').value;

    var time;
    switch (paymentTerm) {
        case '1':
            time = 1;
            break;
        case '2':
            time = 3;
            break;
        case '3':
            time = 6;
            break;
    }
    if (contractTime < time) {
        alert('Thời gian thuê không được nhỏ hơn kỳ hạn thanh toán');
        return false;
    }
    return true;
};