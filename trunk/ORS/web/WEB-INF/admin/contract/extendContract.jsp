<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 24/06/2015
  Time: 2:34 CH
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
                        <h2 style="margin-top: 5px">Gia hạn hợp đồng</h2>
                    </div>
                    <div>
                        <form action="contract?action=editExtend" method="post">
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
                                            ${info.officeByOfficeId.accountByOwnerUsername.profileByUsername.fullName}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Địa chỉ:
                                        </div>

                                        <div class="col-sm-9">
                                            ${info.officeByOfficeId.accountByOwnerUsername.profileByUsername.address}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Số điện thoại:
                                        </div>

                                        <div class="col-sm-9">
                                            ${info.officeByOfficeId.accountByOwnerUsername.profileByUsername.phone}
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
                                <div class="form-group clearfix">
                                    <div for="officeID" class="col-sm-2 control-label">Tên văn phòng:</div>

                                    <div class="col-sm-10" style="font-weight: bold">
                                        ${info.officeByOfficeId.name}
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="officeID" class="col-sm-2 control-label">Loại văn phòng:</div>

                                    <div class="col-sm-10" style="font-weight: bold;">
                                        ${info.officeByOfficeId.categoryByCategoryId.description}
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="officeID" class="col-sm-2 control-label">Địa chỉ văn phòng:</div>

                                    <div class="col-sm-10">
                                        ${info.officeByOfficeId.address}
                                    </div>
                                </div>
                                <div class="form-group clearfix" hidden>
                                    <div class="col-sm-10">
                                        <input type="hidden" name="officeId" value="${info.officeId}">
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="amenities" class="col-sm-2 control-label">
                                        Các tiện ích theo văn phòng:
                                    </div>
                                    <div class="col-sm-10">
                                        <c:forEach items="${info.officeByOfficeId.officeAmenitiesById}" var="item">
                                            <span style="padding: 0;margin-bottom: 10px" class="col-sm-2">${item.amenityByAmenityId.name}</span>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="startDate" class="col-sm-2 control-label">Diện tích thuê(m<sup>2</sup>):
                                    </div>

                                    <div class="col-sm-4">
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
                                    <div for="startDate" class="col-sm-2 control-label">Ngày bắt đầu</div>

                                    <div class="col-sm-4" id="startDate">
                                        ${info.startDate}
                                    </div>
                                    <div for="endDate" style="text-align: right" class="col-sm-2 control-label">Ngày kết
                                        thúc
                                    </div>

                                    <div class="col-sm-4" id="end" name="end">
                                        ${info.endDate}
                                    </div>
                                    <input type="hidden" value="" id="extendDate" name="extendDate"/>

                                    <input style="display: inline-block" type='hidden' class="form-control"
                                           name="endDate"
                                           id="endDate" value="${info.endDate}"/>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="paymentFee" class="col-sm-2 control-label">Giá thuê/m<sup>2</sup>:</div>

                                    <div class="col-sm-4" name="paymentFee" id="paymentFee">
                                        ${info.paymentFee}
                                    </div>
                                    <div for="deposit" style="text-align: right" class="col-sm-2 control-label">Số
                                        tiền đặt cọc:
                                    </div>
                                    <input type="hidden" id="depositValue" name="depositValue"
                                           value="${info.deposit}">
                                    <div class="col-sm-4" id="deposit" name="deposit">
                                        ${info.deposit} <span>VNĐ</span>

                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="startDate" class="col-sm-2 control-label">Thời gian gia hạn(tháng):</div>

                                    <div class="col-sm-4">
                                        <input style="display: inline-block" type='number' min="0" class="form-control"
                                               name="extendTime"
                                               id="extendTime" onchange="calculateEndDate()"
                                               value=""/>
                                    </div>
                                </div>

                            </div>
                            <div class="button-post">
                                <button type="submit" value="confirm" name="button" class="btn btn-primary">Xác nhận
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
        document.getElementById('startDate').innerHTML = formatTime(document.getElementById('startDate').innerHTML);
        document.getElementById('end').innerHTML = formatTime(document.getElementById('end').innerHTML);
        document.getElementById('deposit').innerHTML = numberWithCommas(document.getElementById('deposit').innerText);
        var fee = document.getElementById('paymentFee').innerText;

        document.getElementById('paymentFee').innerHTML = numberWithCommas(fee) + ' VNĐ';

    });
    function calculateEndDate() {
        var end = document.getElementById('end');
        var start = document.getElementById('endDate').value.split("-");
        var startTime = Date.parse(new Date(start[0], start[1] - 1, start[2]));
        var endTime;
        var time = document.getElementById('extendTime').value;
        endTime = startTime + (86400000 * time * 30);
        end.innerHTML = formatTime(endTime) != undefined ? formatTime(endTime) : "";
        document.getElementById('extendDate').value = end.innerHTML;
    }
    ;
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
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
    ;
</script>

</body>
</html>


