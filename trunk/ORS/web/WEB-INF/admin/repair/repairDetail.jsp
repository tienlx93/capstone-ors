<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.RepairStatusDAO" %>
<%@ page import="entity.RepairStatus" %>
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
        <h1 class="title">Quản lý yêu cầu sửa chữa</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div>
                        <form action="repair?action=editing" method="post">
                            <div class="form-group" hidden>
                                <label for="id">Id</label>
                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>

                            <div class="form-group" hidden>
                                <label for="contractId">Hợp đồng</label>
                                ${info.contractId}<input type="hidden" name="contractId" id="contractId"
                                                         value="${info.contractId}">
                            </div>

                            <div class="form-group">
                                <label for="nameOfiice">Tên văn phòng</label>
                                ${info.contractByContractId.officeByOfficeId.name}
                                <input type="hidden" id="nameOfiice"
                                       value="${info.contractByContractId.officeByOfficeId.name}">
                            </div>

                            <div class="form-group">
                                <label for="customerName">Khách hàng</label>
                                ${info.contractByContractId.customerUsername}
                                <input type="hidden" id="customerName"
                                       value="${info.contractByContractId.customerUsername}">
                            </div>
                            <c:if test="${user.roleId==2}">
                                <div class="form-group">
                                    <label for="assignedStaff">Nhân viên được giao</label>
                                    <% AccountDAO acc = new AccountDAO();
                                        List<Account> listAcc = acc.findStaff();%>
                                    <c:choose>
                                        <c:when test="${info.repairStatusId != 1}">
                                            ${info.assignedStaff}
                                            <input type="hidden" name="assignedStaff" id="assignedStaff"
                                                   value="${info.assignedStaff}">
                                        </c:when>
                                        <c:otherwise>
                                            <select name="assignedStaff" id="assignedStaff">
                                                <c:choose>
                                                    <c:when test="${info.repairStatusId == 1}">
                                                        <option value="" selected></option>
                                                        <c:forEach var="itemAcc" items="<%= listAcc %>">
                                                            <option value="${itemAcc.username}">${itemAcc.username}</option>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value=""></option>
                                                        <c:forEach var="itemAcc" items="<%= listAcc %>">
                                                            <option value="${itemAcc.username}"
                                                                    <c:if test="${info.assignedStaff==itemAcc.username}">selected</c:if>>${itemAcc.username}</option>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </c:if>


                            <div class="form-group">
                                <label for="description">Mô tả</label>
                                <textarea type="text" name="description" id="description">${info.description}</textarea>
                            </div>

                            <div class="form-group">
                                <label for="repairStatusId">Tình trạng</label>
                                <% RepairStatusDAO dao = new RepairStatusDAO();
                                    List<RepairStatus> list = dao.findAll();%>
                                ${info.repairStatusByRepairStatusId.description}
                                <input type="hidden" name="repairStatusId" id="repairStatusId"
                                       value="${info.repairStatusId}">
                            </div>

                            <div class="button-post">
                                <c:choose>
                                    <c:when test="${user.roleId==2}">
                                        <button type="submit" value="assign" name="button" class="btn">Giao việc</button>
                                        <button type="submit" value="reject" name="button" class="btn">Từ chối</button>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${info.repairStatusId == 2}">
                                                <button type="submit" value="change5" name="button" class="btn">Đồng ý sửa chữa</button>
                                                <button type="submit" value="change1" name="button" class="btn">Không đồng ý sửa chữa</button>
                                            </c:when>
                                            <c:when test="${info.repairStatusId == 5}">
                                                <button type="submit" value="change3" name="button" class="btn">Khách hàng hài lòng</button>
                                                <button type="submit" value="change1" name="button" class="btn">Khách hàng không hài lòng</button>
                                            </c:when>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                                <a href="${pageContext.request.contextPath}/admin/repair"
                                   class="btn btn-default">Quay về</a>
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
