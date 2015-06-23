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
                    <% RentalDAO dao = new RentalDAO();
                        List<Rental> list = dao.findAll();%>
                    <div>
                        <c:if test="${user.roleId == 2}">
                        <div class="panel-body">

                            <div role="tabpanel">

                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#home" aria-controls="home"
                                                                              role="tab" data-toggle="tab">Chờ xử lí</a>
                                    </li>
                                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab"
                                                               data-toggle="tab">Giao việc</a></li>
                                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab"
                                                               data-toggle="tab">Hoàn thành</a></li>
                                    <li role="presentation"><a href="#cancel" aria-controls="cancel" role="tab"
                                                               data-toggle="tab">Hủy</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="home">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Hợp đồng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="<%= list %>">
                                                <c:if test="${item.rentalStatusByStatusId.id == 1}">
                                                    <tr>
                                                        <td>${item.contractId}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="profile">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Hợp đồng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="<%= list %>">
                                                <c:if test="${item.rentalStatusByStatusId.id == 2}">
                                                    <tr>
                                                        <td>${item.contractId}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="messages">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Hợp đồng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="<%= list %>">
                                                <c:if test="${item.rentalStatusByStatusId.id == 3}">
                                                    <tr>
                                                        <td>${item.contractId}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="cancel">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Hợp đồng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="<%= list %>">
                                                <c:if test="${item.rentalStatusByStatusId.id == 4}">
                                                    <tr>
                                                        <td>${item.contractId}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            </c:if>
                        </div>
                        <!---->
                    </div>
                    <div>
                        <c:if test="${user.roleId == 3}">
                        <div class="panel-body">

                            <div role="tabpanel">

                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#home" aria-controls="home"
                                                                              role="tab" data-toggle="tab">Chờ xử lí</a>
                                    </li>
                                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab"
                                                               data-toggle="tab">Việc được giao</a></li>
                                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab"
                                                               data-toggle="tab">Hoàn thành</a></li>
                                    <li role="presentation"><a href="#cancel" aria-controls="cancel" role="tab"
                                                               data-toggle="tab">Hủy</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="home">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Hợp đồng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="<%= list %>">
                                                <c:if test="${item.rentalStatusByStatusId.id == 1}">
                                                    <tr>
                                                        <td>${item.contractId}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="profile">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Hợp đồng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="<%= list %>">
                                                <c:if test="${item.rentalStatusByStatusId.id == 2}">
                                                    <tr>
                                                        <td>${item.contractId}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="messages">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Hợp đồng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="<%= list %>">
                                                <c:if test="${item.rentalStatusByStatusId.id == 3}">
                                                    <tr>
                                                        <td>${item.contractId}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="cancel">
                                        <table class="table">
                                            <thead>
                                            <tr>
                                                <th>Hợp đồng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>
                                                <th>Mô tả</th>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="<%= list %>">
                                                <c:if test="${item.rentalStatusByStatusId.id == 4}">
                                                    <tr>
                                                        <td>${item.contractId}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="rental?action=edit&id=${item.id}">Xem chi tiết</a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            </c:if>
                        </div>
                        <!---->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>
</div>
</body>
</html>
