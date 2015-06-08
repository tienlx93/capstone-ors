<%@ page import="dao.RepairDAO" %>
<%@ page import="entity.Repair" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 01/06/2015
  Time: 6:58 CH
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
        <h1 class="title">Quản lý yêu cầu khách hàng</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Danh sách yêu cầu
                    </div>
                    <% RepairDAO dao = new RepairDAO();
                        List<Repair> list = dao.findAll();%>
                    <div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Hợp đồng</th>
                                <th>Nhân viên được giao</th>
                                <th>Mô tả</th>
                                <th>Tình trạng</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="<%= list %>">
                                <tr>
                                    <td>${item.contractId}</td>
                                    <td>${item.assignedStaff}</td>
                                    <td>${item.description}</td>
                                    <td>${item.repairStatusByRepairStatusId.description}</td>
                                    <td><a href="Repair?action=edit&id=${item.id}">Chỉnh sửa</a></td>
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


<%--<head>
    <title>Repair</title>
</head>
<body>
<h1>Repair List</h1>
<% RepairDAO dao = new RepairDAO();
    List<Repair> list = dao.findAll();%>
<table>
    <tr>
        <td>Hợp đồng</td>
        <td>Nhân viên được giao</td>
        <td>Loại yêu cầu</td>
        <td>Mô tả</td>
        <td>Tình trạng</td>
        <td></td>
    </tr>
    <c:forEach var="item" items="<%= list %>">
        <tr>
            <td>${item.contractId}</td>
            <td>${item.assignedStaff}</td>
            <td>${item.type}</td>
            <td>${item.description}</td>
            <td>${item.repairStatusByRepairStatusId.name}</td>

            <td><a href="Repair?action=edit&id=${item.id}">Xem chi tiết</a></td>

        </tr>
    </c:forEach>
</table>--%>
</body>
</html>


