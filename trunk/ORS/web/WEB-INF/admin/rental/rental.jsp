<%@ page import="java.util.List" %>
<%@ page import="dao.RentalDAO" %>
<%@ page import="entity.Rental" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 08/06/2015
  Time: 10:31 CH
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
        <h1 class="title">Quản lý yêu cầu thuê thiết bị</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Danh sách thuê thiết bị
                    </div>
                    <%--<% RentalDAO dao = new RentalDAO();--%>
                    <%--List<Rental> list = dao.findAll();%>--%>
                    <div>
                        <div class="panel-body">

                            <div role="tabpanel">

                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <c:if test="${user.roleId == 2}">
                                        <li role="presentation" class="active">
                                            <a href="#managerRequest" aria-controls="managerRequest"
                                               role="tab" data-toggle="tab">Cần giao việc</a>
                                        </li>
                                    </c:if>
                                    <li role="presentation">
                                        <a href="#managerAssign" aria-controls="managerAssign" role="tab"
                                           data-toggle="tab">Việc đã giao</a></li>
                                    <li role="presentation">
                                        <a href="#managerDone" aria-controls="managerDone" role="tab"
                                           data-toggle="tab">Hoàn thành</a></li>
                                    <li role="presentation">
                                        <a href="#managerCancel" aria-controls="managerCancel" role="tab"
                                           data-toggle="tab">Hủy</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <c:if test="${user.roleId == 2}">
                                        <div role="tabpanel" class="tab-pane active" id="managerRequest">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>Tên văn phòng</th>
                                                    <th>Khách hàng</th>
                                                    <th>Ngày tạo yêu cầu</th>
                                                    <th>Mô tả</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" items="${list}">
                                                    <c:if test="${item.statusId == 1}">
                                                        <tr>
                                                            <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                            <td>${item.contractByContractId.customerUsername}</td>
                                                            <td>${item.createTime}</td>
                                                            <td>${item.description}</td>
                                                            <td><a href="rental?action=edit&id=${item.id}">Giao việc</a>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:if>
                                    <div role="tabpanel" class="tab-pane" id="managerAssign">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Tên văn phòng</th>
                                                <th>Khách hàng</th>
                                                <th>Ngày sửa chữa</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${list}">
                                                <c:if test="${item.statusId == 2}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>${item.contractByContractId.customerUsername}</td>
                                                        <td>${item.assignedTime}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi
                                                            tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="managerDone">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Tên văn phòng</th>
                                                <th>Khách hàng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${list}">
                                                <c:if test="${item.statusId == 3}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>${item.contractByContractId.customerUsername}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi
                                                            tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="managerCancel">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Tên văn phòng</th>
                                                <th>Khách hàng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${list}">
                                                <c:if test="${item.statusId == 4}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>${item.contractByContractId.customerUsername}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi
                                                            tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>

</div>
</body>
</html>
