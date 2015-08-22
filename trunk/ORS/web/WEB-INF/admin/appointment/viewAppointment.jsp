<%@ page import="dao.AccountDAO" %>
<%@ page import="entity.Account" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/typeahead.bundle.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/listjs/list.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/listjs/list.pagination.min.js"></script>
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
                                <% AccountDAO acc = new AccountDAO();
                                    List<Account> listAcc = acc.findStaff();%>
                                <div class="panel-body">

                                    <div>
                                        <form class="form-inline" action="appointment">
                                            <input type="hidden" name="action" value="filter">

                                            <div class="form-group">
                                                <label>Văn phòng
                                                    <div class="input-typeahead">
                                                        <input type="text" class="form-control typeahead" id="office"
                                                               name="office" value="${office}">
                                                    </div>
                                                </label>
                                            </div>
                                            <c:if test="${user.roleId == 2}">
                                                <div class="form-group">
                                                    <label for="staff">Nhân viên</label>
                                                    <select name="staff"
                                                            id="staff"
                                                            class="form-control">
                                                        <option value="">Chọn nhân viên...</option>
                                                        <c:forEach var="itemAcc"
                                                                   items="<%= listAcc %>">
                                                            <option value="${itemAcc.username}"
                                                                    <c:if test="${staff==itemAcc.username}">selected</c:if>>
                                                                    ${itemAcc.username}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </c:if>
                                            <button type="submit" class="btn btn-default">Lọc kết quả</button>
                                            <a href="/admin/appointment" class="btn btn-default">Bỏ lọc</a>
                                        </form>
                                    </div>
                                    <div>&nbsp;</div>
                                    <div role="tabpanel">

                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs" role="tablist">
                                            <c:choose>
                                                <c:when test="${user.roleId == 2}">
                                                    <li role="presentation" class="active">
                                                        <a href="#pending" aria-controls="home"
                                                           role="tab" data-toggle="tab">Cần Giao Việc</a>
                                                    </li>
                                                    <li role="presentation" class="">
                                                        <a href="#assigned"
                                                           aria-controls="Assigned" role="tab"
                                                           data-toggle="tab">Đã Giao</a>
                                                    </li>
                                                    <li role="presentation" class="">
                                                        <a href="#accepted"
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
                                                </c:when>
                                                <c:otherwise>
                                                    <li role="presentation" class="active">
                                                        <a href="#assigned"
                                                           aria-controls="Assigned" role="tab"
                                                           data-toggle="tab">Được Giao</a>
                                                    </li>
                                                    <li role="presentation" class="">
                                                        <a href="#accepted"
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
                                                </c:otherwise>
                                            </c:choose>

                                        </ul>

                                        <!-- Tab panes -->

                                        <div class="tab-content">
                                            <c:if test="${user.roleId == 2}">
                                                <div role="tabpanel" class="tab-pane active" id="pending">
                                                    <div>
                                                        <table class="table table-striped" id="table-pending">
                                                            <thead>
                                                            <tr>
                                                                <th>Khách hàng</th>
                                                                <th>Văn phòng</th>
                                                                <th>Thời gian gặp</th>
                                                                <th>Đề xuất nhân viên</th>

                                                            </tr>
                                                            </thead>
                                                            <tbody class="list">
                                                            <c:forEach items="${data}" var="item" varStatus="index">
                                                                <c:if test="${item.statusId == 1}">
                                                                    <tr>
                                                                        <form action="appointment?action=editing"
                                                                              method="post">
                                                                            <td><a class="btn"
                                                                                   href="contract?action=viewProfile&username=${item.accountByCustomerUsername.username}">${item.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                                            </td>
                                                                            <td>${item.officeByOfficeId.name}</td>
                                                                            <td>
                                                                                <fmt:formatDate value="${item.time}"
                                                                                                pattern="dd-MM-yyyy hh:mm a"/>
                                                                            </td>
                                                                            <td>
                                                                                <input type="hidden" name="id"
                                                                                       value="${item.id}">
                                                                                <select name="assignedStaff"
                                                                                        id="assignedStaff"
                                                                                        class="form-control">
                                                                                    <option value="">(Không có đề xuất)
                                                                                    </option>
                                                                                    <c:forEach var="itemAcc"
                                                                                               items="<%= listAcc %>">
                                                                                        <option value="${itemAcc.username}"
                                                                                                <c:if
                                                                                                        test="${suggestMap[item.id] == itemAcc.username}">selected</c:if>>
                                                                                                ${itemAcc.username}
                                                                                        </option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </td>

                                                                            <td>
                                                                                <div class="btn-group" role="group">
                                                                                    <button class="btn btn-icon btn-default"
                                                                                            id="assign"
                                                                                            title="Giao việc"
                                                                                            type="submit" name="button"
                                                                                            value="assign"><i
                                                                                            class="fa fa-share color7"></i>
                                                                                    </button>
                                                                                    <a href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}"
                                                                                       title="Chi tiết"
                                                                                       class="btn btn-icon btn-default"><i
                                                                                            class="fa fa-info color5"></i></a>
                                                                                </div>
                                                                            </td>
                                                                        </form>
                                                                    </tr>
                                                                </c:if>
                                                            </c:forEach>
                                                            </tbody>
                                                        </table>
                                                        <ul class="pagination pagination-pending"></ul>
                                                    </div>
                                                    <!--end table-->
                                                </div>
                                            </c:if>
                                            <c:choose>
                                                <c:when test="${user.roleId == 3}">
                                                    <div role="tabpanel" class="tab-pane active" id="assigned">
                                                        <div>
                                                            <table class="table table-striped">
                                                                <thead>
                                                                <tr>
                                                                    <th>Khách hàng</th>
                                                                    <c:if test="${user.roleId == 2}">
                                                                        <th>Nhân viên</th>
                                                                    </c:if>
                                                                    <th>Văn phòng</th>
                                                                    <th>Thời gian gặp</th>

                                                                </tr>
                                                                </thead>
                                                                <tbody class="list">
                                                                <c:forEach items="${data}" var="item">
                                                                    <c:if test="${item.statusId == 2}">
                                                                        <tr>
                                                                            <td><a href="contract?action=viewProfile&username=${item.accountByCustomerUsername.username}">${item.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                                            </td>
                                                                            <c:if test="${user.roleId == 2}">
                                                                                <td>${item.accountByAssignedStaff.username}</td>
                                                                            </c:if>
                                                                            <td>${item.officeByOfficeId.name}</td>
                                                                            <td><fmt:formatDate value="${item.time}"
                                                                                                pattern="dd-MM-yyyy hh:mm a"/></td>

                                                                            <td>
                                                                                <a href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}"
                                                                                   title="Chi tiết"
                                                                                   class="btn btn-icon btn-default"><i
                                                                                        class="fa fa-info color5"></i></a>
                                                                            </td>
                                                                        </tr>
                                                                    </c:if>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                            <ul class="pagination pagination-assigned"></ul>
                                                        </div>
                                                        <!--end table-->
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div role="tabpanel" class="tab-pane" id="assigned">
                                                        <div>
                                                            <table class="table table-striped">
                                                                <thead>
                                                                <tr>
                                                                    <th>Khách hàng</th>
                                                                    <c:if test="${user.roleId == 2}">
                                                                        <th>Nhân viên</th>
                                                                    </c:if>
                                                                    <th>Văn phòng</th>
                                                                    <th>Thời gian gặp</th>

                                                                </tr>
                                                                </thead>
                                                                <tbody class="list">
                                                                <c:forEach items="${data}" var="item">
                                                                    <c:if test="${item.statusId == 2}">
                                                                        <tr>
                                                                            <td><a
                                                                                   href="contract?action=viewProfile&username=${item.accountByCustomerUsername.username}">${item.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                                            </td>
                                                                            <c:if test="${user.roleId == 2}">
                                                                                <td>${item.accountByAssignedStaff.username}</td>
                                                                            </c:if>
                                                                            <td>${item.officeByOfficeId.name}</td>
                                                                            <td><fmt:formatDate value="${item.time}"
                                                                                                pattern="dd-MM-yyyy hh:mm a"/></td>

                                                                            <td>
                                                                                <a href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}"
                                                                                   title="Chi tiết"
                                                                                   class="btn btn-icon btn-default"><i
                                                                                        class="fa fa-info color5"></i></a>
                                                                            </td>
                                                                        </tr>
                                                                    </c:if>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                            <ul class="pagination pagination-assigned"></ul>
                                                        </div>
                                                        <!--end table-->
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                            <div role="tabpanel" class="tab-pane" id="accepted">
                                                <div>
                                                    <table class="table table-striped">
                                                        <thead>
                                                        <tr>
                                                            <th>Khách hàng</th>
                                                            <c:if test="${user.roleId == 2}">
                                                                <th>Nhân viên</th>
                                                            </c:if>
                                                            <th>Văn phòng</th>
                                                            <th>Thời gian gặp</th>

                                                        </tr>
                                                        </thead>
                                                        <tbody class="list">
                                                        <c:forEach items="${data}" var="item">
                                                            <c:if test="${item.statusId == 3}">
                                                                <tr>
                                                                    <td><a
                                                                           href="contract?action=viewProfile&username=${item.accountByCustomerUsername.username}">${item.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                                    </td>
                                                                    <c:if test="${user.roleId == 2}">
                                                                        <td>${item.accountByAssignedStaff.username}</td>
                                                                    </c:if>
                                                                    <td>${item.officeByOfficeId.name}</td>
                                                                    <td><fmt:formatDate value="${item.time}"
                                                                                        pattern="dd-MM-yyyy hh:mm a"/></td>

                                                                    <td>
                                                                        <c:if test="${user.roleId == 2}">
                                                                            <a href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}"
                                                                               title="Đến kí / hủy hợp đồng"
                                                                               class="btn btn-icon btn-default"><i
                                                                                    class="fa fa-pencil-square-o color5"></i></a>
                                                                        </c:if>
                                                                        <c:if test="${user.roleId == 3}">
                                                                            <a href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}"
                                                                               title="Chi tiết"
                                                                               class="btn btn-icon btn-default"><i
                                                                                    class="fa fa-info color5"></i></a>
                                                                        </c:if>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <ul class="pagination pagination-accepted"></ul>
                                                </div>
                                                <!--end table-->
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="done">
                                                <div>
                                                    <table class="table table-striped">
                                                        <thead>
                                                        <tr>
                                                            <th>Khách hàng</th>
                                                            <c:if test="${user.roleId == 2}">
                                                                <th>Nhân viên</th>
                                                            </c:if>
                                                            <th>Văn phòng</th>
                                                            <th>Thời gian gặp</th>

                                                        </tr>
                                                        </thead>
                                                        <tbody class="list">
                                                        <c:forEach items="${data}" var="item">
                                                            <c:if test="${item.appointmentStatusByStatusId.id == 4}">
                                                                <tr>
                                                                    <td><a
                                                                           href="contract?action=viewProfile&username=${item.accountByCustomerUsername.username}">${item.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                                    </td>
                                                                    <c:if test="${user.roleId == 2}">
                                                                        <td>${item.accountByAssignedStaff.username}</td>
                                                                    </c:if>
                                                                    <td>${item.officeByOfficeId.name}</td>
                                                                    <td><fmt:formatDate value="${item.time}"
                                                                                        pattern="dd-MM-yyyy hh:mm a"/></td>

                                                                    <td>
                                                                        <a href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}"
                                                                           title="Chi tiết"
                                                                           class="btn btn-icon btn-default"><i
                                                                                class="fa fa-info color5"></i></a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <ul class="pagination pagination-done"></ul>
                                                </div>
                                                <!--end table-->
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="cancel">
                                                <div>
                                                    <table class="table table-striped">
                                                        <thead>
                                                        <tr>
                                                            <th>Khách hàng</th>
                                                            <c:if test="${user.roleId == 2}">
                                                                <th>Nhân viên</th>
                                                            </c:if>
                                                            <th>Văn phòng</th>
                                                            <th>Thời gian gặp</th>

                                                        </tr>
                                                        </thead>
                                                        <tbody class="list">
                                                        <c:forEach items="${data}" var="item">
                                                            <c:if test="${item.appointmentStatusByStatusId.id == 5}">
                                                                <tr>
                                                                    <td><a
                                                                           href="contract?action=viewProfile&username=${item.accountByCustomerUsername.username}">${item.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                                    </td>
                                                                    <c:if test="${user.roleId == 2}">
                                                                        <td>${item.accountByAssignedStaff.username}</td>
                                                                    </c:if>
                                                                    <td>${item.officeByOfficeId.name}</td>
                                                                    <td><fmt:formatDate value="${item.time}"
                                                                                        pattern="dd-MM-yyyy hh:mm a"/></td>

                                                                    <td>
                                                                        <a href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}"
                                                                           title="Chi tiết"
                                                                           class="btn btn-icon btn-default"><i
                                                                                class="fa fa-info color5"></i></a>
                                                                    </td>
                                                                </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                    <ul class="pagination pagination-cancel"></ul>
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
<script>
    $.ajax({
        url: "/api?action=officeName", success: function (result) {
            var data = new Bloodhound({
                datumTokenizer: Bloodhound.tokenizers.whitespace,
                queryTokenizer: Bloodhound.tokenizers.whitespace,
                local: result
            });
            $('input.typeahead').typeahead({
                hint: true,
                highlight: true,
                minLength: 2
            }, {
                name: 'office',
                source: data,
                limit: 5
            });
        }
    });

    var options = function (name) {
        return {
            valueNames: ['name'],
            page: 10,
            plugins: [
                ListPagination({paginationClass: 'pagination-' + name})
            ]
        }
    };

    var pending = new List('pending', options('pending'));
    var assigned = new List('assigned', options('assigned'));
    var accepted = new List('accepted', options('accepted'));
    var done = new List('done', options('done'));
    var cancel = new List('cancel', options('cancel'));


</script>

</body>
</html>