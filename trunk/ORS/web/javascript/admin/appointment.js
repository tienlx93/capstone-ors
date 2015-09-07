$.ajax({
    url: "/api?action=officeName", success: function (result) {
        var data = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.whitespace,
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            local: result
        });
        $('input.typeahead').typeahead({
            hint: true,
            highlight: true,
            minLength: 2
        }, {
            name: 'office',
            source: data,
            limit: 5
        });
    }
});

var options = function (name) {
    return {
        valueNames: ['name'],
        page: 10,
        plugins: [
            ListPagination({paginationClass: 'pagination-' + name})
        ]
    }
};

var pending = new List('pending', options('pending'));
var assigned = new List('assigned', options('assigned'));
var accepted = new List('accepted', options('accepted'));
var done = new List('done', options('done'));
var cancel = new List('cancel', options('cancel'));

$('.assignForm').submit(function () {
    var currentForm = $(this);
    event.preventDefault();
    bootbox.dialog({
        size: 'small',
        message: "Bạn đồng ý giao việc cho nhân viên?",
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
                    var url = currentForm.attr('action');
                    $.ajax({
                        type: "POST",
                        url: url,
                        data: currentForm.serialize(), // serializes the form's elements.
                        success: function (data) {
                            data = JSON.parse(data);
                            if (data == "Success") {
                                bootbox.alert("Giao việc thành công", function(){
                                    window.location.reload();
                                });
                            } else {
                                var message = "";
                                var className = "";
                                if (data.status == 0) {
                                    if (data.jobCount >= 4) {
                                        message = "Nhân viên đã có " + data.jobCount + " trong ngày.<br>";
                                    }
                                    if (data.nearJob) {
                                        message += "Lịch hẹn gần nhất của nhân viên tại thời điểm " + data.nearJob + ", thời gian cách " +
                                            "lịch hẹn hiện tại ít hơn 2 tiếng.<br>";
                                    }
                                    message += "Bạn vẫn muốn giao việc cho nhân viên?";
                                    currentForm.add("<input type='hidden' name='force' value='true'>");
                                    className = "btn-primary";
                                } else {
                                    if (data.status == -1 || data.status == -3) {
                                        message += "Nhân viên đã có " + data.jobCount + " trong ngày.<br>";
                                    }
                                    if (data.status == -2 || data.status == -3) {
                                        message += "Lịch hẹn gần nhất của nhân viên tại thời điểm " + data.nearJob + ", thời gian cách " +
                                            "lịch hẹn hiện tại ít hơn 1 tiếng.<br>";
                                    }
                                    message += "Không thể giao việc cho nhân viên.";
                                    className = "btn-primary disabled";
                                }
                                setTimeout(function(){
                                    bootbox.dialog({
                                        title: "Giao việc thất bại",
                                        message: message,
                                        buttons: {
                                            cancel: {
                                                label: "Quay lại",
                                                className: "btn-default",
                                                callback: function () {
                                                }
                                            }, ok: {
                                                label: "Vẫn giao việc",
                                                className: className,
                                                callback: function () {
                                                    var url = currentForm.attr('action');
                                                    $.ajax({
                                                        type: "POST",
                                                        url: url,
                                                        data: currentForm.serialize(),
                                                        success: function (data) {
                                                            window.location.reload();
                                                        }
                                                    });
                                                }
                                            }
                                        }
                                    });
                                },500);

                            }
                        }
                    });
                }
            }
        }
    });
});