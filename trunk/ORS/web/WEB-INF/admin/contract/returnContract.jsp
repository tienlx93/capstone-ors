<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 23/06/2015
  Time: 11:27 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="page-header">Quản lí hợp đồng</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Hủy hợp đồng trước hạn
                    </div>
                    <div>
                        <form action="contract?action=editReturn" method="post">
                            <div class="form-group clearfix" hidden>
                                <label for="id" class="col-sm-2 control-label">Id</label>
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
                                <label for="nameOfiice" class="col-sm-2 control-label">Văn phòng</label>

                                <div class="col-sm-10">
                                    ${info.officeByOfficeId.name}
                                    <input type="hidden" id="nameOfiice"
                                           value="${info.officeByOfficeId.id}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="endDate" class="col-sm-2 control-label">Ngày kết thúc</label>

                                <div class="col-sm-10">
                                    ${info.endDate}
                                    <input type="hidden" id="endDate"
                                           value="${info.endDate}">
                                </div>
                            </div>

                            <div class="button-post">
                                <button type="submit" value="confirm" name="button" class="btn btn-danger">Xác nhận</button>
                                <button type="submit" value="cancel" name="button" class="btn btn-success">Hủy yêu cầu</button>
                                <a href="${pageContext.request.contextPath}/admin/contract?action=return"
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

</body>
</html>

