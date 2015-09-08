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
        $("#agree").removeAttr("disabled");
        $("#disagree").removeAttr("disabled");
        $("#createContract").removeAttr("disabled");
        $("#cancelContract").removeAttr("disabled");
    }
    if (nowTemp.valueOf() <= meet.valueOf()) {
        $("#assignTask").removeAttr("disabled");
        $("#assignAgain").removeAttr("disabled");
    }
});