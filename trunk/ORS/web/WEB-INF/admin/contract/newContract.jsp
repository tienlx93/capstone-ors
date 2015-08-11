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
                        Tạo hợp đồng
                    </div>
                    <div>
                        <form action="contract" method="post" name="createContract" onsubmit="return validateArea()">
                            <div class="form-group clearfix" hidden>
                                <label for="appointmentID" class="col-sm-2 control-label">Id</label>
                                ${appointmentList.id}<input type="hidden" name="appointmentID" id="appointmentID"
                                                            value="${appointmentList.id}">
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
                                    ${appointmentList.officeByOfficeId.name}
                                    <input type="hidden" id="officeID" name="officeID"
                                           value="${appointmentList.officeByOfficeId.id}">
                                </div>
                            </div>

                            <div>Bên thuê văn phòng (Bên B)</div>
                            <div class="form-group clearfix">
                                <label for="customerName" class="col-sm-2 control-label">Ông(Bà):</label>

                                <div class="col-sm-10">
                                    ${appointmentList.accountByCustomerUsername.profileByUsername.fullName}
                                    <input type="hidden" id="customerName" name="customerName"
                                           value="${appointmentList.customerUsername}">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="customerName" class="col-sm-2 control-label">Địa chỉ:</label>

                                <div class="col-sm-10">
                                    ${appointmentList.accountByCustomerUsername.profileByUsername.address}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="customerName" class="col-sm-2 control-label">Số điện thoại:</label>

                                <div class="col-sm-10">
                                    ${appointmentList.accountByCustomerUsername.profileByUsername.phone}
                                </div>
                            </div>

                            <div>Thông tin thuê văn phòng:</div>
                            <div class="form-group clearfix">
                                <label for="officeID" class="col-sm-2 control-label">Tên văn phòng</label>

                                <div class="col-sm-10">
                                    ${appointmentList.officeByOfficeId.name}
                                    <input type="hidden" id="officeID" name="officeID"
                                           value="${appointmentList.officeByOfficeId.id}">
                                </div>
                            </div>
                            <div class="form-group clearfix" hidden>
                                <label for="categoryId" class="col-sm-2 control-label">Id</label>
                                ${office.categoryId}<input type="hidden" name="categoryId" id="categoryId"
                                                           value="${office.categoryId}">
                            </div>
                            <div class="form-group clearfix">
                                <label for="officeCategory" class="col-sm-2 control-label">Loại văn phòng</label>

                                <div class="col-sm-10">
                                    ${office.categoryByCategoryId.description}
                                    <input type="hidden" id="officeCategory" name="officeCategory"
                                           value="${office.categoryByCategoryId.description}">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="officeAddress" class="col-sm-2 control-label">Địa chỉ văn phòng</label>

                                <div class="col-sm-10">
                                    ${office.address}
                                    <input type="hidden" id="officeAddress" name="officeAddress"
                                           value="${office.address}">
                                </div>
                            </div>
                            <c:if test="${office.categoryId == 2}">
                                <div class="form-group clearfix">
                                    <label for="officeArea" class="col-sm-2 control-label">Diện tích thuê văn
                                        phòng(m2):</label>

                                    <div class="col-sm-10">
                                        <input type="number" onkeydown="calculatePaymentFee()" id="officeArea"
                                               name="officeArea" min="${office.minArea}"
                                               value="${office.minArea}" required="true">
                                        Diện tích thuê tối thiểu là: ${office.minArea} m2
                                    </div>
                                    <div hidden>
                                        <input name="parentArea" value="${office.area}">
                                        <input name="minArea" value="${office.minArea}">
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${office.categoryId == 1}">
                                <div class="form-group clearfix">
                                    <label for="officeArea" class="col-sm-2 control-label">Diện tích văn
                                        phòng(m2):</label>

                                    <div class="col-sm-10">
                                            ${office.area}
                                        <input type="hidden" id="officeArea"
                                               name="officeArea" value="${office.area}">
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-group clearfix">
                                <label for="startDate" class="col-sm-2 control-label">Ngày bắt đầu</label>

                                <div class="col-sm-10">
                                    <input type='text' class="form-control"
                                           name="startDate"
                                           id="startDate"
                                           value="${contract.startDate}"/>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="time" class="col-sm-2 control-label">Thời gian thuê(tháng):</label>

                                <div class="col-sm-10">
                                    <input type='number' class="form-control"
                                           onchange="calculateEndDate();calculatePaymentFee()"
                                           name="time" min="${office.minTime}"
                                           id="time" required="true"
                                           value="${office.minTime}"/>
                                    Thời gian thuê tối thiểu là: ${office.minTime} tháng
                                </div>
                                <div hidden>
                                    <input name="minTime" value="${office.minTime}">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="endDate" class="col-sm-2 control-label">Ngày kết thúc</label>

                                <div class="col-sm-10">
                                    <input style="display: inline-block" readonly type='text' class="form-control"
                                           name="endDate"
                                           id="endDate"
                                           value="${contract.endDate}"/>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="paymentTerm" class="col-sm-2 control-label">Kỳ hạn thanh toán</label>

                                <div class="col-sm-10">
                                    <select name="paymentTerm" class="form-control" onchange="calculatePaymentFee();"
                                            id="paymentTerm" required="true">
                                        <option value="">Xin chọn thời hạn thanh toán</option>
                                        <c:forEach var="item" items="${paymentTermList}">
                                            <option value="${item.id}">
                                                    ${item.description}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <c:if test="${office.categoryId == 2}">
                                <div class="form-group clearfix">
                                    <label for="paymentFee" class="col-sm-2 control-label">Giá thuê/m2:</label>

                                    <div class="col-sm-10">
                                        <input style="display: inline-block" type='number'
                                               onchange="calculatePaymentFee()" class="form-control"
                                               name="paymentFee"
                                               id="paymentFee" value="${office.price}" required="true"/>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${office.categoryId == 1}">
                                <div class="form-group clearfix">
                                    <label for="paymentFee" class="col-sm-2 control-label">Giá thuê/m2:</label>

                                    <div class="col-sm-10">
                                        <input style="display: inline-block" type='number'
                                               onchange="calculatePaymentFee()" class="form-control"
                                               name="paymentFee"
                                               id="paymentFee" value="${office.price / office.area}" required="true"/>
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-group clearfix">
                                <label for="price" class="col-sm-2 control-label">Số tiền phải thanh toán mỗi
                                    kỳ(VNĐ):</label>

                                <div class="col-sm-10">
                                    <span name="price" id="price"></span>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="deposit" class="col-sm-2 control-label">Tiền đặt cọc</label>

                                <div class="col-sm-10">
                                    <input style="display: inline-block" type='number' class="form-control"
                                           name="deposit"
                                           id="deposit" value=""/>
                                </div>
                            </div>
                            <div class="button-post">
                                <button type="submit" value="save" name="action" class="btn btn-primary">Tạo mới
                                </button>
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
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var start = $('#startDate').datepicker({
            format: 'dd-mm-yyyy',
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            calculateEndDate();
            calculatePaymentFee();
        }).data('datepicker');
    });

    function calculatePaymentFee() {
        var paymentTerm = document.getElementById('paymentTerm').value;
        var officeArea = document.getElementById('officeArea').value;
        var paymentFee = document.getElementById('paymentFee').value;
        var time;
        console.log(officeArea);
        console.log(paymentFee);
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
            console.log(total);
            var price = document.getElementById('price');
            price.innerHTML = numberWithCommas(total);
        }
    }
    ;

    function calculateEndDate() {
        var end = document.getElementById('endDate');
        var start = document.getElementById('startDate').value.split("-");
        var startTime = Date.parse(new Date(start[2], start[1] - 1, start[0]));
        var endTime;
        var time = document.getElementById('time').value;
        endTime = startTime + (86400000 * time * 30);
        end.value = formatTime(endTime) != undefined ? formatTime(endTime) : "";
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
    function validateArea() {
        var parentArea = document.createContract.parentArea.value;
        var minArea = document.createContract.minArea, value;
        var area = document.createContract.officeArea.value;

        console.log(parentArea);
        console.log(area);
        if (parseFloat(area) > parseFloat(parentArea)) {
            alert('Diện tích văn phòng con không được lớn hơn diện tích văn phòng cha!');
            return false;
        } else if (parseFloat(minArea) > parseFloat(area)) {
            alert('Diện tích thuê không được nhỏ hơn diện tích tối thiểu');
            return false;
        }
        return true;
    }
    ;
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }
    ;
</script>

</body>
</html>
