$(document).ready(function () {
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

    $('#time').datepicker({
        format: 'yyyy-mm-dd',
        onRender: function (date) {
            return date.valueOf() < now.valueOf() ? 'disabled' : '';
        }
    }).data('datepicker');

    var meetDate = document.getElementById('meetDate').value;
    var meet = new Date(meetDate);
    var afterMeet = new Date(meet);
    afterMeet.setHours(meet.getHours() + 2);

    var checkTime = nowTemp - meet;
    var checkTime4 = afterMeet - meet;

    /*if (checkTime.valueOf() < checkTime4.valueOf() && checkTime.valueOf > 0) {
     $("#agree").removeAttr("disabled");
     }*/
    if (nowTemp.valueOf() >= meet.valueOf()) {
        $("#agree2").removeClass("hidden");
        $("#disagree2").removeClass("hidden");
        /*$("#createContract").removeAttr("disabled");
        $("#cancelContract").removeAttr("disabled");*/
    } else {
        $("#agree").removeClass("hidden");
        $("#disagree").removeClass("hidden");
    }
    /*if (nowTemp.valueOf() <= meet.valueOf()) {
        $("#assignTask").removeAttr("disabled");
        $("#assignAgain").removeAttr("disabled");
    }*/

    $("button[type='submit']").click(function () {
        var currentForm = $("form");
        var button = $(this).attr("value");
        if (button == "reject" || !currentForm.valid()) {
            return;
        }
        currentForm.append("<input type='hidden' name='button' value='"+button+"'>");
        event.preventDefault();
        var url = currentForm.attr('action');
        $.ajax({
            type: "POST",
            url: url,
            data: currentForm.serialize(), // serializes the form's elements.
            success: function (data) {
                data = JSON.parse(data);
                if (data == "Success") {
                    bootbox.alert("Giao việc thành công", function(){
                        window.location = "/admin/appointment";
                    });
                } else {
                    var message = "";
                    var className = "";
                    if (data.status == 0) {
                        if (data.jobCount >= 4) {
                            message = "Nhân viên đã có " + data.jobCount + " việc trong ngày.<br>";
                        }
                        if (data.nearJob) {
                            message += "Lịch hẹn gần nhất của nhân viên tại thời điểm " +
                                formatDate(data.nearJob) + ", thời gian cách " +
                                "lịch hẹn hiện tại ít hơn 2 tiếng.<br>";
                        }
                        message += "Bạn vẫn muốn giao việc cho nhân viên?";
                        currentForm.append("<input type='hidden' name='force' value='true'>");
                        className = "btn-primary";
                    } else {
                        if (data.status == -1 || data.status == -3) {
                            message += "Nhân viên đã có " + data.jobCount + " việc trong ngày.<br>";
                        }
                        if (data.status == -2 || data.status == -3) {
                            message += "Lịch hẹn gần nhất của nhân viên tại thời điểm " +
                                formatDate(data.nearJob) + ", thời gian cách " +
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
                                            success: function () {
                                                bootbox.alert("Giao việc thành công", function(){
                                                    window.location.reload();
                                                });
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
    });
});