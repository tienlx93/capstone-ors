<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 7/22/2015
  Time: 12:55 PM
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
        <h1 class="title">Thống kê</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Thống kê doanh thu (ước tính)
                        <span data-toggle="tooltip" data-placement="right"
                              title="Doanh thu theo tháng của tất cả văn phòng và thuê vật dụng của văn phòng">
                            <i class="fa fa-question-circle"></i></span>
                    </div>
                    <div>
                        Năm
                        <select id="year">
                            <c:forEach var="item" begin="2015" end="2020">
                                <option>${item}</option>
                            </c:forEach>
                        </select>
                        Tại quận
                        <select id="district">
                            <option value="">Tất cả</option>
                            <c:forEach var="item" items="${districts}">
                                <option>${item}</option>
                            </c:forEach>
                        </select>
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


        $("#filter").click(function () {
            $.ajax({
                method: "POST",
                url: "incomeStatics",
                data: {
                    year: $("#year").val(),
                    district: $("#district").val()
                }
            }).done(function (data) {
                var result = [];
                for (var i = 0; i < 12; i++) {
                    var num = data[i] / 10000;
                    result.push(["Tháng " + (i + 1), Math.round(num) / 100]);
                }
                $('#graph').highcharts({
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Doanh thu ước tính theo tháng',
                        x: -20 //center
                    },
                    xAxis: {
                        type: 'category'
                    },
                    yAxis: {
                        allowDecimals: false,
                        floor: 0,
                        title: {
                            text: 'Doanh thu (triệu VNĐ)'
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    tooltip: {
                        valueSuffix: ' triệu VNĐ'
                    },
                    series: [{
                        name: 'Doanh thu',
                        data: result,
                        dataLabels: {
                            enabled: true
                        }
                    }]
                });
            });
        });

    });
</script>
</html>
