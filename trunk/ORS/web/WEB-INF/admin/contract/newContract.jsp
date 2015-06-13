<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/2/2015
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
          type="text/css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/office.less" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
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
                    <div class="panel-title">
                        Tạo hợp đồng
                    </div>
                    <div>
                        <form action="contract" method="post">
                            <%--<div class="form-group">--%>
                            <%--<label for="customerName">Tên khách hàng</label>--%>
                            <%--<input type="text" name="customerName" class="" id="customerName" value="${contract.customerName}">--%>
                            <%--</div>--%>

                            <div class="form-group">
                                <label for="customerName">Khách hàng</label>
                                ${appointmentList.accountByCustomerUsername.username}
                                <input type="hidden" id="customerName"
                                       value="${appointmentList.accountByCustomerUsername.username}">
                            </div>

                            <%--<div class="form-group">--%>
                                <%--<label for="office">Văn phòng</label>--%>
                                <%--<input type="text" name="office" class="" id="office" value="${contract.officeID}">--%>
                            <%--</div>--%>

                            <div class="form-group">
                                <label for="nameOfiice">Tên văn phòng</label>
                                ${appointmentList.officeByOfficeId.name}
                                <input type="hidden" id="nameOfiice"
                                       value="${appointmentList.officeByOfficeId.name}">
                            </div>


                            <div class="form-group">
                                <label for="startDate">Ngày bắt đầu</label>
                                <input type="text" name="startDate" class="" id="startDate"
                                       value="${contract.startDate}">
                            </div>
                            <div class="form-group">
                                <label for="endDate">Ngày kết thúc</label>
                                <input type="text" name="endDate" class="" id="endDate" value="${contract.endDate}">
                            </div>

                            <div class="form-group">
                                <label for="paymentTerm">Thời hạn thanh toán</label>
                                <select name="paymentTerm" class="" id="paymentTerm">
                                    <c:forEach var="item" items="${paymentTermList}">
                                        <option value="${item.id}"
                                                <c:if test="${office.paymentTermList  ==item.id}">selected</c:if> >
                                                ${item.description}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="button-post">
                                <button type="button" value="cancel" name="action">Hủy</button>
                                <button type="submit" value="save" name="action">Tạo mới</button>

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
