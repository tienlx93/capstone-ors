<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.AppointmentStatusDAO" %>
<%@ page import="entity.AppointmentStatus" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.AccountDAO" %>
<%@ page import="entity.Account" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 02/06/2015
  Time: 1:04 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
        type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
        type="text/css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
  <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/office.less" type="text/css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
  <script type="text/javascript"
          src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
  <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
  <div class="page-header">
    <h1 class="title">Quản lý lịch hẹn</h1>
  </div>

  <div class="container-padding">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div>
            <form action="appointment?action=editing" method="post">
              <div class="form-group" hidden>
                <label for="id">Id</label>
                <%--<input type="text" name="name" class="" id="id" value="${office.name}">--%>
                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
              </div>

              <div class="form-group">
                <label for="customerName">Khách hàng</label>
                ${info.accountByCustomerUsername.username}
                <input type="hidden" id="customerName"
                       value="${info.accountByCustomerUsername.username}">
              </div>

              <div class="form-group">
                <label for="nameOfiice">Tên văn phòng</label>
                ${info.officeByOfficeId.name}
                <input type="hidden" id="nameOfiice"
                       value="${info.officeByOfficeId.name}">
              </div>


              <div class="form-group">
                <label for="assignedStaff">Nhân viên được giao</label>
                <% AccountDAO acc = new AccountDAO();
                  List<Account> listAcc = acc.findStaff();%>
                <c:choose>
                  <c:when test="${info.statusId != 1}">
                    ${info.assignedStaff}
                    <input type="hidden" name="assignedStaff" id="assignedStaff"
                           value="${info.assignedStaff}">
                  </c:when>
                  <c:otherwise>
                    <select name="assignedStaff" id="assignedStaff">
                      <c:forEach var="itemAcc" items="<%= listAcc %>">
                        <option value="">Chọn nhân viên</option>
                        <option value="${itemAcc.username}"
                                <c:if test="${info.assignedStaff==itemAcc.username}">selected</c:if>>${itemAcc.username}</option>
                      </c:forEach>
                    </select>
                  </c:otherwise>
                </c:choose>
              </div>

              <div class="form-group">
                <label for="time">Thời gian</label>
                <c:choose>
                  <c:when test="${info.statusId != 1}">
                    ${info.time}
                    <input type="hidden" name="time" id="time"
                           value="${info.time}">
                  </c:when>
                  <c:otherwise>
                        <textarea type="text" name="time" id="time">${info.time}</textarea>
                  </c:otherwise>
                </c:choose>

              </div>

              <div class="form-group">
                <label for="appointmentStatusId">Tình trạng</label>
                <%--<% AppointmentStatusDAO dao = new AppointmentStatusDAO();--%>
                  <%--List<AppointmentStatus> list = dao.findAll();%>--%>
                    ${info.appointmentStatusByStatusId.description}
                    <input type="hidden" name="appointmentStatusId" id="appointmentStatusId"
                           value="${info.appointmentStatusByStatusId.name}">
              </div>

              <div class="button-post">

                  <c:choose>
                    <c:when test="${info.statusId == 1}">
                      <button type="submit" name="button" value="reject">Hủy lịch hẹn</button>
                      <button type="submit" name="button" value="assign">Giao việc</button>
                    </c:when>
                    <c:when test="${info.statusId == 3}">
                      <a href="${pageContext.request.contextPath}/admin/contract?action=new&id=${info.id}" class="btn btn-default">Tạo hợp đồng</a>
                    </c:when>
                    <c:otherwise>
                      <a href="${pageContext.request.contextPath}/admin/appointment" class="btn btn-default">Quay về</a>
                    </c:otherwise>
                  </c:choose>

              </div>

            </form>

          </div>

        </div>
      </div>
    </div>
  </div>

  <jsp:include page="/WEB-INF/admin/bottom.jsp"/>

</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/upload.js" charset="UTF-8"></script>


</body>
</html>
