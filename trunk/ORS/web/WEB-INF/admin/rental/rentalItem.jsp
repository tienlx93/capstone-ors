<%@ page import="dao.RentalItemDAO" %>
<%@ page import="entity.RentalItem" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 10/06/2015
  Time: 10:54 SA
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
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title">Quản lý thiết bị</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Danh sách thiết bị
                    </div>
                    <div>
                        <a class="btn" href="${pageContext.request.contextPath}/admin/rental?action=new">
                            <span class="icon color5"><i class="fa fa-plus"></i></span>
                            Thêm mới thiết bị
                        </a>
                    </div>
                    <% RentalItemDAO dao = new RentalItemDAO();
                        List<RentalItem> list = dao.findAll();%>
                    <div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Tên</th>
                                <th>Mô tả</th>
                                <th>Giá (VNĐ)</th>
                                <th>Số lượng (cái)</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="<%= list %>">
                                <tr>
                                    <td>${item.name}</td>
                                    <td>${item.description}</td>
                                    <td>${item.price}</td>
                                    <td>${item.quantity}</td>
                                    <td><a href="rentalItem?action=edit&id=${item.id}">Chỉnh sửa</a></td>
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
