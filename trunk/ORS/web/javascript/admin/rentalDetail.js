$(document).ready(function () {
    var startDate = document.getElementById('startDate').value;
    var start = new Date(startDate);
    var endDate = document.getElementById('endDate').value;
    var end = new Date(endDate);

    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

    $('#assignedTime').datepicker({
        format: 'dd-mm-yyyy',
        onRender: function (date) {
            return ((date.valueOf() < start.valueOf() || date.valueOf() < now.valueOf()) || date.valueOf() > end.valueOf()) ? 'disabled' : '';
        }
    }).data('datepicker');

    var rentalDate = document.getElementById('rentalDate').value;
    var rental = new Date(rentalDate);
    if (nowTemp.valueOf() <= rental.valueOf()) {
        $("#agree").removeAttr("disabled");
        $("#disagree").removeAttr("disabled");
        $("#assignTask").removeAttr("disabled");
    }
    if (nowTemp.valueOf() >= rental.valueOf()) {
        $("#happy").removeAttr("disabled");
        $("#unhappy").removeAttr("disabled");
    }
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
                    bootbox.alert("Giao việc thành công", function () {
                        window.location = "/admin/rental";
                    });
                } else {
                    var message = "";
                    var className = "";
                    if (data.status == 0) {
                        if (data.jobCount >= 4) {
                            message = "Nhân viên đã có " + data.jobCount + " trong ngày.<br>";
                        }
                        message += "Bạn vẫn muốn giao việc cho nhân viên?";
                        currentForm.append("<input type='hidden' name='force' value='true'>");
                        className = "btn-primary";
                    } else {
                        if (data.status == -1 || data.status == -3) {
                            message += "Nhân viên đã có " + data.jobCount + " trong ngày.<br>";
                        }
                        message += "Không thể giao việc cho nhân viên.";
                        className = "btn-primary disabled";
                    }
                    setTimeout(function () {
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
                                                bootbox.alert("Giao việc thành công", function () {
                                                    window.location = "/admin/rental";
                                                });
                                            }
                                        });
                                    }
                                }
                            }
                        });
                    }, 500);

                }
            }
        });
    });
});
