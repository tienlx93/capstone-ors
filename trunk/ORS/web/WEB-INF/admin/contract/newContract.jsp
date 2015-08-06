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
                        Tạo hợp đồng
                    </div>
                    <div>
                        <form action="contract" method="post" name="createContract" onsubmit="return validateArea()">
                            <div class="form-group clearfix" hidden>
                                <label for="appointmentID" class="col-sm-2 control-label">Id</label>
                                ${appointmentList.id}<input type="hidden" name="appointmentID" id="appointmentID"
                                                            value="${appointmentList.id}">
                            </div>

                            <div class="form-group clearfix">
                                <label for="customerName" class="col-sm-2 control-label">Khách hàng</label>

                                <div class="col-sm-10">
                                    ${appointmentList.accountByCustomerUsername.username}
                                    <input type="hidden" id="customerName" name="customerName"
                                           value="${appointmentList.accountByCustomerUsername.username}">
                                </div>
                            </div>

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

                            <c:if test="${office.categoryId == 2}">
                                <div class="form-group clearfix">
                                    <label for="officeAddress" class="col-sm-2 control-label">Địa chỉ văn phòng</label>

                                    <div class="col-sm-10">
                                        <input type="text" id="officeAddress" name="officeAddress"
                                               value="${office.address}">
                                    </div>
                                </div>
                                <div class="form-group clearfix">
                                    <label for="officeArea" class="col-sm-2 control-label">Diện tích văn phòng</label>

                                    <div class="col-sm-10">
                                        <input type="number" id="officeArea" name="officeArea"
                                               value="${office.area}">
                                    </div>

                                    <div hidden>
                                        <input name="parentArea" value="${office.area}">
                                    </div>
                                </div>
                            </c:if>


                            <div class="form-group clearfix">
                                <label for="startDate" class="col-sm-2 control-label">Ngày bắt đầu</label>

                                <div class="col-sm-10">
                                    <input style="display: inline-block" type='text' class="form-control"
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
                                    <input style="display: inline-block" type='text' class="form-control" name="endDate"
                                           id="endDate"
                                           value="${contract.endDate}"/>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="paymentTerm" class="col-sm-2 control-label">Kỳ hạn thanh toán</label>

                                <div class="col-sm-10">
                                    <select name="paymentTerm" class="form-control" id="paymentTerm">
                                        <c:forEach var="item" items="${paymentTermList}">
                                            <option value="${item.id}">
                                                    ${item.description}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="paymentFee" class="col-sm-2 control-label">Giá thuê</label>

                                <div class="col-sm-10">
                                    <input style="display: inline-block" type='number' class="form-control" name="paymentFee"
                                           id="paymentFee" value=""/>
                                </div>
                            </div>

                            <div class="button-post">
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

<script type="text/javascript">
    $(document).ready(function () {
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var start = $('#startDate').datepicker({
            format: 'yyyy-mm-dd',
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            if (ev.date.valueOf() > end.date.valueOf()) {
                var newDate = new Date(ev.date);
                newDate.setDate(newDate.getDate() + 1);
                end.setValue(newDate);
            }
            start.hide();
            $('#endDate')[0].focus();
        }).data('datepicker');

        var end = $('#endDate').datepicker({
            format: 'yyyy-mm-dd',
            onRender: function (date) {
                return date.valueOf() <= start.date.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            end.hide();
        }).data('datepicker');
    });

    function validateArea() {
        var parentArea = document.createContract.parentArea.value;
        var area = document.createContract.officeArea.value;

        if(parseFloat(area) > parseFloat(parentArea)) {
            alert('Diện tích văn phòng con không được lớn hơn diện tích văn phòng cha!');
            return false;
        }
        return true;
    };
</script>

</body>
</html>
