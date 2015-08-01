<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/datepicker/css/datepicker.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/office.less" type="text/css">
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
        <h1 class="title">Quản lý lịch hẹn</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div>
                        <form action="appointment?action=editing" method="post" name="appointment">
                            <div class="form-group" hidden>
                                <label for="id">Id</label>
                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>

                            <div class="form-group clearfix">
                                <label for="customerName" class="col-sm-2 control-label">Khách hàng</label>

                                <div class="col-sm-10">
                                    ${info.accountByCustomerUsername.username}
                                    <input type="hidden" id="customerName"
                                           value="${info.accountByCustomerUsername.username}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="nameOfiice" class="col-sm-2 control-label">Tên văn phòng</label>

                                <div class="col-sm-10">
                                    ${info.officeByOfficeId.name}
                                    <input type="hidden" id="nameOfiice"
                                           value="${info.officeByOfficeId.name}">
                                </div>
                            </div>

                            <c:if test="${user.roleId==2}">
                                <div class="form-group clearfix">
                                    <label for="assignedStaff" class="col-sm-2 control-label">Nhân viên được
                                        giao</label>
                                    <% AccountDAO acc = new AccountDAO();
                                        List<Account> listAcc = acc.findStaff();%>
                                    <div class="col-sm-10">
                                        <c:choose>
                                            <c:when test="${info.statusId == 5 || info.statusId == 4 || info.statusId == 3}">
                                                ${info.assignedStaff}
                                                <input type="hidden" name="assignedStaff" id="assignedStaff"
                                                       value="${info.assignedStaff}">
                                            </c:when>
                                            <c:otherwise>
                                                <select name="assignedStaff" id="assignedStaff" class="form-control">
                                                    <c:choose>
                                                        <c:when test="${info.statusId == 1}">
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
                                </div>
                            </c:if>


                            <div class="form-group clearfix">
                                <label for="time" class="col-sm-2 control-label">Thời gian gặp</label>
                                <c:choose>
                                    <c:when test="${user.roleId==2}">
                                        <div class="col-sm-10">
                                            <input type='text' class="form-control"
                                                   name="time"
                                                   id="time"
                                                   value="${info.time}"/>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        ${info.time}
                                    </c:otherwise>
                                </c:choose>

                                <%--<div class="col-sm-10">--%>
                                <%--${info.time}--%>
                                <%--</div>--%>
                            </div>

                            <div class="form-group clearfix">
                                <label for="appointmentStatusId" class="col-sm-2 control-label">Tình trạng</label>

                                <div class="col-sm-10">
                                    ${info.appointmentStatusByStatusId.description}
                                    <input type="hidden" name="appointmentStatusId" id="appointmentStatusId"
                                           value="${info.appointmentStatusByStatusId.name}">
                                </div>
                            </div>

                            <input type="hidden" value="" name="comment"/>

                            <c:if test="info.statusId == 2 && user.roleId == 3">
                                <div class="form-group clearfix">
                                    <label for="comment" class="col-sm-2 control-label">Ý kiến khách hàng</label>

                                    <div class="col-sm-10">
                                        <input type="text" id="comment" class="form-control" value="">
                                    </div>
                                </div>
                            </c:if>
                            <div class="button-post clearfix">

                                <c:choose>
                                    <c:when test="${info.statusId == 1 && user.roleId == 2}">
                                        <button class="btn btn-danger" type="submit" name="button" value="reject" onclick="inputComment()">Hủy
                                            lịch hẹn
                                        </button>
                                        <button type="submit" name="button" value="assign" class="btn btn-primary">Giao việc</button>
                                    </c:when>
                                    <c:when test="${info.statusId == 2 && user.roleId == 2}">
                                        <button class="btn btn-primary" type="submit" name="button" value="assign">Giao việc lại</button>
                                    </c:when>
                                    <c:when test="${info.statusId == 3 && user.roleId == 2}">
                                        <a href="${pageContext.request.contextPath}/admin/contract?action=new&id=${info.id}"
                                           class="btn btn-primary">Tạo hợp đồng</a>
                                        <button class="btn btn-danger" type="submit" name="button" value="reject" onclick="inputComment()">Hủy
                                            lịch hẹn
                                        </button>
                                    </c:when>
                                    <c:when test="${info.statusId == 2 && user.roleId == 3}">
                                        <button class="btn btn-primary" type="submit" name="button" value="update3">
                                            Khách hàng đồng ý kí hợp đồng
                                        </button>
                                        <button class="btn btn-danger" type="submit" name="button" value="reject">
                                            Khách hàng không đồng ý kí hợp đồng
                                        </button>
                                    </c:when>

                                </c:choose>

                                <a onclick="window.history.back()"
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
<script>
    function inputComment() {
        var comment = prompt("Ý kiến khách hàng: ", "");
        if (comment) {
            document.appointment.comment.value = comment;
            document.appointment.button.value = 'reject';
        }
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        $('#assignedTime').datepicker({
            format: 'yyyy-mm-dd',
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).data('datepicker');

    });

</script>
</body>
</html>
