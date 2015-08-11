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
    <h1 class="page-header">Quản lí hợp đồng</h1>
  </div>

  <div class="container-padding">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-title">
            Thông tin hợp đồng
          </div>
          <div>
            <form action="contract" method="get" name="contractDetail" onsubmit="return validateArea()">
              <div class="form-group clearfix hidden">
                <div class="col-sm-10">
                  <input type="hidden" id="contractId" name="contractId"
                         value="${contract.id}">
                </div>
              </div>
              <div class="form-group clearfix">
                <label for="customerName" class="col-sm-2 control-label">Khách hàng</label>

                <div class="col-sm-10">
                  ${contract.customerUsername}
                  <input type="hidden" id="customerName" name="customerName"
                         value="${contract.customerUsername}">
                </div>
              </div>

              <div class="form-group clearfix">
                <label for="officeID" class="col-sm-2 control-label">Tên văn phòng</label>

                <div class="col-sm-10">
                  ${contract.officeByOfficeId.name}
                  <input type="hidden" id="officeID" name="officeID"
                         value="${contract.officeByOfficeId.id}">
                </div>
              </div>


              <div class="form-group clearfix">
                <label for="startDate" class="col-sm-2 control-label">Ngày bắt đầu</label>

                <div class="col-sm-10">
                  ${contract.startDate}

                  <input style="display: inline-block" type='hidden' class="form-control"
                         name="startDate"
                         id="startDate"
                         value="${contract.startDate}"/>
                </div>
              </div>

              <%--<div class="form-group">--%>
              <%--<label for="endDate">Ngày kết thúc</label>--%>
              <%--<input type="text" name="endDate" class="" id="endDate" value="${contract.endDate}">--%>
              <%--</div>--%>
              <div class="form-group clearfix">
                <label for="endDate" class="col-sm-2 control-label">Ngày kết thúc</label>

                <div class="col-sm-10">
                  ${contract.endDate}
                  <input style="display: inline-block" type='hidden' class="form-control" name="endDate"
                         id="endDate"
                         value="${contract.endDate}"/>
                </div>
              </div>

              <div class="form-group clearfix">
                <label class="col-sm-2 control-label">Thời hạn thanh toán</label>

                <div class="col-sm-10">
                  ${contract.paymentTermByPaymentTerm.description}
                </div>
              </div>

              <div class="form-group clearfix">
                <label for="paymentFee" class="col-sm-2 control-label">Giá tiền</label>

                <div class="col-sm-10">
                  ${contract.paymentFee}
                  <input style="display: inline-block" type='hidden' class="form-control" name="paymentFee"
                         id="paymentFee" value="${contract.paymentFee}"/>
                </div>
              </div>

              <div class="button-post">
                <a class="btn btn-primary" href="contract?action=edit&id=${contract.id}">Chỉnh sửa</a>
                <a href="/admin/contract" class="btn btn-default">Quay về</a>
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
