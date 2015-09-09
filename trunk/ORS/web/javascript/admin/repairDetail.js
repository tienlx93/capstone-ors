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

    var repairDate = document.getElementById('repairDate').value;
    var repair = new Date(repairDate);
    if (nowTemp.valueOf() <= repair.valueOf()) {
        $("#agree").removeAttr("disabled");
    }
    if (nowTemp.valueOf() >= repair.valueOf()) {
        $("#happy").removeAttr("disabled");
        $("#unhappy").removeAttr("disabled");
    }
});
