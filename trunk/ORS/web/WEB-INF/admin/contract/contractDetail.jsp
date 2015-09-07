<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

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
                        <h2 style="margin-top: 5px">Thông tin hợp đồng</h2>
                    </div>
                    <div>
                        <form action="contract" method="get" name="contractDetail" onsubmit="return validateArea()">
                            <div class="form-group clearfix hidden">
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
                                            ${contract.officeByOfficeId.accountByOwnerUsername.profileByUsername.fullName}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Địa chỉ:
                                        </div>

                                        <div class="col-sm-9">
                                            ${contract.officeByOfficeId.accountByOwnerUsername.profileByUsername.address}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Số điện thoại:
                                        </div>

                                        <div class="col-sm-9">
                                            ${contract.officeByOfficeId.accountByOwnerUsername.profileByUsername.phone}
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
                                                ${contract.officeByOfficeId.name}
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <div for="officeID" style="padding: 0" class="col-sm-4 control-label">Loại
                                                văn phòng:
                                            </div>

                                            <div class="col-sm-8" style="font-weight: bold">
                                                ${contract.officeByOfficeId.categoryByCategoryId.description}
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <div for="officeID" style="padding: 0" class="col-sm-4 control-label">Địa
                                                chỉ văn phòng:
                                            </div>

                                            <div class="col-sm-8">
                                                ${contract.officeByOfficeId.address}
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="form-group clearfix">
                                    <div for="amenities" class="col-sm-2 control-label">
                                        Các tiện ích theo văn phòng:
                                    </div>
                                    <div class="col-sm-10">
                                        <c:forEach items="${contract.officeByOfficeId.officeAmenitiesById}" var="item">
                                            <span style="padding: 0;margin-bottom: 10px" class="col-sm-2">${item.amenityByAmenityId.name}</span>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="officeArea" class="col-sm-2 control-label">Diện tích thuê(m<sup>2</sup>):
                                    </div>

                                    <div name="officeArea" id="officeArea" class="col-sm-4">
                                        ${contract.officeByOfficeId.area}
                                    </div>
                                    <div class="col-sm-2 control-label" style="text-align: right">Kỳ hạn thanh toán:
                                    </div>

                                    <div class="col-sm-4">
                                        ${contract.paymentTermByPaymentTerm.description}
                                        <input type="hidden" name="paymentTerm" id="paymentTerm"
                                               value="${contract.paymentTerm}">
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="startDate" class="col-sm-2 control-label">Ngày bắt đầu:</div>

                                    <div name="startDate" id="startDate" class="col-sm-4">
                                        <fmt:formatDate value="${contract.startDate}"
                                                        pattern="dd-MM-yyyy"/>
                                    </div>
                                    <input type="hidden" id="startValue" value="${contract.startDate}">
                                    <div for="endDate" style="text-align: right" class="col-sm-2 control-label">Ngày kết
                                        thúc:
                                    </div>

                                    <div name="endDate" id="endDate" class="col-sm-4">
                                        <fmt:formatDate value="${contract.endDate}"
                                                        pattern="dd-MM-yyyy"/>
                                    </div>
                                    <input type="hidden" id="endValue" value="${contract.endDate}">
                                </div>
                                <div class="form-group clearfix">
                                    <div for="paymentFee" class="col-sm-2 control-label">Giá thuê/m<sup>2</sup>:</div>

                                    <div name="paymentFee" id="paymentFee" class="col-sm-4">
                                        ${contract.paymentFee} VNĐ
                                    </div>
                                    <div for="deposit" style="text-align: right" class="col-sm-2 control-label">Số
                                        tiền đặt cọc:
                                    </div>
                                    <input type="hidden" id="depositValue" name="depositValue"
                                           value="${contract.deposit}">
                                    <div class="col-sm-4" id="deposit" name="deposit">
                                        ${contract.deposit} <span>VNĐ</span>

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

                                    <div name="totalContract" id="totalContract" style="font-weight: bold" class="col-sm-4">
                                    </div>
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
                                <a class="btn btn-primary" href="contract?action=edit&id=${contract.id}">Chỉnh
                                    sửa</a>
                                <a href="/admin/contract" class="btn btn-default">Quay về</a>
                                <%--<button type="submit" name="action" value="export" class="btn btn-primary">Export--%>
                                <%--</button>--%>
                                <a class="btn btn-info" href="contract?action=export&id=${contract.id}">Export</a>
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
        var area = document.getElementById('officeArea').innerText;
        var fee = document.getElementById('paymentFee').innerText;

        var startDate = document.getElementById('startValue').value;
        var endDate = document.getElementById('endValue').value;
        var start = new Date(startDate);
        var end = new Date(endDate);

        var contractTime = Math.ceil((end.getTime() - start.getTime()) / (86400000 * 30));

        var total = time * parseInt(fee) * parseFloat(area);
        var deposit = document.getElementById('depositValue').value != '' ? document.getElementById('depositValue').value : 0;
        var contractTotal= contractTime * parseInt(fee) * parseFloat(area);
        document.getElementById('total').innerHTML = numberWithCommas(total) + ' VNĐ';
        document.getElementById('paymentFee').innerHTML = numberWithCommas(fee);
        document.getElementById('deposit').innerHTML = numberWithCommas(document.getElementById('deposit').innerText);
        document.getElementById('totalContract').innerHTML = numberWithCommas(contractTotal) + ' VNĐ';

        imageUrls = $("#imageUrls").val();
        console.log(imageUrls);
        renderImg(imageUrls);
    });

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
    ;
    var renderImg = function () {
        var list = imageUrls.split(",");
        console.log(list);
        for (var i = 0; i < list.length; i++) {
            var img = list[i];
            if (img) {
                $('#imageContract').append('<div class="upload-img">' +
                '<div class="img" style="height: 400px"><img width="100%" src="' + img + '"></div>' +
                '</div>');
            }
        }
    };

</script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/loadImg.js" charset="UTF-8"></script>--%>

</body>
</html>
