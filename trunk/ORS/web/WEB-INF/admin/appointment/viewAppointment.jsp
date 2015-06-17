<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: XPS
  Date: 6/2/2015
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css" type="text/css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
  <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
  <div class="page-header">
    <h1 class="title">Quản lí lịch hẹn</h1>
  </div>

  <div class="container-padding">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-title">
            Danh sách lịch hẹn
          </div>
          <div>
            <table class="table">
              <thead>
              <tr>
                <th>Khách hàng</th>
                <th>Nhân viên</th>
                <th>Văn phòng</th>
                <th>Thời gian</th>
                <th>Trạng thái</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${data}" var="item">
                <tr>
                  <td>${item.accountByCustomerUsername.username}</td>
                  <td>${item.accountByAssignedStaff.username}</td>
                  <td>${item.officeByOfficeId.name}</td>
                  <td>${item.time}</td>
                  <td>${item.appointmentStatusByStatusId.name}</td>
                  <td>
                    <a class="btn" href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}">
                    <span class="icon color5"><i class="fa fa-plus"></i></span>
                    Cập nhật lịch hẹn
                    </a>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="/WEB-INF/admin/bottom.jsp"/>
</div>

</body>
</html>
