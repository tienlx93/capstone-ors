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
        <h1 class="title">Quản lý yêu cầu sửa chữa</h1>
    </div>
    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Danh sách sửa chữa
                    </div>
                    <div>
                        <c:if test="${user.roleId == 2}">
                            <div class="panel-body">

                                <div role="tabpanel">

                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#managerRequest"
                                                                                  aria-controls="managerRequest"
                                                                                  role="tab" data-toggle="tab">Chờ xử
                                            lí</a>
                                        </li>
                                        <li role="presentation"><a href="#managerAssign" aria-controls="managerAssign" role="tab"
                                                                   data-toggle="tab">Giao việc</a></li>
                                        <li role="presentation"><a href="#managerDone" aria-controls="managerDone" role="tab"
                                                                   data-toggle="tab">Hoàn thành</a></li>
                                        <li role="presentation"><a href="#managerCancel" aria-controls="managerCancel" role="tab"
                                                                   data-toggle="tab">Hủy</a></li>
                                    </ul>

                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active" id="managerRequest">
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
                                                <c>
                                                    <c:forEach var="item" items="${list}">
                                                    <c:if test="${item.repairStatusByRepairStatusId.id == 1}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>${item.contractByContractId.customerUsername}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td content="${item.assignedStaff}"></td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="repair?action=edit&id=${item.id}">Xem chi tiết</a>
                                                        </td>
                                                    </tr>
                                                    </c:if>
                                                    </c:forEach>
                                                    </tbody>
                                            </table>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="managerAssign">
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
                                                <c>
                                                    <c:forEach var="item" items="${list}">
                                                    <c:if test="${item.repairStatusByRepairStatusId.id == 2}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>${item.contractByContractId.customerUsername}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignedStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="repair?action=edit&id=${item.id}">Xem chi tiết</a>
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
                                                <c>
                                                    <c:forEach var="item" items="${list}">
                                                    <c:if test="${item.repairStatusByRepairStatusId.id == 3}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>${item.contractByContractId.customerUsername}</td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignedStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="repair?action=edit&id=${item.id}">Xem chi tiết</a>
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
                                                    <c:if test="${item.repairStatusByRepairStatusId.id == 4}">
                                                        <tr>
                                                            <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                            <td>${item.contractByContractId.customerUsername}</td>
                                                            <c:if test="${user.roleId == 2}">
                                                                <td>${item.assignedStaff}</td>
                                                            </c:if>
                                                            <td>${item.description}</td>

                                                            <td><a href="repair?action=edit&id=${item.id}">Xem chi
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
                        </c:if>
                    </div>
                    <div>
                        <c:if test="${user.roleId == 3}">
                            <div class="panel-body">

                                <div role="tabpanel">

                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <%--<li role="presentation" ><a href="#request"
                                                                                  aria-controls="1"
                                                                                  role="tab" data-toggle="tab">Chờ xử
                                            lí</a>
                                        </li>--%>
                                        <li role="presentation" class="active"><a href="#assigned" aria-controls="1"
                                                                                  role="tab"
                                                                                  data-toggle="tab">Việc được giao</a>
                                        </li>
                                        <li role="presentation"><a href="#done" aria-controls="2" role="tab"
                                                                   data-toggle="tab">Hoàn thành</a></li>
                                        <li role="presentation"><a href="#cancel" aria-controls="3" role="tab"
                                                                   data-toggle="tab">Hủy</a></li>
                                    </ul>

                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <%--<div role="tabpanel" class="tab-pane active" id="request">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>Tên văn phòng</th>
                                                    <th>Khách hàng</th>
                                                    <c:if test="${user.roleId == 3}">
                                                        <th>Nhân viên được giao</th>
                                                    </c:if>
                                                    <th>Mô tả</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <c>
                                                    <c:forEach var="item" items="${list}">
                                                    <c:if test="${item.repairStatusByRepairStatusId.id == 1}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>${item.contractByContractId.customerUsername}</td>
                                                        <c:if test="${user.roleId == 3}">
                                                            <td content="${item.assignedStaff}"></td>
                                                        </c:if>
                                                        <td>${item.description}</td>

                                                        <td><a href="repair?action=edit&id=${item.id}">Xem chi tiết</a>
                                                        </td>
                                                    </tr>
                                                    </c:if>
                                                    </c:forEach>
                                                    </tbody>
                                            </table>
                                        </div>--%>
                                        <div role="tabpanel" class="tab-pane active" id="assigned">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>Tên văn phòng</th>
                                                    <th>Khách hàng</th>
                                                    <c:if test="${user.roleId == 3}">
                                                        <th>Nhân viên được giao</th>
                                                    </c:if>
                                                    <th>Mô tả</th>

                                                    <th></th>
                                                </tr>
                                                </thead>

                                                <c:forEach var="item" items="${list}">
                                                    <c:if test="${item.repairStatusByRepairStatusId.id == 2}">
                                                        <tr>
                                                            <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                            <td>${item.contractByContractId.customerUsername}</td>
                                                            <c:if test="${user.roleId == 3}">
                                                                <td>${item.assignedStaff}</td>
                                                            </c:if>
                                                            <td>${item.description}</td>

                                                            <td><a href="repair?action=edit&id=${item.id}">Xem chi
                                                                tiết</a>
                                                            </td>
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="done">
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>Tên văn phòng</th>
                                                    <th>Khách hàng</th>
                                                    <c:if test="${user.roleId == 3}">
                                                        <th>Nhân viên được giao</th>
                                                    </c:if>
                                                    <th>Mô tả</th>

                                                    <th></th>
                                                </tr>
                                                </thead>

                                                <c:forEach var="item" items="${list}">
                                                    <c:if test="${item.repairStatusByRepairStatusId.id == 3}">
                                                        <tr>
                                                            <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                            <td>${item.contractByContractId.customerUsername}</td>
                                                            <c:if test="${user.roleId == 3}">
                                                                <td>${item.assignedStaff}</td>
                                                            </c:if>
                                                            <td>${item.description}</td>

                                                            <td><a href="repair?action=edit&id=${item.id}">Xem chi
                                                                tiết</a>
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
                                                    <th>Tên văn phòng</th>
                                                    <th>Khách hàng</th>
                                                    <c:if test="${user.roleId == 3}">
                                                        <th>Nhân viên được giao</th>
                                                    </c:if>
                                                    <th>Mô tả</th>

                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <c>
                                                    <c:forEach var="item" items="${list}">
                                                    <c:if test="${item.repairStatusByRepairStatusId.id == 4}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>${item.contractByContractId.customerUsername}</td>
                                                        <c:if test="${user.roleId == 3}">
                                                            <td>${item.assignedStaff}</td>
                                                        </c:if>
                                                        <td>${item.description}</td>
                                                        >
                                                        <td><a href="repair?action=edit&id=${item.id}">Xem chi tiết</a>
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
                        </c:if>
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


