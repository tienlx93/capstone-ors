<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.AccountDAO" %>
<%@ page import="entity.Account" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
        <h1 class="title">Quản lí lịch hẹn</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <%--<div class="panel-title">--%>
                    <%--<h2 style="margin-top: 5px">Chi tiết lịch hẹn</h2>--%>
                    <%--</div>--%>
                    <div>
                        <form action="appointment?action=editing" method="post" name="appointment">
                            <div class="form-group" hidden>
                                <label for="id">Id</label>
                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>

                            <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                <h2>Thông tin tổng quát</h2></div>
                            <h3>Chủ sở hữu</h3>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Chủ văn phòng</label>

                                <div class="col-sm-4">
                                    ${info.officeByOfficeId.ownerName}
                                </div>

                                <label class="col-sm-2 control-label">Số điện thoại</label>

                                <div class="col-sm-4">
                                    ${info.officeByOfficeId.ownerPhone}
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Tên văn phòng</label>

                                <div class="col-sm-4">
                                    ${info.officeByOfficeId.name}
                                </div>

                                <label class="col-sm-2 control-label">Địa chỉ văn phòng</label>

                                <div class="col-sm-4">
                                    ${info.officeByOfficeId.address}
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Loại văn phòng</label>

                                <div class="col-sm-4">
                                    ${info.officeByOfficeId.categoryByCategoryId.description}
                                </div>
                            </div>

                            <h3>Khách hàng</h3>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Tên khách hàng</label>

                                <div class="col-sm-4">
                                    ${info.accountByCustomerUsername.profileByUsername.fullName}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Số điện thoại</label>

                                <div class="col-sm-4">
                                    ${info.accountByCustomerUsername.profileByUsername.phone}
                                </div>
                            </div>

                            <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                <h2>Chi tiết lịch hẹn</h2></div>


                            <%--<c:choose>
                                <c:when test="${user.roleId==2 && (info.statusId == 1 || info.statusId == 2)}">
                                    <div class="col-sm-3">
                                        <input type='text' class="form-control"
                                               name="time"
                                               id="time"
                                               value="${info.time}"/>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-sm-3">
                                            ${info.time}
                                    </div>
                                </c:otherwise>
                            </c:choose>--%>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Ngày gặp</label>

                                <div class="col-sm-4">
                                    <fmt:formatDate value="${info.time}"
                                                    pattern="dd-MM-YYYY"/>
                                </div>
                                <input type="hidden" id="meetDate" value="${info.time}">

                                <label class="col-sm-2 control-label">Thời gian gặp</label>

                                <div class="col-sm-4">
                                    <fmt:formatDate value="${info.time}"
                                                    pattern="hh:mm a"/>
                                </div>
                            </div>

                            <c:if test="${user.roleId==2}">
                                <div class="form-group clearfix">
                                    <label for="assignedStaff" class="col-sm-2 control-label">Nhân viên được
                                        giao</label>
                                    <% AccountDAO acc = new AccountDAO();
                                        List<Account> listAcc = acc.findStaff();%>
                                    <div class="col-sm-4">
                                        <c:choose>

                                            <c:when test="${info.statusId == 5 || info.statusId == 4 || info.statusId == 3}">
                                                ${info.assignedStaff}
                                                <input type="hidden" name="assignedStaff" id="assignedStaff"
                                                       value="${info.assignedStaff}">
                                            </c:when>
                                            <c:otherwise>
                                                <select name="assignedStaff" id="assignedStaff" class="form-control" required>
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


                            <%--<div class="form-group clearfix">
                                <label for="time" class="col-sm-2 control-label">Thời gian gặp</label>
                                <c:choose>
                                    <c:when test="${user.roleId==2 && (info.statusId == 1 || info.statusId == 2)}">
                                        <div class="col-sm-4">
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

                                &lt;%&ndash;<div class="col-sm-10">&ndash;%&gt;
                                &lt;%&ndash;${info.time}&ndash;%&gt;
                                &lt;%&ndash;</div>&ndash;%&gt;
                            </div>--%>
                            <c:if test="${info.statusId != 1 && info.statusId != 2}">
                                <div class="form-group clearfix">
                                    <label for="appointmentStatusId" class="col-sm-2 control-label">Ý kiến khách
                                        hàng</label>

                                    <div class="col-sm-10">
                                            ${info.comment}
                                        <input type="hidden" name="appointmentStatusId" id="appointmentStatusId"
                                               value="${info.comment}">
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-group clearfix">
                                <label for="appointmentStatusId" class="col-sm-2 control-label">Trạng thái lịch
                                    hẹn</label>

                                <div class="col-sm-10">
                                    ${info.appointmentStatusByStatusId.description}
                                    <input type="hidden" name="appointmentStatusId" id="appointmentStatusId"
                                           value="${info.appointmentStatusByStatusId.name}">
                                </div>
                            </div>
                            <c:if test="${info.officeByOfficeId.statusId == 2}">
                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label">Tình trạng văn phòng</label>

                                    <div class="col-sm-10">
                                        Văn phòng đã được thuê
                                    </div>
                                </div>
                            </c:if>
                            <div class="button-post clearfix">

                                <c:choose>
                                    <c:when test="${info.statusId == 1 && user.roleId == 2}">

                                        <button type="submit" name="button" value="assign" class="btn btn-primary">Giao
                                            việc
                                        </button>
                                        <button class="btn btn-danger" type="button" onclick="inputComment(true)">
                                            Hủy lịch hẹn
                                        </button>
                                    </c:when>
                                    <c:when test="${info.statusId == 2 && user.roleId == 2}">
                                        <button class="btn btn-primary" type="submit" name="button" value="assign">Giao
                                            việc lại
                                        </button>
                                    </c:when>
                                    <c:when test="${info.statusId == 3 && user.roleId == 2}">
                                        <c:if test="${info.officeByOfficeId.statusId != 2}">
                                            <a href="${pageContext.request.contextPath}/admin/contract?action=new&id=${info.id}"
                                               class="btn btn-primary">Tạo hợp đồng</a>
                                        </c:if>
                                        <button class="btn btn-danger" type="button" onclick="inputComment()">
                                            Hủy kí hợp đồng
                                        </button>
                                    </c:when>
                                    <c:when test="${info.statusId == 2 && user.roleId == 3}">
                                        <button class="btn btn-primary" type="submit" name="button" value="update3" disabled id="agree">
                                            Khách hàng muốn kí hợp đồng
                                        </button>
                                        <button class="btn btn-danger" type="button" onclick="inputComment()">
                                            Khách hàng không đồng ý
                                        </button>
                                    </c:when>

                                </c:choose>

                                <a href="${urlBack}"
                                   class="btn btn-default">Quay về</a>

                            </div>

                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                    aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title">Nhập lí do hủy</h4>
                                        </div>
                                        <div class="modal-body">
                                            <input class="form-control" name="comment" autocomplete="off" type="text">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Quay lại
                                            </button>
                                            <button type="submit" class="btn btn-danger" name="button" value="reject2"
                                                    id="submit">Xác nhận hủy
                                            </button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                        </form>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>

</div>

<script>
    function inputComment(sendSMS) {
        if (sendSMS) {
            $("#submit").val("reject");
        }
        $('#myModal').modal('show');
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        $('#time').datepicker({
            format: 'yyyy-mm-dd',
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).data('datepicker');

        var meetDate = document.getElementById('meetDate').value;
        var meet = new Date(meetDate);
        var afterMeet = new Date(meet);
        afterMeet.setHours(meet.getHours() + 2);

        var checkTime = nowTemp - meet;
        var checkTime4 = afterMeet - meet;

        if (checkTime.valueOf() < checkTime4.valueOf() && checkTime.valueOf > 0) {
            $("#agree").removeAttr("disabled");
        }
    });

</script>
</body>
</html>
