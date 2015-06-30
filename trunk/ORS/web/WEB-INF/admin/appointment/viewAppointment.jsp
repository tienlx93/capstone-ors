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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
          type="text/css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
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
                    <div>
                        <h4>DANH SÁCH LỊCH HẸN</h4>

                        <div>
                            <div class="panel panel-transparent">

                                <div class="panel-title">

                                </div>

                                <div class="panel-body">

                                    <div role="tabpanel">

                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs" role="tablist">
                                            <li role="presentation" class="active">
                                                <a href="#pending" aria-controls="home"
                                                   role="tab" data-toggle="tab">Cần Giao Việc</a>
                                            </li>
                                            <li role="presentation" class="">
                                                <a href="#Assigned"
                                                   aria-controls="Assigned" role="tab"
                                                   data-toggle="tab">Đã Giao</a>
                                            </li>
                                            <li role="presentation" class="">
                                                <a href="#Accepted"
                                                   aria-controls="Accepted" role="tab"
                                                   data-toggle="tab">Chấp Nhận</a>
                                            </li>
                                            <li role="presentation" class="">
                                                <a href="#done" aria-controls="done"
                                                   role="tab" data-toggle="tab">Hoàn Thành</a>
                                            </li>
                                            <li role="presentation" class="">
                                                <a href="#cancel" aria-controls="cancel"
                                                   role="tab" data-toggle="tab">Hủy</a>
                                            </li>
                                        </ul>

                                        <!-- Tab panes -->
                                        <div class="tab-content">

                                            <div role="tabpanel" class="tab-pane active" id="pending">
                                                <div>
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th>Khách hàng</th>
                                                            <th>Văn phòng</th>
                                                            <th>Thời gian</th>

                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${data}" var="item">
                                                            <c:if test="${item.statusId == 1}">
                                                                <tr>
                                                                    <td>${item.accountByCustomerUsername.username}</td>
                                                                    <td>${item.officeByOfficeId.name}</td>
                                                                    <td>${item.time}</td>

                                                                    <td>
                                                                        <a class="btn"
                                                                           href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}">
                                                                            Giao việc
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!--end table-->
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="Assigned">
                                                <div>
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th>Khách hàng</th>
                                                            <c:if test="${user.roleId == 2}">
                                                                <th>Nhân viên</th>
                                                            </c:if>
                                                            <th>Văn phòng</th>
                                                            <th>Thời gian</th>

                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${data}" var="item">
                                                            <c:if test="${item.statusId == 2}">
                                                                <tr>
                                                                    <td>${item.accountByCustomerUsername.username}</td>
                                                                    <c:if test="${user.roleId == 2}">
                                                                        <td>${item.accountByAssignedStaff.username}</td>
                                                                    </c:if>
                                                                    <td>${item.officeByOfficeId.name}</td>
                                                                    <td>${item.time}</td>

                                                                    <td>
                                                                        <a class="btn"
                                                                           href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}">
                                                                            Chi tiết
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!--end table-->
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="Accepted">
                                                <div>
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th>Khách hàng</th>
                                                            <c:if test="${user.roleId == 2}">
                                                                <th>Nhân viên</th>
                                                            </c:if>
                                                            <th>Văn phòng</th>
                                                            <th>Thời gian</th>

                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${data}" var="item">
                                                            <c:if test="${item.statusId == 3}">
                                                                <tr>
                                                                    <td>${item.accountByCustomerUsername.username}</td>
                                                                    <c:if test="${user.roleId == 2}">
                                                                        <td>${item.accountByAssignedStaff.username}</td>
                                                                    </c:if>
                                                                    <td>${item.officeByOfficeId.name}</td>
                                                                    <td>${item.time}</td>

                                                                    <td>
                                                                        <a class="btn"
                                                                           href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}">
                                                                            Đến kí/hủy hợp đồng
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!--end table-->
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="done">
                                                <div>
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th>Khách hàng</th>
                                                            <c:if test="${user.roleId == 2}">
                                                                <th>Nhân viên</th>
                                                            </c:if>
                                                            <th>Văn phòng</th>
                                                            <th>Thời gian</th>

                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${data}" var="item">
                                                            <c:if test="${item.appointmentStatusByStatusId.id == 4}">
                                                                <tr>
                                                                    <td>${item.accountByCustomerUsername.username}</td>
                                                                    <c:if test="${user.roleId == 2}">
                                                                        <td>${item.accountByAssignedStaff.username}</td>
                                                                    </c:if>
                                                                    <td>${item.officeByOfficeId.name}</td>
                                                                    <td>${item.time}</td>

                                                                    <td>
                                                                        <a class="btn"
                                                                           href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}">
                                                                            Chi tiết
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!--end table-->
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="cancel">
                                                <div>
                                                    <table class="table">
                                                        <thead>
                                                        <tr>
                                                            <th>Khách hàng</th>
                                                            <c:if test="${user.roleId == 2}">
                                                                <th>Nhân viên</th>
                                                            </c:if>
                                                            <th>Văn phòng</th>
                                                            <th>Thời gian</th>

                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:forEach items="${data}" var="item">
                                                            <c:if test="${item.appointmentStatusByStatusId.id == 5}">
                                                                <tr>
                                                                    <td>${item.accountByCustomerUsername.username}</td>
                                                                    <c:if test="${user.roleId == 2}">
                                                                        <td>${item.accountByAssignedStaff.username}</td>
                                                                    </c:if>
                                                                    <td>${item.officeByOfficeId.name}</td>
                                                                    <td>${item.time}</td>

                                                                    <td>
                                                                        <a class="btn"
                                                                           href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}">
                                                                            Chi tiết
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <!--end table-->
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                        <!--end div tab-->

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--end div danh sach lich hen-->


    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>
</div>

</body>
</html>
