<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
        <h1 class="title">Quản lý yêu cầu sửa chữa</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div>
                        <form action="repair?action=editing" method="post">
                            <div class="form-group clearfix" hidden>
                                <label for="id" class="col-sm-2 control-label">Id</label>
                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>

                            <div class="form-group clearfix" hidden>
                                <label for="contractId" class="col-sm-2 control-label">Hợp đồng</label>

                                <div class="col-sm-10">
                                    ${info.contractId}<input type="hidden" name="contractId" id="contractId"
                                                             value="${info.contractId}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="nameOfiice" class="col-sm-2 control-label">Tên văn phòng</label>

                                <div class="col-sm-10">
                                    ${info.contractByContractId.officeByOfficeId.name}
                                    <input type="hidden" id="nameOfiice"
                                           value="${info.contractByContractId.officeByOfficeId.name}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="customerName" class="col-sm-2 control-label">Khách hàng</label>
                                <div class="col-sm-10">
                                    ${info.contractByContractId.customerUsername}
                                    <input type="hidden" id="customerName"
                                           value="${info.contractByContractId.customerUsername}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="nameOfiice" class="col-sm-2 control-label">Ngày tạo yêu cầu</label>
                                <div class="col-sm-10">
                                    ${info.createTime}
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
                                            <c:when test="${info.repairStatusId == 3 || info.repairStatusId == 4}">
                                                ${info.assignedStaff}
                                                <input type="hidden" name="assignedStaff" id="assignedStaff"
                                                       value="${info.assignedStaff}">
                                            </c:when>
                                            <c:otherwise>
                                                <select name="assignedStaff" id="assignedStaff" class="form-control">
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
                                </div>
                            </c:if>


                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Mô tả</label>

                                <div class="col-sm-10">
                                    ${info.description}
                                    <input type="hidden" name="description" class="form-control"
                                              value="${info.description}" />
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="assignedTime" class="col-sm-2 control-label">Ngày sửa chữa</label>
                                <c:choose>
                                    <c:when test="${user.roleId==2 && (info.repairStatusId == 1 || info.repairStatusId == 2)}">
                                        <div class="col-sm-10">
                                            <input type='text' class="form-control"
                                                   name="assignedTime"
                                                   id="assignedTime"
                                                   value="${info.assignedTime}"/>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-sm-10">
                                          <fmt:formatDate value="${info.assignedTime}" pattern="yyyy-MM-dd"/>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </div>

                            <div class="form-group clearfix">
                                <label for="repairStatusId" class="col-sm-2 control-label">Tình trạng</label>
                                <div class="col-sm-10">
                                    ${info.repairStatusByRepairStatusId.description}
                                    <input type="hidden" name="repairStatusId" id="repairStatusId"
                                           value="${info.repairStatusId}">
                                </div>
                            </div>

                            <div class="button-post">
                                <c:choose>
                                    <c:when test="${user.roleId==2}">
                                        <c:if test="${info.repairStatusId == 1}">
                                            <button type="submit" value="assign" name="button" class="btn btn-primary">
                                                Giao việc
                                            </button>
                                            <button type="submit" value="reject" name="button" class="btn btn-danger">
                                                Từ chối sửa chữa
                                            </button>
                                        </c:if>
                                        <c:if test="${info.repairStatusId == 2}">
                                            <button type="submit" value="assign" name="button" class="btn btn-primary">
                                                Giao việc lại
                                            </button>
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${info.repairStatusId == 2}">
                                                <button type="submit" value="change5" name="button"
                                                        class="btn btn-primary">
                                                    Đồng ý sửa chữa
                                                </button>
                                                <button type="submit" value="change1" name="button"
                                                        class="btn btn-danger">
                                                    Không đồng ý sửa chữa
                                                </button>
                                            </c:when>
                                            <c:when test="${info.repairStatusId == 5}">
                                                <button type="submit" value="change3" name="button"
                                                        class="btn btn-primary">
                                                    Khách hàng hài lòng
                                                </button>
                                                <button type="submit" value="change1" name="button"
                                                        class="btn btn-danger">
                                                    Khách hàng không hài lòng
                                                </button>
                                            </c:when>
                                        </c:choose>
                                    </c:otherwise>
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
