<%@ page import="java.util.List" %>
<%@ page import="dao.RentalDAO" %>
<%@ page import="entity.Rental" %>
<%@ page import="entity.Account" %>
<%@ page import="dao.AccountDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <% AccountDAO acc = new AccountDAO();
        List<Account> listAcc = acc.findStaff();%>
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
                            <div>
                                <form class="form-inline">
                                    <div class="form-group">
                                        <label>Văn phòng
                                            <div class="input-typeahead">
                                                <input type="text" class="form-control typeahead" id="office"
                                                       name="office">
                                            </div>
                                        </label>
                                    </div>

                                    <button type="submit" class="btn btn-default">Lọc kết quả</button>
                                </form>
                            </div>

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
                                                    <th>Đề xuất nhân viên</th>
                                                    <th>Đề xuất thời gian</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="item" items="${data}">
                                                    <c:if test="${item.statusId == 1}">
                                                        <tr>
                                                            <form action="rental" method="post">
                                                                <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                                <td>${item.contractByContractId.customerUsername}</td>
                                                                <td>${item.createTime}</td>
                                                                <td>${item.description}</td>
                                                                <td>
                                                                    <input type="hidden" name="id"
                                                                           value="${item.id}">
                                                                    <input type="hidden" name="contractId"
                                                                           value="${item.contractId}">
                                                                    <input type="hidden" name="description"
                                                                           value="${item.description}">
                                                                    <select name="assignStaff"
                                                                            class="form-control">
                                                                        <option value="">(Không có đề xuất)</option>
                                                                        <c:forEach var="itemAcc"
                                                                                   items="<%= listAcc %>">
                                                                            <option value="${itemAcc.username}"
                                                                                    <c:if test="${suggestMap[item.id].assignStaff == itemAcc.username}">selected</c:if> >
                                                                                    ${itemAcc.username}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate
                                                                            value="${suggestMap[item.id].assignedTime}"
                                                                            pattern="yyyy-MM-dd" var="newDate"/>
                                                                    <input type="text" name="assignedTime"
                                                                           class="datetime" value="${newDate}">
                                                                </td>
                                                                <td>
                                                                    <button class="btn btn-default" id="assign"
                                                                            type="submit" name="button"
                                                                            value="assign">Giao việc
                                                                    </button>
                                                                    <input type="hidden" name="action" value="editing">
                                                                    <a class="btn"
                                                                       href="rental?action=edit&id=${item.id}">
                                                                        Chi tiết
                                                                    </a>
                                                                </td>
                                                            </form>

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
                                            <c:forEach var="item" items="${data}">
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
                                            <c:forEach var="item" items="${data}">
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
                                            <c:forEach var="item" items="${data}">
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
<%--<script>
    var pageNumber = 1;
    var pageCount = ${pageCount};
    var prev = function () {
        if (pageNumber > 1) {
            pageNumber --;
            getPage(pageNumber);
        }
    };
    var next = function () {
        if (pageNumber < pageCount) {
            pageNumber ++;
            getPage(pageNumber);
        }
    };
    var goto = function(i) {
        pageNumber = i;
        getPage(pageNumber);
    };
    var getPage = function(page) {
        var selector = $(".items");
        selector.removeClass("active");
        $(selector[page-1]).addClass("active");
        $("#next").removeClass("disabled");
        $("#prev").removeClass("disabled");
        if (page == pageCount) {
            $("#next").addClass("disabled");
        }
        if (page == 1) {
            $("#prev").addClass("disabled");
        }
        $.ajax({
            method: "GET",
            url: "office",
            data: {
                action: "page",
                startPage: page
            }
        }).done(function (data) {
            $("#table-body").html(data);
        });
    };
</script>--%>
</html>
