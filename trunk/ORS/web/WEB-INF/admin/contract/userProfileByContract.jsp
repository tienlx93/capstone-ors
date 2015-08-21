<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 21/07/2015
  Time: 9:55 CH
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
        <h1 class="page-header">Thông tin khách hàng</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div>
                        <div>

                            <div class="form-group">
                                <label class="col-sm-2">Họ tên khách hàng: </label>
                                <span>${info.profileByUsername.fullName}</span>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2">Giới tính: </label>
                                <c:if test="${fn:trim(info.profileByUsername.title) == 'Ông'}">
                                    <span>Nam</span>
                                </c:if>
                                <c:if test="${fn:trim(info.profileByUsername.title) == 'Bà'}">
                                    <span>Nữ</span>
                                </c:if>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2">Số điện thoại: </label>
                                <span>${info.profileByUsername.phone}</span>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2">Địa chỉ: </label>
                                <c:if test="${not empty info.profileByUsername.address}">
                                    <span>${info.profileByUsername.address}</span>
                                </c:if>
                                <c:if test="${empty info.profileByUsername.address}">
                                    <span>Không có</span>
                                </c:if>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2">Email: </label>
                                <span>${info.email}</span>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2">Công ty: </label>
                                <c:if test="${not empty info.profileByUsername.company}">
                                    <span>${info.profileByUsername.company}</span>
                                </c:if>
                                <c:if test="${empty info.profileByUsername.company}">
                                    <span>Không có</span>
                                </c:if>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2">Ngày sinh: </label>
                                        <span>
                                            <fmt:formatDate pattern="dd-MM-yyyy"
                                                            value="${info.profileByUsername.birthday}"/>
                                        </span>
                            </div>

                            <%--<div class="form-group">
                                <label class="col-sm-2">Tình trạng: </label>
                                <span>${info.accountStatusByStatusId.name}</span>
                            </div>--%>


                            <div class="button-post">

                                <a onclick="window.history.back()" class="btn btn-default">Quay lại</a>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>


    <script type="text/javascript" src="${pageContext.request.contextPath}/javascript/loadImg.js"
            charset="UTF-8"></script>
</div>


</body>
</html>
