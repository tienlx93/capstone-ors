<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 7/19/2015
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/datepicker/css/datepicker.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/office.less" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/highcharts/highcharts.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/highcharts/modules/exporting.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/datepicker/js/bootstrap-datepicker.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>
<div class="content">
    <div class="page-header">
        <h1 class="page-header">Thống kê</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Thống kê số việc của nhân viên
                        <span data-toggle="tooltip" data-placement="right"
                              title="Bao gồm lịch hẹn, sửa chữa và thuê vật dụng cho văn phòng. Sửa chữa được tính như 2 việc">
                            <i class="fa fa-question-circle"></i></span>
                    </div>
                    <div>
                        Từ ngày
                        <input type='text' name="startDate"
                               id="startDate"
                               value="${startDate}"/>
                        đến ngày
                        <input type='text' name="endDate"
                               id="endDate"
                               value="${endDate}"/>
                        <button type="button" id="filter">Lọc</button>
                    </div>
                    <div>
                        <div id="graph"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>
</div>
</body>
<script>
    $(function () {
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var start = $('#startDate').datepicker({
            format: 'yyyy-mm-dd'
        }).on('changeDate', function (ev) {
            if (ev.date.valueOf() > end.date.valueOf()) {
                var newDate = new Date(ev.date);
                newDate.setDate(newDate.getDate() + 1);
                end.setValue(newDate);
            }
            start.hide();
            $('#endDate')[0].focus();
        }).data('datepicker');

        var end = $('#endDate').datepicker({
            format: 'yyyy-mm-dd',
            onRender: function (date) {
                return date.valueOf() <= start.date.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            end.hide();
        }).data('datepicker');

        $("#filter").click(function () {
            $.ajax({
                method: "POST",
                url: "staffStatics",
                data: {
                    startDate: start.date.valueOf(),
                    endDate: end.date.valueOf()
                }
            }).done(function (data) {
                $('#graph').highcharts({
                    title: {
                        text: 'Số lượng việc theo tuần của nhân viên',
                        x: -20 //center
                    },
                    xAxis: {
                        title: {
                            text: 'Tuần từ'
                        },
                        categories: data.dates
                    },
                    yAxis: {
                        allowDecimals: false,
                        floor: 0,
                        title: {
                            text: 'Số lượng'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        valueSuffix: ' việc'
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: data.map
                });
            });
        });

    });
</script>
</html>
