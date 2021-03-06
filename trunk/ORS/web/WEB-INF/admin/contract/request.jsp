<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 6/23/2015
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
          type="text/css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" type="text/css">

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
        <h1 class="title">Quản lí hợp đồng</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <%--todo: lấy title từ controller--%>
                    <div class="panel-title">
                        <c:choose>
                            <c:when test="${titleName == 'huy'}">
                                Danh sách hủy hợp đồng trước hạn
                            </c:when>
                            <c:otherwise>
                                Danh sách gia hạn hợp đồng
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Khách hàng</th>
                                <th>Văn phòng</th>
                                <th>Ngày bắt đầu</th>
                                <th>Ngày kết thúc</th>
                                <th>Giá thuê (VNĐ)</th>
                                <th>Kỳ hạn thanh toán</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${data}" var="item">

                                <c:choose>
                                    <c:when test="${item.statusId == 3 && titleName == 'huy'}">
                                        <tr>
                                            <td><a href="contract?action=viewProfile&username=${item.accountByCustomerUsername.username}">${item.accountByCustomerUsername.profileByUsername.fullName}</a>
                                            </td>
                                            <td>${item.officeByOfficeId.name}</td>
                                            <td><fmt:formatDate value="${item.startDate}"
                                                                pattern="dd-MM-yyyy"/></td>
                                            <td><fmt:formatDate value="${item.endDate}"
                                                                pattern="dd-MM-yyyy"/></td>
                                            <td><fmt:formatNumber type="number"
                                                                  value="${item.paymentFee}" /></td>
                                            <td>${item.paymentTermByPaymentTerm.description}</td>

                                            <td>
                                                <a href="contract?action=viewReturn&id=${item.id}"
                                                   title="Chi tiết"
                                                   class="btn btn-icon btn-default"><i class="fa fa-info color5"></i></a>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${item.statusId == 2 && titleName == 'giahan'}">
                                        <tr>
                                            <td><a
                                                   href="contract?action=viewProfile&username=${item.accountByCustomerUsername.username}">${item.accountByCustomerUsername.profileByUsername.fullName}</a>
                                            </td>
                                            <td>${item.officeByOfficeId.name}</td>
                                            <td><fmt:formatDate value="${item.startDate}"
                                                                pattern="dd-MM-yyyy"/></td>
                                            <td><fmt:formatDate value="${item.endDate}"
                                                                pattern="dd-MM-yyyy"/></td>

                                            <td><fmt:formatNumber type="number"
                                                                  value="${item.paymentFee}" /></td>
                                            <td>${item.paymentTermByPaymentTerm.description}</td>

                                            <td>

                                                <a href="${pageContext.request.contextPath}/admin/contract?action=viewExtend&id=${item.id}"
                                                   title="Chi tiết"
                                                   class="btn btn-icon btn-default"><i class="fa fa-info color5"></i></a>
                                            </td>
                                        </c:if>

                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>
</div>
</body>
</html>
