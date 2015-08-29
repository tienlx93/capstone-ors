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
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/typeahead.bundle.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/listjs/list.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/listjs/list.pagination.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/datepicker/js/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootbox.min.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title">Quản lí yêu cầu sửa chữa</h1>
    </div>
    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Danh sách sửa chữa
                    </div>
                    <div>
                        <% AccountDAO acc = new AccountDAO();
                            List<Account> listAcc = acc.findStaff();%>
                        <div class="panel-body">
                            <div>
                                <form class="form-inline" action="repair">
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
                                            <select name="staff" id="staff" class="form-control">
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
                                    <a href="/admin/repair" class="btn btn-default">Bỏ lọc</a>
                                </form>
                            </div>
                            <div>&nbsp;</div>

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
                                                <a href="#assigned" aria-controls="assigned" role="tab"
                                                   data-toggle="tab">Đã giao</a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#confirm" aria-controls="confirm" role="tab"
                                                   data-toggle="tab">Chờ khách hàng xác nhận</a>
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
                                                <a href="#assigned" aria-controls="assigned" role="tab"
                                                   data-toggle="tab">Cần xác nhận</a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#confirm" aria-controls="confirm" role="tab"
                                                   data-toggle="tab">Việc của tôi</a>
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

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <c:if test="${user.roleId == 2}">
                                        <div role="tabpanel" class="tab-pane active" id="request">
                                            <table class="table striped">
                                                <thead>
                                                <tr>
                                                    <th>Tên văn phòng</th>
                                                    <th>Khách hàng</th>
                                                    <th>Ngày tạo yêu cầu</th>

                                                    <th>Đề xuất nhân viên</th>
                                                    <th>Đề xuất thời gian</th>

                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody class="list">
                                                <c:forEach var="item" items="${list}" varStatus="index">
                                                    <c:if test="${item.repairStatusId == 1}">
                                                        <tr>
                                                            <form action="repair?action=editing" method="post"
                                                                  class="assignForm">
                                                                <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                                <td>
                                                                    <a href="repair?action=viewProfile&username=${item.contractByContractId.customerUsername}">
                                                                            ${item.contractByContractId.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate value="${item.createTime}"
                                                                                    pattern="dd-MM-yyyy"/>
                                                                </td>
                                                                <td>
                                                                    <input type="hidden" name="id"
                                                                           value="${item.id}">
                                                                    <input type="hidden" name="contractId"
                                                                           value="${item.contractId}">
                                                                    <input type="hidden" name="description"
                                                                           value="${item.description}">
                                                                    <input type="hidden" name="endDate"
                                                                           value="${item.contractByContractId.endDate}"
                                                                           id="endDate">
                                                                    <select name="assignedStaff"
                                                                            class="form-control">
                                                                        <option value="">(Không có đề xuất)</option>
                                                                        <c:forEach var="itemAcc"
                                                                                   items="<%= listAcc %>">
                                                                            <option value="${itemAcc.username}"
                                                                                    <c:if
                                                                                            test="${suggestMap[item.id].assignedStaff == itemAcc.username}">selected</c:if> >
                                                                                    ${itemAcc.username}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatDate
                                                                            value="${suggestMap[item.id].assignedTime}"
                                                                            pattern="dd-MM-yyyy" var="newDate"/>
                                                                    <input type="text" name="assignedTime"
                                                                           class="datetime" value="${newDate}">
                                                                </td>

                                                                <td>
                                                                    <input type="hidden" name="button" value="assign"/>

                                                                    <div class="btn-group" role="group">
                                                                        <button class="btn btn-icon btn-default"
                                                                                id="assign" title="Giao việc"
                                                                                type="submit"><i
                                                                                class="fa fa-share color7"></i></button>
                                                                        <a href="repair?action=edit&id=${item.id}"
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
                                            <ul class="pagination pagination-request"></ul>
                                        </div>
                                    </c:if>

                                    <c:choose>
                                        <c:when test="${user.roleId == 3}">
                                            <div role="tabpanel" class="tab-pane active" id="assigned">
                                                <table class="table striped">
                                                    <thead>
                                                    <tr>
                                                        <th>Tên văn phòng</th>
                                                        <th>Khách hàng</th>
                                                        <th>Ngày sửa chữa</th>


                                                        <th></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody class="list">
                                                    <c:forEach var="item" items="${list}">
                                                        <c:if test="${item.repairStatusId == 2}">
                                                            <tr>
                                                                <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                                <td>
                                                                    <a href="repair?action=viewProfile&username=${item.contractByContractId.customerUsername}">
                                                                            ${item.contractByContractId.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                                </td>
                                                                <td><fmt:formatDate pattern="dd-MM-yyyy"
                                                                                    value="${item.assignedTime}"/></td>

                                                                <td>
                                                                    <a href="repair?action=edit&id=${item.id}"
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
                                        </c:when>
                                        <c:otherwise>
                                            <div role="tabpanel" class="tab-pane" id="assigned">
                                                <table class="table striped">
                                                    <thead>
                                                    <tr>
                                                        <th>Tên văn phòng</th>
                                                        <th>Khách hàng</th>
                                                        <th>Ngày sửa chữa</th>
                                                        <th>Nhân viên được giao</th>

                                                        <th></th>
                                                    </tr>
                                                    </thead>
                                                    <tbody class="list">
                                                    <c:forEach var="item" items="${list}">
                                                        <c:if test="${item.repairStatusId == 2}">
                                                            <tr>
                                                                <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                                <td>
                                                                    <a href="repair?action=viewProfile&username=${item.contractByContractId.customerUsername}">
                                                                            ${item.contractByContractId.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                                </td>
                                                                <td><fmt:formatDate pattern="dd-MM-yyyy"
                                                                                    value="${item.assignedTime}"/></td>
                                                                <td>${item.assignedStaff}</td>

                                                                <td>
                                                                    <a href="repair?action=edit&id=${item.id}"
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
                                        </c:otherwise>
                                    </c:choose>

                                    <div role="tabpanel" class="tab-pane" id="confirm">
                                        <table class="table striped">
                                            <thead>
                                            <tr>
                                                <th>Tên văn phòng</th>
                                                <th>Khách hàng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>

                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody class="list">
                                            <c:forEach var="item" items="${list}">
                                                <c:if test="${item.repairStatusId == 5}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>
                                                            <a href="repair?action=viewProfile&username=${item.contractByContractId.customerUsername}">
                                                                    ${item.contractByContractId.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                        </td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignedStaff}</td>
                                                        </c:if>

                                                        <td>
                                                            <a href="repair?action=edit&id=${item.id}"
                                                               title="Chi tiết"
                                                               class="btn btn-icon btn-default"><i
                                                                    class="fa fa-info color5"></i></a>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                        <ul class="pagination pagination-confirm"></ul>
                                    </div>

                                    <div role="tabpanel" class="tab-pane" id="done">
                                        <table class="table striped">
                                            <thead>
                                            <tr>
                                                <th>Tên văn phòng</th>
                                                <th>Khách hàng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>


                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody class="list">
                                            <c:forEach var="item" items="${list}">
                                                <c:if test="${item.repairStatusId == 3}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>
                                                            <a href="repair?action=viewProfile&username=${item.contractByContractId.customerUsername}">
                                                                    ${item.contractByContractId.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                        </td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignedStaff}</td>
                                                        </c:if>

                                                        <td>
                                                            <a href="repair?action=edit&id=${item.id}"
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

                                    <div role="tabpanel" class="tab-pane" id="cancel">
                                        <table class="table striped">
                                            <thead>
                                            <tr>
                                                <th>Tên văn phòng</th>
                                                <th>Khách hàng</th>
                                                <c:if test="${user.roleId == 2}">
                                                    <th>Nhân viên được giao</th>
                                                </c:if>


                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody class="list">
                                            <c:forEach var="item" items="${list}">
                                                <c:if test="${item.repairStatusId == 4}">
                                                    <tr>
                                                        <td>${item.contractByContractId.officeByOfficeId.name}</td>
                                                        <td>
                                                            <a href="repair?action=viewProfile&username=${item.contractByContractId.customerUsername}">
                                                                    ${item.contractByContractId.accountByCustomerUsername.profileByUsername.fullName}</a>
                                                        </td>
                                                        <c:if test="${user.roleId == 2}">
                                                            <td>${item.assignedStaff}</td>
                                                        </c:if>

                                                        <td>
                                                            <a href="repair?action=edit&id=${item.id}"
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
        var endDate = document.getElementById('endDate').value;
        var end = new Date(endDate);

        $('.datetime').datepicker({
            format: 'dd-mm-yyyy',
            onRender: function (date) {
                return (date.valueOf() < now.valueOf() || date.valueOf() > end.valueOf())  ? 'disabled' : '';
            }
        }).data('datepicker');

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

        var request = new List('request', options('request'));
        var assigned = new List('assigned', options('assigned'));
        var confirm = new List('confirm', options('confirm'));
        var done = new List('done', options('done'));
        var cancel = new List('cancel', options('cancel'));
        $('.assignForm').submit(function () {
            var currentForm = this;
            event.preventDefault();
            bootbox.dialog({
                size: 'small',
                message: "Bạn đồng ý giao việc cho nhân viên?",
                buttons: {
                    cancel: {
                        label: "Quay lại",
                        className: "btn-default",
                        callback: function () {

                        }
                    }, ok: {
                        label: "Đồng ý",
                        className: "btn-primary",
                        callback: function () {
                            currentForm.submit();
                        }
                    }
                }
            });

        });
    });

</script>

<%
    if (request.getAttribute("error").equals("error")) {%>
<script type="text/javascript">alert("Vui lòng nhập lại thời gian sửa")</script>
<%      }
%>

</body>
</html>


