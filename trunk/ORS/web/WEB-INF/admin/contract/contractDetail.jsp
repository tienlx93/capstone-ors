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
        <h1 class="title">Quản lí hợp đồng</h1>
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

                            <div>Bên cho thuê văn phòng (Bên A)</div>
                            <div class="form-group clearfix">
                                <label for="officeID" class="col-sm-2 control-label">Ông(Bà):</label>

                                <div class="col-sm-10">
                                    Công ty ORS
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="officeID" class="col-sm-2 control-label">Email:</label>

                                <div class="col-sm-10">
                                    contact@tienlx.me
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="officeID" class="col-sm-2 control-label">Là đại diện của văn phòng:</label>

                                <div class="col-sm-10">
                                    ${contract.officeByOfficeId.name}
                                    <input type="hidden" id="officeID" name="officeID"
                                           value="${contract.officeByOfficeId.id}">
                                </div>
                            </div>

                            <div>Bên thuê văn phòng (Bên B)</div>
                            <div class="form-group clearfix">
                                <label for="customerName" class="col-sm-2 control-label">Ông(Bà):</label>

                                <div class="col-sm-10">
                                    ${contract.accountByCustomerUsername.profileByUsername.fullName}
                                    <input type="hidden" id="customerName" name="customerName"
                                           value="${contract.customerUsername}">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="customerName" class="col-sm-2 control-label">Địa chỉ:</label>

                                <div class="col-sm-10">
                                    ${contract.accountByCustomerUsername.profileByUsername.address}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="customerName" class="col-sm-2 control-label">Số điện thoại:</label>

                                <div class="col-sm-10">
                                    ${contract.accountByCustomerUsername.profileByUsername.phone}
                                </div>
                            </div>

                            <div>Thông tin thuê văn phòng:</div>
                            <div class="form-group clearfix">
                                <label for="officeID" class="col-sm-2 control-label">Tên văn phòng:</label>

                                <div class="col-sm-10">
                                    ${contract.officeByOfficeId.name}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="officeID" class="col-sm-2 control-label">Loại văn phòng:</label>

                                <div class="col-sm-10">
                                    ${contract.officeByOfficeId.categoryByCategoryId.description}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="officeID" class="col-sm-2 control-label">Địa chỉ văn phòng:</label>

                                <div class="col-sm-10">
                                    ${contract.officeByOfficeId.address}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="paymentFee" class="col-sm-2 control-label">Số tiền trên mỗi m2:</label>

                                <div name="paymentFee" id="paymentFee" class="col-sm-10">
                                    ${contract.paymentFee}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="officeArea" class="col-sm-2 control-label">Diện tích thuê:</label>

                                <div name="officeArea" id="officeArea" class="col-sm-10">
                                    ${contract.officeByOfficeId.area}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="startDate" class="col-sm-2 control-label">Ngày bắt đầu:</label>

                                <div name="startDate" id="startDate" class="col-sm-10">
                                    ${contract.startDate}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="endDate" class="col-sm-2 control-label">Ngày kết thúc:</label>

                                <div  name="endDate" id="endDate" class="col-sm-10">
                                    ${contract.endDate}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Kỳ hạn thanh toán:</label>

                                <div class="col-sm-10">
                                    ${contract.paymentTermByPaymentTerm.description}
                                    <input type="hidden" name="paymentTerm" id="paymentTerm" value="${contract.paymentTerm}">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="paymentFee" class="col-sm-2 control-label">Số tiền đặt cọc:</label>

                                <div class="col-sm-10">
                                    ${contract.deposit}
                                </div>
                            </div>
                            <div>Số tiền bên B ông(bà): ${contract.accountByCustomerUsername.profileByUsername.fullName}, phải thanh toán mỗi kỳ cho bên A ông(bà): Công ty ORS, là: <span id="total"></span> đồng.</div>
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
<script type="text/javascript">
    $(document).ready(function () {
//        var startDate = document.getElementById('startDate').innerText;
//        var endDate = document.getElementById('endDate').innerText;
        var paymentTerm = document.getElementById('paymentTerm').value;

//        console.log(startDate);
//        console.log(endDate);
//        var start = new Date(startDate);
//        var end = new Date(endDate);

        var time;
        switch (paymentTerm) {
            case '1':
                time = 1;
                break;
            case '2':
                time = 3;
                break;
            case '3':
                time = 6;
                break;
        }
        var area = document.getElementById('officeArea').innerText;
        var fee = document.getElementById('paymentFee').innerText;

        var total = time * parseInt(fee) * parseFloat(area);

        document.getElementById('total').innerHTML = numberWithCommas(total);
        console.log(total);
    });

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    </script>
</body>
</html>
