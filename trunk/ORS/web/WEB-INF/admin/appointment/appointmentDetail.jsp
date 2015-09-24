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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/datepicker/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/javascript/admin/appointmentDetail.js"></script>
    <script src="${pageContext.request.contextPath}/lib/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/localization/messages_vi.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootbox.min.js"></script>
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
                        <form action="appointment?action=editing" method="post" name="appointment">
                            <div class="form-group" hidden>
                                <label for="id">Id</label>
                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>

                            <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                <h2>Thông tin tổng quát</h2></div>
                            <h3>Chủ sở hữu</h3>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label" style="text-align: right">Chủ văn phòng:</label>

                                <div class="col-sm-4">
                                    ${info.officeByOfficeId.accountByOwnerUsername.profileByUsername.fullName}
                                </div>

                                <label class="col-sm-2 control-label" style="text-align: right">Số điện thoại:</label>

                                <div class="col-sm-4">
                                    ${info.officeByOfficeId.accountByOwnerUsername.profileByUsername.phone}
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label" style="text-align: right">Tên văn phòng:</label>

                                <div class="col-sm-4">
                                    ${info.officeByOfficeId.name}
                                </div>

                                <label class="col-sm-2 control-label" style="text-align: right">Địa chỉ văn
                                    phòng:</label>

                                <div class="col-sm-4">
                                    ${info.officeByOfficeId.address}
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label" style="text-align: right">Loại văn phòng:</label>

                                <div class="col-sm-4">
                                    ${info.officeByOfficeId.categoryByCategoryId.description}
                                </div>
                            </div>

                            <h3>Khách hàng</h3>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label" style="text-align: right">Tên khách hàng:</label>

                                <div class="col-sm-4">
                                    ${info.accountByCustomerUsername.profileByUsername.fullName}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label" style="text-align: right">Số điện thoại:</label>

                                <div class="col-sm-4">
                                    ${info.accountByCustomerUsername.profileByUsername.phone}
                                </div>
                            </div>

                            <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                <h2>Chi tiết lịch hẹn</h2></div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label" style="text-align: right">Ngày gặp:</label>

                                <div class="col-sm-4">
                                    <fmt:formatDate value="${info.time}"
                                                    pattern="dd-MM-YYYY"/>
                                    <c:if test="${date > info.time && info.statusId == 2}">
                                        <i class="fa fa-warning color10" title="Đã đến hạn"></i>
                                    </c:if>
                                </div>
                                <input type="hidden" id="meetDate" value="${info.time}">

                                <label class="col-sm-2 control-label" style="text-align: right">Thời gian gặp:</label>

                                <div class="col-sm-4">
                                    <fmt:formatDate value="${info.time}"
                                                    pattern="hh:mm a"/>
                                </div>
                            </div>

                            <c:if test="${user.roleId==2 && info.statusId != 5}">
                                <div class="form-group clearfix">
                                    <label for="assignedStaff" class="col-sm-2 control-label" style="text-align: right">
                                        Nhân viên được giao:</label>
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
                                                <select name="assignedStaff" id="assignedStaff" class="form-control"
                                                        required>
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

                            <c:if test="${info.statusId == 5}">
                                <div class="form-group clearfix">
                                    <label for="appointmentStatusId" class="col-sm-2 control-label"
                                           style="text-align: right">
                                        Ý kiến khách hàng:</label>

                                    <div class="col-sm-10">
                                            ${info.comment}
                                        <input type="hidden" name="appointmentStatusId" id="appointmentStatusId"
                                               value="${info.comment}">
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-group clearfix">
                                <label for="appointmentStatusId" class="col-sm-2 control-label"
                                       style="text-align: right">
                                    Trạng thái lịch hẹn:</label>

                                <div class="col-sm-10">
                                    ${info.appointmentStatusByStatusId.description}
                                    <input type="hidden" name="appointmentStatusId" id="appointmentStatusId"
                                           value="${info.appointmentStatusByStatusId.name}">
                                </div>
                            </div>
                            <c:if test="${info.officeByOfficeId.statusId == 2}">
                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Tình trạng văn
                                        phòng:</label>

                                    <div class="col-sm-10">
                                        Văn phòng đã được thuê
                                    </div>
                                </div>
                            </c:if>
                            <div class="button-post clearfix">
                                <c:choose>
                                    <c:when test="${user.roleId == 2 && info.statusId == 1}">
                                        <c:if test="${info.officeByOfficeId.statusId == 1}">
                                            <button type="submit" name="button" value="assign" class="btn btn-primary">
                                                Giao việc
                                            </button>
                                        </c:if>
                                        <button class="btn btn-danger" type="button" onclick="inputComment(true)">
                                            Hủy lịch hẹn
                                        </button>
                                    </c:when>
                                    <c:when test="${info.statusId == 2 && user.roleId == 2}">
                                        <button class="btn btn-primary" type="submit" name="button" value="assign">
                                            Giao việc lại
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

                                        <div style="display: inline-block;" data-toggle="tooltip"
                                             data-placement="top"
                                             title="Chưa tới thời gian công việc" id="agree" class="hidden">
                                            <button class="btn btn-primary" type="submit" name="button" value="update3"
                                                    disabled>Khách hàng muốn kí hợp đồng
                                            </button>
                                        </div>

                                        <button class="btn btn-primary hidden" type="submit" name="button"
                                                value="update3" id="agree2">Khách hàng muốn kí hợp đồng
                                        </button>

                                        <div style="display: inline-block;" data-toggle="tooltip"
                                             data-placement="top"
                                             title="Chưa tới thời gian công việc" id="disagree" class="hidden">
                                            <button class="btn btn-danger" type="button"
                                                    onclick="inputComment()" disabled>Khách hàng không đồng ý
                                            </button>
                                        </div>

                                        <button class="btn btn-danger hidden" type="button" onclick="inputComment()"
                                                id="disagree2">Khách hàng không đồng ý
                                        </button>
                                    </c:when>
                                </c:choose>
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
                                            <input class="form-control" name="comment" autocomplete="off" type="text"
                                                   required>
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
    $('#myModal').on('show.bs.modal', function (e) {
        $("#assignedStaff").removeAttr("required");
    }).on('hide.bs.modal', function (e) {
        $("#assignedStaff").attr("required", true);
    });
    $("form").validate({});
</script>

</body>
</html>
