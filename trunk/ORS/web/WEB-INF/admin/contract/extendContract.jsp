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
                        Gia hạn hợp đồng
                    </div>
                    <div>
                        <form action="contract?action=editExtend" method="post">
                            <div class="form-group clearfix" hidden>
                                <label for="id" class="col-sm-2 control-label">Id</label>
                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>

                            <div class="form-group clearfix">
                                <label for="customerName" class="col-sm-2 control-label">Khách hàng</label>

                                <div class="col-sm-10">
                                    ${info.accountByCustomerUsername.username}
                                    <input type="hidden" id="customerName" name="customerUsername"
                                           value="${info.accountByCustomerUsername.username}">
                                </div>
                            </div>

                            <div class="form-group clearfix" hidden>
                                <div class="col-sm-10">
                                    <input type="hidden" name="officeId" value="${info.officeId}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="nameOfiice" class="col-sm-2 control-label">Văn phòng</label>

                                <div class="col-sm-10">
                                    ${info.officeByOfficeId.id}
                                    <input type="hidden" id="nameOfiice"
                                           value="${info.officeByOfficeId.id}">
                                </div>
                            </div>

                            <div class="form-group clearfix" hidden>
                                <div class="col-sm-10">
                                    <input type="hidden" name="startDate" value="${info.startDate}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="endDate" class="col-sm-2 control-label">Ngày kết thúc</label>

                                <div class="col-sm-10">
                                    <input style="display: inline-block" type='text' class="form-control" name="endDate"
                                           id="endDate"
                                           value="${info.endDate}"/>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="paymentTerm" class="col-sm-2 control-label">Thời hạn thanh toán</label>

                                <div class="col-sm-10">
                                    <select name="paymentTerm" class="form-control" id="paymentTerm">
                                        <c:forEach var="item" items="${paymentTermList}">
                                            <option value="${item.id}"
                                                    <c:if test="${info.paymentTerm ==item.id}">selected</c:if> >
                                                    ${item.description}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="paymentFee" class="col-sm-2 control-label">Giá</label>

                                <div class="col-sm-10">
                                    <input type='text' class="form-control" name="paymentFee" id="paymentFee"
                                           value="${info.paymentFee}"/>
                                </div>
                            </div>

                            <div class="button-post">
                                <button type="submit" value="confirm" name="button" class="btn">Xác nhận</button>
                                <button type="submit" value="cancel" name="button" class="btn">Hủy yêu cầu</button>
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
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var start = $('#startDate').datepicker({
            format: 'yyyy-mm-dd',
            onRender: function (date) {
                return date.valueOf() < now.valueOf() ? 'disabled' : '';
            }
        }).on('changeDate', function (ev) {
            if (ev.date.valueOf() > checkout.date.valueOf()) {
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
</script>

</body>
</html>


