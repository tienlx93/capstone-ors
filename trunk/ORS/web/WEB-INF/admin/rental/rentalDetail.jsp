<%@ page import="java.util.List" %>
<%@ page import="dao.AccountDAO" %>
<%@ page import="entity.Account" %>
<%@ page import="dao.RepairStatusDAO" %>
<%@ page import="entity.RepairStatus" %>
<%@ page import="dao.RentalDetailDAO" %>
<%@ page import="entity.RentalDetail" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 09/06/2015
  Time: 12:08 SA
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
                        Xem chi tiết
                    </div>
                    <div>
                        <form action="rental?action=editing" method="post">
                            <div class="form-group" hidden>
                                <label for="id">Id</label>
                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>

                            <div class="form-group clearfix">
                                <label for="contractId" class="col-sm-2 control-label">Hợp đồng</label>

                                <div class="col-sm-10">
                                    ${info.contractId}<input type="hidden" name="contractId" id="contractId"
                                                             value="${info.contractId}">
                                </div>

                            </div>
                            <div class="form-group clearfix">
                                <label for="assignStaff" class="col-sm-2 control-label">Nhân viên được giao</label>

                                <% AccountDAO acc = new AccountDAO();
                                    List<Account> listAcc = acc.findAll();%>
                                <div class="col-sm-10">
                                    <select name="assignStaff" id="assignStaff" class="form-control">
                                        <c:forEach var="itemAcc" items="<%= listAcc %>">
                                            <option value="${itemAcc.username}"
                                                    <c:if test="${info.assignStaff==itemAcc.username}">selected</c:if>>${itemAcc.username}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>


                            <div class="form-group clearfix">
                                <label for="description" class="col-sm-2 control-label">Mô tả</label>

                                <div class="col-sm-10">
                                    <textarea type="text" name="description" class="form-control"
                                              id="description">${info.description}</textarea>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="statusId" class="col-sm-2 control-label">Tình trạng</label>
                                <% RepairStatusDAO dao = new RepairStatusDAO();
                                    List<RepairStatus> list = dao.findAll();%>
                                <div class="col-sm-10">
                                    <select name="statusId" id="statusId" class="form-control">
                                        <c:forEach var="item" items="<%= list %>">
                                            <option value="${item.id}"
                                                    <c:if test="${info.statusId==item.id}">selected</c:if>
                                                    >${item.description}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="list" class="col-sm-2 control-label clearfix">Thông tin thiết bị</label>
                                <% RentalDetailDAO rdd = new RentalDetailDAO();
                                    List<RentalDetail> detailList = rdd.findAll();%>
                                <div>
                                    <table class="table" id="list">
                                        <thead>
                                        <tr>
                                            <th>Thiết bị</th>
                                            <th>Giá</th>
                                            <th>Số lượng</th>
                                            <th>Thành tiền</th>
                                            <%--<th></th>--%>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="<%= detailList %>">
                                            <tr>
                                                <td>${item.rentalItemByRentalItemId.name}</td>
                                                <td>${item.unitPrice} VNĐ</td>
                                                <td>${item.quantity} (cái)</td>
                                                <td>${item.unitPrice * item.quantity} VNĐ</td>
                                                    <%--<td><a href="repair?action=edit&id=${item.id}">Chỉnh sửa</a></td>--%>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="button-post">
                                <button type="submit" name="action">Lưu</button>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>

</div>

</body>
</html>
