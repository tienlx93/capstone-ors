<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 23/06/2015
  Time: 11:27 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
                        <h2 style="margin-top: 5px">Hủy hợp đồng trước hạn</h2>
                    </div>
                    <div>
                        <form action="contract?action=editReturn" method="post">
                            <div class="form-group clearfix" hidden>
                                <label for="id" class="col-sm-2 control-label">Id</label>
                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>
                            <div class="row" style="margin: auto">
                                <div class="col-sm-12">
                                    <div><h3>Bên cho thuê văn phòng (Bên A)</h3></div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Ông(Bà):
                                        </div>

                                        <div class="col-sm-9">
                                            ${office.ownerName}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Địa chỉ:
                                        </div>

                                        <div class="col-sm-9">
                                            ${office.ownerAddress}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Số điện thoại:
                                        </div>

                                        <div class="col-sm-9">
                                            ${office.ownerPhone}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">Là
                                            đại diện của văn
                                            phòng:
                                        </div>

                                        <div class="col-sm-9">
                                            ${info.officeByOfficeId.name}
                                            <input type="hidden" id="officeID" name="officeID"
                                                   value="${info.officeByOfficeId.id}">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12">

                                    <div><h3>Bên thuê văn phòng (Bên B)</h3></div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="customerName"
                                             class="col-sm-3 control-label">Ông(Bà):
                                        </div>

                                        <div class="col-sm-9">
                                            ${info.accountByCustomerUsername.profileByUsername.fullName}
                                            <input type="hidden" id="customerName" name="customerName"
                                                   value="${info.customerUsername}">
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="customerName"
                                             class="col-sm-3 control-label">Địa chỉ:
                                        </div>

                                        <div class="col-sm-9">
                                            ${info.accountByCustomerUsername.profileByUsername.address}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="customerName"
                                             class="col-sm-3 control-label">Số điện thoại:
                                        </div>

                                        <div class="col-sm-9">
                                            ${info.accountByCustomerUsername.profileByUsername.phone}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin: 20px auto; ">
                                <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                    <h3>Thông tin thuê văn phòng</h3></div>
                                <div class="row" style="margin: auto">

                                    <div class="col-sm-6">

                                        <div class="form-group clearfix">
                                            <div for="officeID" style="padding: 0" class="col-sm-4 control-label">Tên
                                                văn phòng:
                                            </div>

                                            <div class="col-sm-8" style="font-weight: bold">
                                                ${info.officeByOfficeId.name}
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <div for="officeID" style="padding: 0" class="col-sm-4 control-label">Loại
                                                văn phòng:
                                            </div>

                                            <div class="col-sm-8" style="font-weight: bold">
                                                ${info.officeByOfficeId.categoryByCategoryId.description}
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <div for="officeID" style="padding: 0" class="col-sm-4 control-label">Địa
                                                chỉ văn phòng:
                                            </div>

                                            <div class="col-sm-8">
                                                ${info.officeByOfficeId.address}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group clearfix">
                                            <div class="col-sm-4 control-label" style="text-align: right">Hình ảnh văn
                                                phòng:
                                            </div>
                                            <br>

                                            <div class="col-sm-8">
                                                <div class="images clearfix" id="imageOffice">
                                                </div>
                                                <div class="clear-float"></div>
                                                <input type="hidden" id="imageUrls" name="imageUrls"
                                                       value="${office.imageUrls}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="officeArea" class="col-sm-2 control-label">Diện tích thuê(m<sup>2</sup>):
                                    </div>

                                    <div name="officeArea" id="officeArea" class="col-sm-4">
                                        ${info.officeByOfficeId.area}
                                    </div>
                                    <div class="col-sm-2 control-label" style="text-align: right">Kỳ hạn thanh toán:
                                    </div>

                                    <div class="col-sm-4">
                                        ${info.paymentTermByPaymentTerm.description}
                                        <input type="hidden" name="paymentTerm" id="paymentTerm"
                                               value="${info.paymentTerm}">
                                    </div>

                                </div>
                                <div class="form-group clearfix">
                                    <div for="startDate" class="col-sm-2 control-label">Ngày bắt đầu:</div>

                                    <div name="startDate" id="startDate" class="col-sm-4">
                                            <fmt:formatDate value="${info.startDate}"
                                                            pattern="dd-MM-yyyy"/>
                                            <input type="hidden" id="startDateValue" name="startDateValue"
                                                   value="${info.startDate}">
                                    </div>
                                    <div for="endDate" style="text-align: right" class="col-sm-2 control-label">Ngày kết
                                        thúc:
                                    </div>

                                    <div name="endDate" id="endDate" class="col-sm-4">
                                            <fmt:formatDate value="${info.endDate}"
                                                            pattern="dd-MM-yyyy"/>
                                            <input type="hidden" id="endDateValue" name="endDateValue"
                                                   value="${info.endDate}">
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="paymentFee" class="col-sm-2 control-label">Giá thuê/m<sup>2</sup>:</div>

                                    <div name="paymentFee" id="paymentFee" class="col-sm-4">
                                        ${info.paymentFee} VNĐ
                                            <input type="hidden" id="paymentFeeValue" name="paymentFeeValue"
                                                   value="${info.paymentFee}">
                                    </div>
                                    <div for="deposit" style="text-align: right" class="col-sm-2 control-label">Số
                                        tiền đặt cọc:
                                    </div>

                                    <input type="hidden" id="depositValue" name="depositValue"
                                           value="${info.deposit}">
                                    <div class="col-sm-4" id="deposit" name="deposit">
                                        ${info.deposit}
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="total" class="col-sm-2 control-label">Tổng số tiền thanh toán mỗi kỳ:
                                    </div>

                                    <div name="total" id="total" style="font-weight: bold" class="col-sm-4">

                                    </div>
                                    <div for="totalContract" style="text-align: right" class="col-sm-2 control-label">
                                        Tổng giá trị hợp đồng:
                                    </div>

                                    <div name="totalContract" style="font-weight: bold" id="totalContract" class="col-sm-4">
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div class="col-sm-2 control-label">Số tiền hoàn trả cho bên B(VNĐ):
                                    </div>

                                    <div class="col-sm-4">
                                        <input type="number" name="returnMoney" id="returnMoney" min="0"
                                               style="width: 100%" onchange="calculateTotalContract()"
                                               value="">
                                    </div>
                                    <div class="col-sm-2 control-label" style="text-align: right">Số tiền đặt cọc trả cho bên B(VNĐ):
                                    </div>

                                    <div class="col-sm-4">
                                        <input type="number" name="returnDeposit" id="returnDeposit" min="0" max="${info.deposit}"
                                               style="width: 100%"
                                               value="${info.deposit}">
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin: 20px auto; ">
                                <div style="text-align:center; border-bottom:2px solid #000000"><h3>Hình ảnh văn bản
                                    hợp
                                    đồng</h3></div>
                                <div class="form-group clearfix">
                                    <input type="hidden" name="imageUrl" id="imageUrl" value="${info.imageUrl}">

                                    <div class="images clearfix" id="images">
                                        <div class="upload-img">
                                            <div class="img"><img width="100%"
                                                    src="${info.imageUrl!=null?info.imageUrl:'/upload/placeholder.jpg'}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear-float"></div>
                                    <input type="file" id="file" name="file" accept="image/*"
                                           title="Mời chọn hình ảnh">
                                </div>
                            </div>

                            <div class="button-post">
                                <button type="submit" value="confirm" name="button" class="btn btn-danger">Xác nhận
                                </button>
                                <button type="submit" value="cancel" name="button" class="btn btn-success">Hủy yêu cầu
                                </button>
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
<script type="text/javascript">
    $(document).ready(function () {
        calculateTotalContract();
        calculateReturnMoney();
        document.getElementById('deposit').innerHTML = numberWithCommas(document.getElementById('depositValue').value) + ' VNĐ';
        document.getElementById('paymentFee').innerHTML = numberWithCommas(document.getElementById('paymentFeeValue').value) + ' VNĐ';
    });
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
    ;
    function calculateTotalContract() {
        var startDate = document.getElementById('startDateValue').value;
        var endDate = document.getElementById('endDateValue').value;
        var start = new Date(startDate);
        var end = new Date(endDate);

        var time = Math.ceil((end.getTime() - start.getTime()) / (86400000 * 30));
        var payment;

        var paymentTerm = document.getElementById('paymentTerm').value;
        switch (paymentTerm) {
            case '1':
                payment = 1;
                break;
            case '2':
                payment = 3;
                break;
            case '3':
                payment = 6;
                break;
        }
        var officeArea = document.getElementById('officeArea').innerText;
        var paymentFee = document.getElementById('paymentFeeValue').value;

        var total = paymentFee * parseInt(officeArea) * payment;
        var totalContract = paymentFee * parseInt(officeArea) * time;

        document.getElementById('total').innerHTML = numberWithCommas(total) + ' VNĐ';
        document.getElementById('totalContract').innerHTML = numberWithCommas(totalContract) + ' VNĐ';
        document.getElementById('returnMoney').setAttribute('max', totalContract + '');
    }
    function calculateReturnMoney() {
        var start = new Date();
        var endDate = document.getElementById('endDateValue').value;
        var end = new Date(endDate);
        var time = Math.ceil((end.getTime() - start.getTime()) / 86400000);
        var officeArea = document.getElementById('officeArea').innerText;
        var paymentFee = document.getElementById('paymentFeeValue').value;

        var returnMoney = parseInt(officeArea) * paymentFee * (time/30);
        document.getElementById('returnMoney').value = Math.floor(returnMoney/100) * 100;

    }
</script>
</body>
</html>

