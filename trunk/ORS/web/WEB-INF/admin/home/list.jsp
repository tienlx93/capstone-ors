<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="h" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 7/21/2015
  Time: 10:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
          type="text/css">

    <link href='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/fullcalendar.css' rel='stylesheet'/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/office.less" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendar.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>
    <script src='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/lib/moment.min.js'></script>
    <script src='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/fullcalendar.min.js'></script>
    <script src='${pageContext.request.contextPath}/lib/fullcalendar-2.3.2/lang/vi.js'></script>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>
<div class="content">
    <div class="page-header">
        <h1 class="title">Trang chủ</h1>
    </div>
    <div class="clearfix">
        <c:if test="${user.roleId == 1}">
            <h:panel badge="00" name="Tổng người dùng" url="${pageContext.request.contextPath}/admin/user"
                     icon="fa-user" css="panel-primary"/>
        </c:if>

        <c:if test="${user.roleId != 1}">

            <h:panel badge="00" name="Tổng văn phòng" url="${pageContext.request.contextPath}/admin/office"
                     icon="fa-building-o" css="panel-primary"/>
            <h:panel badge="00" name="Lịch hẹn mới" url="${pageContext.request.contextPath}/admin/appointment"
                     icon="fa-calendar" css="panel-primary"/>


            <c:if test="${user.roleId != 3}">
                <h:panel badge="00" name="Tổng hợp đồng" url="${pageContext.request.contextPath}/admin/contract"
                         icon="fa-file-text-o" css="panel-primary"/>
                <h:panel badge="00" name="Hủy trước hạn"
                         url="${pageContext.request.contextPath}/admin/contract?action=return"
                         icon="fa-file-text-o" css="panel-primary"/>
                <h:panel badge="00" name="Gia hạn"
                         url="${pageContext.request.contextPath}/admin/contract?action=extend"
                         icon="fa-file-text-o" css="panel-primary"/>
            </c:if>
            <h:panel badge="00" name="Sửa chữa mới" url="${pageContext.request.contextPath}/admin/repair"
                     icon="fa-wrench" css="panel-primary"/>
            <h:panel badge="00" name="Thuê vật dụng mới" url="${pageContext.request.contextPath}/admin/rental"
                     icon="fa-fax" css="panel-primary"/>
            <h:panel badge="00" name="Thiết bị cho thuê" url="${pageContext.request.contextPath}/admin/rentalItem"
                     icon="fa-cubes" css="panel-primary"/>
        </c:if>
    </div>
    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>
</div>

</body>
</html>