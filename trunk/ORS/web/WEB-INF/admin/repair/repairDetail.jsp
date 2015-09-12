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
    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/admin/repairDetail.js"></script>
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

                    <div>
                        <form action="repair?action=editing" method="post">
                            <input type="hidden" name="id" id="id" value="${info.id}">
                            <input type="hidden" name="contractId" id="contractId" value="${info.contractId}">

                            <c:if test="${user.roleId!=5}">
                                <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                    <h2>Thông tin tổng quát</h2></div>
                                <h3>Chủ sở hữu</h3>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Chủ văn
                                        phòng:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.officeByOfficeId.accountByOwnerUsername.profileByUsername.fullName}
                                    </div>

                                    <label class="col-sm-2 control-label" style="text-align: right">Số điện
                                        thoại:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.officeByOfficeId.accountByOwnerUsername.profileByUsername.phone}
                                    </div>
                                </div>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Tên văn
                                        phòng:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.officeByOfficeId.name}
                                    </div>
                                    <label class="col-sm-2 control-label" style="text-align: right">Địa chỉ văn
                                        phòng:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.officeByOfficeId.address}
                                    </div>
                                </div>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Loại văn
                                        phòng:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.officeByOfficeId.categoryByCategoryId.description}
                                    </div>
                                </div>
                                <h3>Khách hàng</h3>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Tên khách
                                        hàng:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.accountByCustomerUsername.profileByUsername.fullName}
                                    </div>

                                    <label class="col-sm-2 control-label" style="text-align: right">Số điện
                                        thoại:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.accountByCustomerUsername.profileByUsername.phone}
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Ngày bắt đầu hợp
                                        đồng:</label>

                                    <div class="col-sm-4">
                                        <fmt:formatDate
                                                value="${info.contractByContractId.startDate}"
                                                pattern="dd-MM-yyyy"/>
                                        <input type="hidden" id="startDate"
                                               value="${info.contractByContractId.startDate}">
                                    </div>

                                    <label class="col-sm-2 control-label" style="text-align: right">Ngày kết thúc hợp
                                        đồng:</label>

                                    <div class="col-sm-4">
                                        <fmt:formatDate
                                                value="${info.contractByContractId.endDate}"
                                                pattern="dd-MM-yyyy"/>
                                        <input type="hidden" id="endDate" value="${info.contractByContractId.endDate}">
                                    </div>
                                </div>

                                <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                    <h2>Chi tiết yêu cầu sửa chữa</h2></div>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Ngày tạo yêu
                                        cầu:</label>

                                    <div class="col-sm-4">
                                        <fmt:formatDate value="${info.createTime}"
                                                        pattern="dd-MM-yyyy"/>

                                    </div>
                                    <label class="col-sm-2 control-label" style="text-align: right">Mô tả yêu
                                        cầu:</label>

                                    <div class="col-sm-4">
                                            ${info.description}<input type="hidden" name="description"
                                                                      value="${info.description}">
                                    </div>
                                </div>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Cần sửa
                                        chữa:</label>

                                    <div class="col-sm-10 row" style="margin: auto">
                                        <c:forEach var="item" items="${listAmenity}">
                                            <div class="col-sm-12" style="padding: 0">${item.name}</div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <div class="form-group clearfix">
                                    <label for="assignedTime" class="col-sm-2 control-label" style="text-align: right">Ngày
                                        sửa chữa:</label>
                                    <c:choose>
                                        <c:when test="${user.roleId==2 && info.repairStatusId == 2}">

                                            <c:if test="${info.assignedStaff == null}">
                                                <div class="col-sm-4">
                                                    <fmt:formatDate value="${info.assignedTime}"
                                                                    pattern="dd-MM-yyyy" var="newDate"/>
                                                    <input type="text" name="assignedTime" id="assignedTime"
                                                           class="form-control" value="${newDate}" required readonly>
                                                </div>
                                            </c:if>
                                            <c:if test="${info.assignedStaff != null}">
                                                <div class="col-sm-4">
                                                    <fmt:formatDate value="${info.assignedTime}" pattern="dd-MM-yyyy"/>
                                                    <input type="hidden" name="assignedTime"
                                                           class="form-control" value="${info.assignedTime}">
                                                </div>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="col-sm-4">
                                                <fmt:formatDate value="${info.assignedTime}" pattern="dd-MM-yyyy"/>

                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <input type="hidden" id="repairDate" value="${info.assignedTime}">
                                    <c:if test="${user.roleId==2}">

                                        <label for="assignedStaff" class="col-sm-2 control-label"
                                               style="text-align: right">Nhân viên được giao:</label>
                                        <% AccountDAO acc = new AccountDAO();
                                            List<Account> listAcc = acc.findStaff();%>
                                        <div class="col-sm-4">
                                            <c:choose>
                                                <c:when test="${info.repairStatusId == 3 || info.repairStatusId == 4 || info.repairStatusId == 5}">
                                                    ${info.assignedStaff}
                                                    <input type="hidden" name="assignedStaff" id="assignedStaff"
                                                           value="${info.assignedStaff}">
                                                </c:when>
                                                <c:otherwise>
                                                    <select name="assignedStaff" id="assignedStaff" class="form-control"
                                                            required>
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

                                    </c:if>

                                </div>

                                <div class="form-group clearfix">
                                    <label for="repairStatusId" class="col-sm-2 control-label"
                                           style="text-align: right">Tình trạng:</label>

                                    <div class="col-sm-10">
                                            ${info.repairStatusByRepairStatusId.description}
                                        <input type="hidden" name="repairStatusId" id="repairStatusId"
                                               value="${info.repairStatusId}">
                                    </div>
                                </div>
                            </c:if>

                            <c:if test="${user.roleId==5}">
                                <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                    <h2>Thông tin khách hàng</h2></div>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Tên khách
                                        hàng:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.accountByCustomerUsername.profileByUsername.fullName}
                                    </div>

                                    <label class="col-sm-2 control-label" style="text-align: right">Số điện
                                        thoại:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.accountByCustomerUsername.profileByUsername.phone}
                                    </div>
                                </div>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Văn phòng đang
                                        thuê:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.officeByOfficeId.name}
                                    </div>
                                    <label class="col-sm-2 control-label" style="text-align: right">Địa chỉ văn
                                        phòng:</label>

                                    <div class="col-sm-4">
                                            ${info.contractByContractId.officeByOfficeId.address}
                                    </div>
                                </div>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Ngày bắt đầu hợp
                                        đồng:</label>

                                    <div class="col-sm-4">
                                        <fmt:formatDate
                                                value="${info.contractByContractId.startDate}"
                                                pattern="dd-MM-yyyy"/>
                                        <input type="hidden" id="startDate"
                                               value="${info.contractByContractId.startDate}">
                                    </div>

                                    <label class="col-sm-2 control-label" style="text-align: right">Ngày kết thúc hợp
                                        đồng:</label>

                                    <div class="col-sm-4">
                                        <fmt:formatDate
                                                value="${info.contractByContractId.endDate}"
                                                pattern="dd-MM-yyyy"/>
                                        <input type="hidden" id="endDate" value="${info.contractByContractId.endDate}">
                                    </div>
                                </div>

                                <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                    <h2>Chi tiết yêu cầu sửa chữa</h2></div>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Ngày tạo yêu
                                        cầu:</label>

                                    <div class="col-sm-4">
                                        <fmt:formatDate value="${info.createTime}"
                                                        pattern="dd-MM-yyyy"/>

                                    </div>
                                    <label class="col-sm-2 control-label" style="text-align: right">Mô tả yêu
                                        cầu:</label>

                                    <div class="col-sm-4">
                                            ${info.description}<input type="hidden" name="description"
                                                                      value="${info.description}">
                                    </div>
                                </div>

                                <div class="form-group clearfix">
                                    <label class="col-sm-2 control-label" style="text-align: right">Cần sửa
                                        chữa:</label>

                                    <div class="col-sm-10 row" style="margin: auto">
                                        <c:forEach var="item" items="${listAmenity}">
                                            <div class="col-sm-12" style="padding: 0">${item.name}</div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <c:if test="${info.repairStatusId != 1}">
                                    <div class="form-group clearfix">
                                        <label for="assignedTime" class="col-sm-2 control-label"
                                               style="text-align: right">Ngày sửa chữa:</label>
                                        <c:choose>
                                            <c:when test="${user.roleId==2 && (info.repairStatusId == 1 || info.repairStatusId == 2)}">
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
                                                    <input type="hidden" value="${info.assignedTime}">
                                                </div>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:if test="${user.roleId==2 || user.roleId==5}">

                                            <label for="assignedStaff" class="col-sm-2 control-label"
                                                   style="text-align: right">Nhân viên được giao:</label>
                                            <% AccountDAO acc = new AccountDAO();
                                                List<Account> listAcc = acc.findStaff();%>
                                            <div class="col-sm-4">
                                                <c:choose>
                                                    <c:when test="${info.repairStatusId == 3 || info.repairStatusId == 4 || info.repairStatusId == 5}">
                                                        ${info.assignedStaff}
                                                        <input type="hidden" name="assignedStaff" id="assignedStaff"
                                                               value="${info.assignedStaff}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <select name="assignedStaff" id="assignedStaff"
                                                                class="form-control"
                                                                required>
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
                                        </c:if>
                                    </div>
                                </c:if>

                                <div class="form-group clearfix">
                                    <label for="repairStatusId" class="col-sm-2 control-label"
                                           style="text-align: right">Tình trạng:</label>

                                    <div class="col-sm-10">
                                            ${info.repairStatusByRepairStatusId.description}
                                        <input type="hidden" name="repairStatusId" id="repairStatusId"
                                               value="${info.repairStatusId}">
                                    </div>
                                </div>

                            </c:if>

                            <div class="button-post">
                                <c:choose>
                                    <c:when test="${user.roleId==5}">
                                        <c:if test="${info.repairStatusId == 1}">
                                            <button type="submit" value="agree" name="button" class="btn btn-primary"
                                                    onclick="return check()">
                                                Đồng ý sửa chữa
                                            </button>
                                            <button type="submit" value="reject" name="button" class="btn btn-danger">
                                                Từ chối sửa chữa
                                            </button>
                                        </c:if>
                                    </c:when>
                                    <c:when test="${user.roleId==2}">
                                        <c:if test="${info.repairStatusId == 2 && info.assignedStaff == null}">
                                            <button type="submit" value="assign" name="button" class="btn btn-primary"
                                                    onclick="return check()">
                                                Giao việc
                                            </button>
                                        </c:if>
                                        <c:if test="${info.repairStatusId == 2 && info.assignedStaff != null}">
                                            <button type="submit" value="assign2" name="button" class="btn btn-primary"
                                                    id="agree" disabled>
                                                Giao việc lại
                                            </button>
                                            <button type="submit" value="reject" name="button" class="btn btn-danger">
                                                Từ chối sửa chữa
                                            </button>
                                        </c:if>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${info.repairStatusId == 2}">
                                                <%--<button type="submit" value="change5" name="button"
                                                        class="btn btn-primary" id="agree" disabled>
                                                    Đồng ý sửa chữa
                                                </button>
                                                <button type="submit" value="change1" name="button"
                                                        class="btn btn-danger">
                                                    Không đồng ý sửa chữa
                                                </button>--%>
                                            </c:when>
                                            <c:when test="${info.repairStatusId == 5}">
                                                <button type="submit" value="change3" name="button"
                                                        class="btn btn-primary" id="happy" disabled>
                                                    Khách hàng hài lòng
                                                </button>
                                                <button type="submit" value="change2" name="button"
                                                        class="btn btn-danger" id="unhappy" disabled>
                                                    Khách hàng không hài lòng
                                                </button>
                                            </c:when>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
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
            alert('Vui lòng nhập ngày sửa chữa');
            return false;
        } else {
            return true;
        }
    }
</script>

</body>
</html>
