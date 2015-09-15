<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/22/2015
  Time: 10:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'/>
    <title>Office Rental Service</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
          type="text/css">

    <link href='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/fullcalendar.css' rel='stylesheet'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/office.less" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>
    <script src='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/lib/moment.min.js'></script>
    <script src='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/fullcalendar.min.js'></script>
    <script src='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/lang/vi.js'></script>
    <script>

        $(document).ready(function () {
            $('#calendar').fullCalendar({
                lang: 'vi',
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,basicWeek,basicDay'
                },
                editable: false,
                eventLimit: true
            });
            var colors = ['#9A80B9', '#E99844', '#EF4836', '#71B8FF'];
            var legend = $("#legend");
            $.ajax({
                url: "/admin/calendar",
                method: 'POST',
                data: {
                    staff: '${staff}',
                    type:'${type}'
                },
                success: function (result) {
                    for (var i = 0; i < result.length; i++) {
                        var item = result[i];
                        if (item.itemList.length > 0) {
                            $('#calendar').fullCalendar('addEventSource', {
                                events: item.itemList,
                                color: colors[i]
                            });
                            legend.append('<div class="legend clearfix">' +
                            '<div class="color" style="background-color: ' + colors[i] + '"></div>' +
                            '<div class="name">' + item.staff + '</div>' +
                            '</div>');
                        }
                    }

                }
            });
        });

    </script>
    <style>
        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>
<div class="content">
    <div class="calendar-layout clearfix">
        <div class="col-md-10">
            <div id='calendar'></div>
        </div>

        <div class="col-md-2">
            <div id="legend">
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>
</div>

</body>
</html>
