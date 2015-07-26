<%@ page import="java.util.List" %>
<%@ page import="entity.Account" %>
<%@ page import="dao.AccountDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/datepicker/css/datepicker.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/datepicker/js/bootstrap-datepicker.js"></script>
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
                                    <button type="submit" value="filter" class="btn btn-default" name="action">Lọc kết
                                        quả
                                    </button>
                                </form>
                            </div>

                            <div role="tabpanel">

                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <c:choose>
                                        <c:when test="${user.roleId == 2}">

                                            <li role="presentation" class="active">
                                                <a href="#request"
                                                   aria-controls="request"
                                                   role="tab" data-toggle="tab">Cần giao việc</a>
                                            </li>

                                            <li role="presentation">
                                                <a href="#Assigned" aria-controls="Assigned" role="tab"
                                                   data-toggle="tab">Đã giao</a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#done" aria-controls="done" role="tab"
                                                   data-toggle="tab">Hoàn thành</a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#cancel" aria-controls="cancel" role="tab"
                                                   data-toggle="tab">Hủy</a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li role="presentation" class="active">
                                                <a href="#Assigned" aria-controls="Assigned" role="tab"
                                                   data-toggle="tab">Đã nhận</a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#done" aria-controls="done" role="tab"
                                                   data-toggle="tab">Hoàn thành</a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#cancel" aria-controls="cancel" role="tab"
                                                   data-toggle="tab">Hủy</a>
                                            </li>

                                        </c:otherwise>
                                    </c:choose>

                                </ul>
                                <% AccountDAO acc = new AccountDAO();
                                    List<Account> listAcc = acc.findStaff();%>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <c:if test="${user.roleId == 2}">
                                        <div role="tabpanel" class="tab-pane active" id="request">
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
                                                <c:forEach var="item" items="${list}" varStatus="index">
                                                    <c:if test="${item.repairStatusId == 1}">
                                                        <tr>
                                                            <form action="repair?action=editing" method="post"
                                                                  name="repair">
                                                                <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                                <td>${item.contractByContractId.customerUsername}</td>
                                                                <td>
                                                                    <fmt:formatDate value="${item.createTime}"
                                                                                    pattern="yyyy-MM-dd hh:mm"/>

                                                                </td>
                                                                <td>${item.description}</td>
                                                                <td>
                                                                    <input type="hidden" name="id"
                                                                           value="${item.id}">
                                                                    <input type="hidden" name="contractId"
                                                                           value="${item.contractId}">
                                                                    <input type="hidden" name="description"
                                                                           value="${item.description}">
                                                                    <select name="assignedStaff"
                                                                            class="form-control">
                                                                        <option value="">(Không có đề xuất)</option>
                                                                        <c:forEach var="itemAcc"
                                                                                   items="<%= listAcc %>">
                                                                            <option value="${itemAcc.username}"
                                                                                    <c:if test="${suggestMap[item.id].assignedStaff == itemAcc.username}">selected</c:if> >
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
                                                                    <a class="btn"
                                                                       href="repair?action=edit&id=${item.id}">
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
                                    <c:choose>
                                        <c:when test="${user.roleId == 3}">
                                            <div role="tabpanel" class="tab-pane active" id="Assigned">
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
                                                        <c:if test="${item.repairStatusId == 2}">
                                                            <tr>
                                                                <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                                <td>${item.contractByContractId.customerUsername}</td>
                                                                <td>${item.assignedTime}</td>
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
                                        </c:when>
                                        <c:otherwise>
                                            <div role="tabpanel" class="tab-pane" id="Assigned">
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
                                                        <c:if test="${item.repairStatusId == 2}">
                                                            <tr>
                                                                <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                                <td>${item.contractByContractId.customerUsername}</td>
                                                                <td>${item.assignedTime}</td>
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
                                        </c:otherwise>
                                    </c:choose>

                                    <div role="tabpanel" class="tab-pane" id="done">
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
                                                <c:if test="${item.repairStatusId == 3}">
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
                                    <div role="tabpanel" class="tab-pane" id="cancel">
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
                                                <c:if test="${item.repairStatusId == 4}">
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
                                    <div>
                                        <nav>
                                            <ul class="pagination">
                                                <li id="prev" class="disabled">
                                                    <a href="#" onclick="prev()" aria-label="Previous">
                                                        <span aria-hidden="true">«</span>
                                                    </a>
                                                </li>
                                                <c:forEach var="i" begin="1" end="${pageCount}">
                                                    <li id="item-${i}" class="items <c:if test="${i==1}">active</c:if>">
                                                        <a href="#" onclick="goto(${i})">${i}</a></li>

                                                </c:forEach>
                                                <li id="next">
                                                    <a href="#" onclick="next()" aria-label="Next">
                                                        <span aria-hidden="true">»</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
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

<script type="text/javascript">
    $(document).ready(function () {
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        $('.datetime').datepicker({
            format: 'yyyy-mm-dd',
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).data('datepicker');

    });
    var pageNumber = 1;
    var pageCount = ${pageCount};
    var prev = function () {
        if (pageNumber > 1) {
            pageNumber--;
            getPage(pageNumber);
        }
    };
    var next = function () {
        if (pageNumber < pageCount) {
            pageNumber++;
            getPage(pageNumber);
        }
    };
    var goto = function (i) {
        pageNumber = i;
        getPage(pageNumber);
    };
    var getPage = function (page) {
        var selector = $(".items");
        selector.removeClass("active");
        $(selector[page - 1]).addClass("active");
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
            url: "repair",
            data: {
                action: "page",
                startPage: page
            }
        }).done(function (data) {
            $("#table-body").html(data);
        });
    };
</script>

</body>
</html>


