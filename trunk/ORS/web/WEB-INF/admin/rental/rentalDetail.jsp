<%@ page import="java.util.List" %>
<%@ page import="dao.AccountDAO" %>
<%@ page import="entity.Account" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/admin/rentalDetail.js"></script>
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
        <h1 class="title">Quản lí yêu cầu thuê thiết bị</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <%--<div class="panel-title">--%>
                    <%--Xem chi tiết--%>
                    <%--</div>--%>
                    <div>
                        <form action="rental?action=editing" method="post">
                            <div class="form-group" hidden>
                                <label for="id">Id</label>
                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>

                            <div class="form-group clearfix" hidden>
                                <label for="contractId" class="col-sm-2 control-label">Hợp đồng</label>

                                <div class="col-sm-10">
                                    ${info.contractId}<input type="hidden" name="contractId" id="contractId"
                                                             value="${info.contractId}">
                                </div>

                            </div>

                            <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                <h2>Thông tin tổng quát</h2></div>
                            <h3>Chủ sở hữu</h3>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Chủ văn phòng</label>

                                <div class="col-sm-4">
                                    ${info.contractByContractId.officeByOfficeId.accountByOwnerUsername.profileByUsername.fullName}
                                </div>

                                <label class="col-sm-2 control-label">Số điện thoại</label>

                                <div class="col-sm-4">
                                    ${info.contractByContractId.officeByOfficeId.accountByOwnerUsername.profileByUsername.phone}
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Tên văn phòng</label>

                                <div class="col-sm-4">
                                    ${info.contractByContractId.officeByOfficeId.name}
                                </div>
                                <label class="col-sm-2 control-label">Địa chỉ văn phòng</label>

                                <div class="col-sm-4">
                                    ${info.contractByContractId.officeByOfficeId.address}
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Loại văn phòng</label>

                                <div class="col-sm-4">
                                    ${info.contractByContractId.officeByOfficeId.categoryByCategoryId.description}
                                </div>
                            </div>
                            <h3>Khách hàng</h3>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Tên khách hàng</label>

                                <div class="col-sm-4">
                                    ${info.contractByContractId.accountByCustomerUsername.profileByUsername.fullName}
                                </div>

                                <label class="col-sm-2 control-label">Số điện thoại</label>

                                <div class="col-sm-4">
                                    ${info.contractByContractId.accountByCustomerUsername.profileByUsername.phone}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Ngày bắt đầu hợp đồng</label>

                                <div class="col-sm-4">
                                    <fmt:formatDate
                                            value="${info.contractByContractId.startDate}"
                                            pattern="dd-MM-yyyy"/>
                                    <input type="hidden" id="startDate" value="${info.contractByContractId.startDate}">
                                </div>

                                <label class="col-sm-2 control-label">Ngày kết thúc hợp đồng</label>

                                <div class="col-sm-4">
                                    <fmt:formatDate
                                            value="${info.contractByContractId.endDate}"
                                            pattern="dd-MM-yyyy"/>
                                    <input type="hidden" id="endDate" value="${info.contractByContractId.endDate}">
                                </div>
                            </div>

                            <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                <h2>Chi tiết yêu cầu thuê thiết bị</h2></div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Ngày tạo yêu cầu</label>

                                <div class="col-sm-4">
                                    <fmt:formatDate value="${info.createTime}"
                                                    pattern="dd-MM-yyyy"/>

                                </div>
                                <label class="col-sm-2 control-label">Mô tả yêu cầu</label>

                                <div class="col-sm-4">
                                    ${info.description}
                                </div>
                            </div>


                            <div class="form-group clearfix">
                                <label for="assignedTime" class="col-sm-2 control-label">Ngày giao thiết bị</label>
                                <c:choose>
                                    <%--<c:when test="${user.roleId==2 && (info.statusId == 1 || info.statusId == 2)}">--%>
                                    <%--Chi giao viec lai cho staff--%>
                                    <c:when test="${user.roleId==2 && info.statusId == 1}">
                                        <div class="col-sm-4">
                                            <fmt:formatDate
                                                    value="${info.assignedTime}"
                                                    pattern="dd-MM-yyyy" var="newDate"/>
                                            <input type="text" name="assignedTime" id="assignedTime"
                                                   class="form-control" value="${newDate}" required readonly>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-sm-4">
                                            <fmt:formatDate value="${info.assignedTime}" pattern="dd-MM-yyyy"/>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                                <input type="hidden" id="rentalDate" value="${info.assignedTime}">
                                <c:if test="${user.roleId==2}">
                                    <label for="assignStaff" class="col-sm-2 control-label">Nhân viên được giao</label>

                                    <% AccountDAO acc = new AccountDAO();
                                        List<Account> listAcc = acc.findStaff();%>
                                    <div class="col-sm-4">
                                        <c:choose>
                                            <c:when test="${info.statusId == 3 || info.statusId == 4 || info.statusId == 5}">
                                                ${info.assignStaff}
                                                <input type="hidden" name="assignStaff" id="assignStaff"
                                                       value="${info.assignStaff}">
                                            </c:when>
                                            <c:otherwise>
                                                <select name="assignStaff" id="assignStaff" class="form-control"
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
                                                                        <c:if test="${info.assignStaff==itemAcc.username}">selected</c:if>>${itemAcc.username}</option>
                                                            </c:forEach>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </select>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </c:if>
                            </div>


                            <div class="form-group clearfix">
                                <label for="list" class="col-sm-2 control-label clearfix">Thiết bị khách hàng yêu
                                    cầu</label>

                                <div class="col-sm-10">
                                    <table class="table" id="list">
                                        <thead>
                                        <tr>
                                            <th>Thiết bị</th>
                                            <th>Giá (VNĐ)</th>
                                            <th>Số lượng (cái)</th>
                                            <th>Thành tiền (VNĐ)</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${detailList}">
                                            <tr>
                                                <td>${item.rentalItemByRentalItemId.name}</td>
                                                <td><fmt:formatNumber type="number"
                                                                      value="${item.unitPrice}"/></td>
                                                <td>${item.quantity} </td>
                                                <td><fmt:formatNumber type="number"
                                                                      value="${item.unitPrice * item.quantity}"/></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Trạng thái</label>

                                <div class="col-sm-10">
                                    ${info.rentalStatusByStatusId.description}
                                    <input type="hidden" name="statusId" id="statusIdF"
                                           value="${info.statusId}">
                                </div>
                            </div>

                            <div class="button-post">
                                <c:choose>
                                    <c:when test="${user.roleId==2}">
                                        <c:if test="${info.statusId == 1}">
                                            <button type="submit" value="assign" name="button" class="btn btn-primary"
                                                    onclick="return check()">
                                                Giao việc
                                            </button>
                                            <button type="button" class="btn btn-danger"
                                                    onclick="inputComment()">
                                                Từ chối
                                            </button>
                                        </c:if>
                                        <c:if test="${info.statusId == 2}">
                                            <button type="submit" value="assign" name="button" class="btn btn-primary"
                                                    disabled id="assignTask"> Giao việc lại
                                            </button>
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${info.statusId == 2}">
                                                <button type="submit" value="change5" name="button"
                                                        class="btn btn-primary" id="agree" disabled>Đồng ý giao hàng
                                                </button>
                                                <button type="submit" value="change1" name="button"
                                                        class="btn btn-danger" id="disagree" disabled>Không đồng ý giao
                                                    hàng
                                                </button>
                                            </c:when>
                                            <c:when test="${info.statusId == 5}">
                                                <button type="submit" value="change3" name="button"
                                                        class="btn btn-primary" disabled id="happy">Khách
                                                    hàng hài lòng
                                                </button>
                                                <button type="submit" value="change1" name="button"
                                                        class="btn btn-danger" disabled id="unhappy">Khách
                                                    hàng không hài lòng
                                                </button>
                                            </c:when>
                                        </c:choose>
                                    </c:otherwise>
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
                                            <button type="submit" class="btn btn-danger" name="button" value="reject"
                                                    id="submit">Xác nhận hủy
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>

</div>

<script type="text/javascript">
    function check() {
        var date = document.getElementById('assignedTime').value;
        if (date.valueOf() == "") {
            alert('Vui lòng nhập ngày giao thiết bị');
            return false;
        } else {
            return true;
        }
    }

    function inputComment(sendSMS) {
        if (sendSMS) {
            $("#submit").val("reject");
        }
        $('#myModal').modal('show');
    }
    $('#myModal').on('show.bs.modal', function (e) {
        $("#assignedTime").removeAttr("required");
        $("#assignStaff").removeAttr("required");
    }).on('hide.bs.modal', function (e) {
        $("#assignedTime").attr("required", true);
        $("#assignStaff").attr("required", true);
    });
    $("form").validate({});

</script>

</body>
</html>
