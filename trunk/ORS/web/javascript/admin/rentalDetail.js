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
});
