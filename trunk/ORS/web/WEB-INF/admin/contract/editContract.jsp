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
<body onload="initialize()">
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title">Quản lí văn phòng</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        <h2 style="margin-top: 5px">Sửa thông tin hợp đồng</h2>
                    </div>
                    <div>
                        <form action="contract" method="post" id="form" onsubmit="return validatePaymentTerm()">
                            <div class="form-group clearfix" hidden>
                                <div class="col-sm-10">
                                    <input type="hidden" id="contractId" name="contractId"
                                           value="${contract.id}">
                                </div>
                            </div>

                            <div class="row" style="margin: auto">
                                <div class="col-sm-12">
                                    <div><h3>Bên cho thuê văn phòng (Bên A)</h3></div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Ông(Bà):
                                        </div>

                                        <div class="col-sm-9">
                                            ${contract.officeByOfficeId.ownerName}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Địa chỉ:
                                        </div>

                                        <div class="col-sm-9">
                                            ${contract.officeByOfficeId.ownerAddress}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Số điện thoại:
                                        </div>

                                        <div class="col-sm-9">
                                            ${contract.officeByOfficeId.ownerPhone}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">Là
                                            đại diện của văn
                                            phòng:
                                        </div>

                                        <div class="col-sm-9">
                                            ${contract.officeByOfficeId.name}
                                            <input type="hidden" id="officeID" name="officeID"
                                                   value="${contract.officeByOfficeId.id}">
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
                                            ${contract.accountByCustomerUsername.profileByUsername.fullName}
                                            <input type="hidden" id="customerName" name="customerName"
                                                   value="${contract.customerUsername}">
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="customerName"
                                             class="col-sm-3 control-label">Địa chỉ:
                                        </div>

                                        <div class="col-sm-9">
                                            ${contract.accountByCustomerUsername.profileByUsername.address}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="customerName"
                                             class="col-sm-3 control-label">Số điện thoại:
                                        </div>

                                        <div class="col-sm-9">
                                            ${contract.accountByCustomerUsername.profileByUsername.phone}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin: 20px auto;">
                                <div style="text-align: center;border-bottom:2px solid #000000; margin-bottom: 20px">
                                    <h3>Thông tin thuê văn phòng</h3></div>
                                <div class="form-group clearfix">
                                    <div for="officeID" class="col-sm-2 control-label">Tên văn phòng</div>

                                    <div class="col-sm-10" style="font-weight: bold">
                                        ${contract.officeByOfficeId.name}
                                        <input type="hidden" id="officeID" name="officeID"
                                               value="${contract.officeByOfficeId.id}">
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="officeCategory" class="col-sm-2 control-label">Loại văn phòng</div>

                                    <div class="col-sm-10" style="font-weight: bold">
                                        ${contract.officeByOfficeId.categoryByCategoryId.description}
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="officeAddress" class="col-sm-2 control-label">Địa chỉ văn phòng</div>

                                    <div class="col-sm-10">
                                        ${contract.officeByOfficeId.address}
                                    </div>
                                </div>

                                <c:if test="${contract.officeByOfficeId.categoryByCategoryId.id == 2}">
                                    <div class="form-group clearfix">
                                        <div for="officeArea" class="col-sm-2 control-label">Diện tích thuê văn
                                            phòng (m<sup>2</sup>):
                                        </div>

                                        <div class="col-sm-4">
                                            <input type="number" onkeydown="calculatePaymentFee()" id="officeArea" readonly
                                                   name="officeArea" min="${contract.officeByOfficeId.minArea}"
                                                   class="form-control"
                                                   value="${contract.officeByOfficeId.area}" required="true">
                                        </div>
                                        <div hidden>
                                            <input name="parentArea" value="${contract.officeByOfficeId.area}">
                                            <input name="minArea" value="${contract.officeByOfficeId.minArea}">
                                        </div>
                                        <div for="time" style="text-align: right" class="col-sm-2 control-label">Thời
                                            gian thuê (tháng):
                                        </div>

                                        <div class="col-sm-4">
                                            <input type='number' class="form-control"
                                                   onchange="calculateEndDate();calculatePaymentFee()"
                                                   name="time" min="${contract.officeByOfficeId.minTime}"
                                                   id="time" required="true"
                                                   value="${contract.officeByOfficeId.minTime}"/>
                                        </div>
                                        <div hidden>
                                            <input name="minTime" value="${contract.officeByOfficeId.minTime}">
                                        </div>
                                        <div class="col-sm-12" style="margin: auto;">
                                            <div class="col-sm-6"></div>
                                            <div class="col-sm-2" style="padding: 0;text-align: right"><h5
                                                    style=" color: red">Lưu ý:</h5>
                                            </div>
                                            <div class="col-sm-4">
                                                <h5 style=" color: red">Thời gian thuê tối thiểu là: <span
                                                        style="font-weight: bold">${contract.officeByOfficeId.minTime} tháng</span>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${contract.officeByOfficeId.categoryByCategoryId.id == 1}">
                                    <div class="form-group clearfix">
                                        <div for="officeArea" class="col-sm-2 control-label">Diện tích văn
                                            phòng (m<sup>2</sup>):
                                        </div>

                                        <div class="col-sm-4">
                                                ${contract.officeByOfficeId.area}
                                            <input type="hidden" id="officeArea"
                                                   name="officeArea" value="${contract.officeByOfficeId.area}">
                                        </div>
                                        <div for="time" style="text-align: right" class="col-sm-2 control-label">Thời
                                            gian thuê (tháng):
                                        </div>

                                        <div class="col-sm-4">
                                            <input type='number' class="form-control"
                                                   onchange="calculateEndDate();calculatePaymentFee()"
                                                   name="time" min="${contract.officeByOfficeId.minTime}"
                                                   id="time" required="true"
                                                   value="${contract.officeByOfficeId.minTime}"/>
                                        </div>
                                        <div hidden>
                                            <input name="minTime" value="${contract.officeByOfficeId.minTime}">
                                        </div>
                                        <div class="col-sm-12" style="margin: auto;">
                                            <div class="col-sm-6"></div>
                                            <div class="col-sm-2" style="padding: 0;text-align: right"><h5
                                                    style=" color: red">Lưu ý:</h5>
                                            </div>
                                            <div class="col-sm-4">
                                                <h5 style=" color: red">Thời gian thuê tối thiểu là: <span
                                                        style="font-weight: bold">${contract.officeByOfficeId.minTime} tháng</span>
                                                </h5>
                                            </div>
                                        </div>

                                    </div>
                                </c:if>

                                <div class="form-group clearfix">
                                    <div for="startDate" class="col-sm-2 control-label">Ngày bắt đầu:</div>

                                    <div class="col-sm-4">
                                        <input type='text' class="form-control"
                                               name="startDate"
                                               id="startDate"
                                               value="${contract.startDate}"/>
                                    </div>


                                    <div for="endDate" style="text-align: right" class="col-sm-2 control-label">Ngày kết
                                        thúc:
                                    </div>

                                    <div class="col-sm-4">
                                        <input style="display: inline-block" readonly type='text'
                                               class="form-control"
                                               name="endDate"
                                               id="endDate"
                                               value="${contract.endDate}"/>
                                    </div>
                                </div>

                                <div class="form-group clearfix">

                                    <div for="paymentTerm" class="col-sm-2 control-label">Kỳ hạn thanh toán</div>

                                    <div class="col-sm-4">
                                        <select name="paymentTerm" class="form-control"
                                                onchange="calculatePaymentFee();"
                                                id="paymentTerm" required="true">
                                            <option value="">Xin chọn thời hạn thanh toán</option>
                                            <c:forEach var="item" items="${paymentTermList}">
                                                <option value="${item.id}"
                                                        <c:if test="${contract.paymentTerm ==item.id}">selected</c:if> >
                                                        ${item.description}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                </div>

                                <div class="form-group clearfix">
                                    <c:if test="${contract.officeByOfficeId.categoryByCategoryId.id == 2}">

                                        <div for="paymentFee" class="col-sm-2 control-label">
                                            Giá thuê/m<sup>2</sup>:
                                        </div>

                                        <div class="col-sm-4">
                                            <input style="display: inline-block" type='number'
                                                   onchange="calculatePaymentFee()" class="form-control"
                                                   name="paymentFee" readonly
                                                   id="paymentFee" value="${contract.paymentFee}" required="true"/>
                                        </div>
                                    </c:if>
                                    <c:if test="${contract.officeByOfficeId.categoryByCategoryId.id == 1}">
                                        <div for="paymentFee"  class="col-sm-2 control-label">
                                            Giá thuê/m<sup>2</sup>:
                                        </div>

                                        <div class="col-sm-4">
                                            <input style="display: inline-block" type='number'
                                                   onchange="calculatePaymentFee()" class="form-control"
                                                   name="paymentFee" readonly
                                                   id="paymentFee"
                                                   value="${contract.paymentFee}"
                                                   required="true"/>
                                        </div>
                                    </c:if>
                                    <div for="deposit" style="text-align: right" class="col-sm-2 control-label">Tiền đặt cọc văn phòng:</div>

                                    <div class="col-sm-4">
                                        <input style="display: inline-block" type='text' class="form-control"
                                               name="deposit" onkeyup="formatDeposit()"
                                               id="deposit" value="${contract.deposit}"/>
                                    </div>
                                    <input style="display: inline-block" type='hidden' class="form-control"
                                           name="depositValue"
                                           id="depositValue" value="${contract.deposit}"/>

                                </div>
                                <div class="form-group clearfix">
                                    <div for="total"  class="col-sm-2 control-label">Số tiền
                                        phải thanh toán mỗi kỳ:
                                    </div>

                                    <div class="col-sm-4" style="font-weight: bold" name="total" id="total">

                                    </div>
                                    <div for="totalContract" style="text-align: right" class="col-sm-2 control-label">Tổng giá
                                        trị hợp đồng:
                                    </div>

                                    <div class="col-sm-4" style="font-weight: bold" name="totalContract" id="totalContract">

                                    </div>
                                </div>

                                <div class="row" style="margin: 20px auto; ">
                                    <div style="text-align:center; border-bottom:2px solid #000000"><h3>Hình ảnh văn bản
                                        hợp
                                        đồng</h3></div>
                                    <div class="form-group clearfix">
                                        <div class="col-sm-12">
                                            <div class="images clearfix" id="imageContract">
                                            </div>
                                            <div class="clear-float"></div>
                                            <input type="hidden" id="imageUrls" name="imageUrls"
                                                   value="${contract.imageUrl}">
                                        </div>
                                    </div>
                                </div>
                                <div class="button-post">
                                    <button type="submit" value="update" class="btn btn-primary" name="action">Cập
                                        nhật
                                    </button>
                                    <a href="/admin/contract" class="btn btn-default">Hủy</a>
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
    $(document).ready(function () {
        var startDate = document.getElementById('startDate').value;
        var endDate = document.getElementById('endDate').value;
        var start = new Date(startDate);
        var end = new Date(endDate);

        var time = document.getElementById('time');
        time.value = Math.ceil((end.getTime() - start.getTime()) / (86400000 * 30));

        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var start = $('#startDate').datepicker({
            format: 'yyyy-mm-dd',
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            calculateEndDate();
//      calculatePaymentFee();
        }).data('datepicker');

        var paymentTerm = document.getElementById('paymentTerm').value;
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
        var area = document.getElementById('officeArea').value;
        var fee = document.getElementById('paymentFee').value;

        var total = time * parseInt(fee) * parseFloat(area);
        var deposit = document.getElementById('deposit').value != '' ? document.getElementById('deposit').value : 0;
        var contractTotal= total;
        document.getElementById('total').innerHTML = numberWithCommas(total) + ' VNĐ';
        document.getElementById('paymentFee').innerHTML = numberWithCommas(fee);
        document.getElementById('totalContract').innerHTML = numberWithCommas(contractTotal) + ' VNĐ';

        var imageUrls = $("#imageUrls").val();
        console.log(imageUrls);
        renderImg(imageUrls);
    });
    function calculateEndDate() {
        var end = document.getElementById('endDate');
        var start = document.getElementById('startDate').value.split("-");
        console.log(start);
        var startTime = Date.parse(new Date(start[0], start[1] - 1, start[2]));
        var endTime;
        var time = document.getElementById('time').value;
        endTime = startTime + (86400000 * time * 30);
        end.value = formatTime(endTime) != undefined ? formatTime(endTime) : "";
    }
    ;
    function calculatePaymentFee() {
        var paymentTerm = document.getElementById('paymentTerm').value;
        var officeArea = document.getElementById('officeArea').value;
        var paymentFee = document.getElementById('paymentFee').value;
        var contractTime = document.getElementById('time').value;
        var deposit = document.getElementById('deposit').value != '' ? document.getElementById('deposit').value : 0;

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
        if (paymentTerm != '' && officeArea != null && paymentFee != null) {
            var total = numberWithCommas(parseInt(paymentFee) * officeArea * time);
            var price = document.getElementById('total');
            price.innerHTML = numberWithCommas(total) + ' VNĐ';
            var contractTotal = numberWithCommas(officeArea * contractTime * parseInt(paymentFee));
            console.log(contractTotal);

            document.getElementById('totalContract').innerHTML = contractTotal + ' VNĐ';
        }
    }
    function formatTime(time) {
        if (time) {
            var formatTime = new Date(time);
            var day = formatTime.getDate();
            var month = formatTime.getMonth() + 1;
            if (day < 10) {
                day = '0' + day
            }
            if (month < 10) {
                month = '0' + month
            }
            var year = formatTime.getFullYear();

            return day + '-' + month + '-' + year;
        }

    }
    ;
    function formatDeposit() {
        var deposit = document.getElementById('deposit').value != '' ? document.getElementById('deposit').value : 0;
        if (deposit != 0) {
            document.getElementById('depositValue').value = parseFloat(deposit.replace(/\./g, ''));
            document.getElementById('deposit').value = numberWithCommas(document.getElementById('depositValue').value);
        }
    }
    ;
    function validatePaymentTerm() {
        var paymentTerm = document.getElementById('paymentTerm').value;
        var contractTime = document.getElementById('time').value;

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
        if(contractTime < time) {
            alert('Thời gian thuê không được nhỏ hơn kỳ hạn thanh toán');
            return false;
        }
        return true;
    }
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
    ;
    var renderImg = function () {
        var list = imageUrls.split(",");
        for (var i = 0; i < list.length; i++) {
            var img = list[i];
            if (img) {
                $('#images').append('<div class="upload-img">' +
                '<div class="img" style="height: 300px"><img src="' + img + '"></div>' +
                '<div class="remove" onclick="removeImg(\'' + img + '\')">' +
                '<i class="fa fa-minus-circle"></i>Xóa' +
                '</div>' +
                '</div>');
            }
        }
    };
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/loadImg.js" charset="UTF-8"></script>


</body>
</html>
