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
  <meta charset='utf-8' />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
        type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
        type="text/css">

  <link href='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/fullcalendar.css' rel='stylesheet' />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
  <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/office.less" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
  <script type="text/javascript"
          src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>
  <script src='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/lib/moment.min.js'></script>
  <script src='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/fullcalendar.min.js'></script>
  <script>

    $(document).ready(function() {

      $('#calendar').fullCalendar({
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,basicWeek,basicDay'
        },
        defaultDate: '2015-02-12',
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        events: [
          {
            title: 'All Day Event',
            start: '2015-02-01',
            color: '#9A80B9',
            staff: 'staff1'
          },
          {
            title: 'Long Event',
            start: '2015-02-07',
            end: '2015-02-10',
            color: '#EF4836'
          },
          {
            id: 999,
            title: 'Repeating Event',
            start: '2015-02-09T16:00:00'
          },
          {
            id: 999,
            title: 'Repeating Event',
            start: '2015-02-16T16:00:00'
          },
          {
            title: 'Conference',
            start: '2015-02-11',
            end: '2015-02-13'
          },
          {
            title: 'Meeting',
            start: '2015-02-12T10:30:00',
            end: '2015-02-12T12:30:00'
          },
          {
            title: 'Lunch',
            start: '2015-02-12T12:00:00',
            color: '#E99844'
          },
          {
            title: 'Meeting',
            start: '2015-02-12T14:30:00'
          },
          {
            title: 'Happy Hour',
            start: '2015-02-12T17:30:00'
          },
          {
            title: 'Dinner',
            start: '2015-02-12T20:00:00'
          },
          {
            title: 'Birthday Party',
            start: '2015-02-13T07:00:00'
          },
          {
            title: 'Click for Google',
            url: 'http://google.com/',
            start: '2015-02-28'
          }
        ]
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
  <div id='calendar'></div>
</div>

</body>
</html>
