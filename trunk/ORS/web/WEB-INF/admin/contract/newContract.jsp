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
    <script src="${pageContext.request.contextPath}/lib/bootbox.min.js"></script>
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
                        <h2 style="margin-top: 5px">Tạo hợp đồng</h2>
                    </div>
                    <div>
                        <form action="contract" method="post" name="createContract" class="signForm"
                              onsubmit="return validatePaymentTerm()">
                            <div class="form-group clearfix" hidden>
                                <label for="appointmentID" class="col-sm-2 control-label">Id</label>
                                ${appointmentList.id}<input type="hidden" name="appointmentID" id="appointmentID"
                                                            value="${appointmentList.id}">
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
                                            ${appointmentList.officeByOfficeId.name}
                                            <input type="hidden" id="officeID" name="officeID"
                                                   value="${appointmentList.officeByOfficeId.id}">
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
                                            ${appointmentList.accountByCustomerUsername.profileByUsername.fullName}
                                            <input type="hidden" id="customerName" name="customerName"
                                                   value="${appointmentList.customerUsername}">
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="customerName"
                                             class="col-sm-3 control-label">Địa chỉ:
                                        </div>

                                        <div class="col-sm-9">
                                            ${appointmentList.accountByCustomerUsername.profileByUsername.address}
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="customerName"
                                             class="col-sm-3 control-label">Số điện thoại:
                                        </div>

                                        <div class="col-sm-9">
                                            ${appointmentList.accountByCustomerUsername.profileByUsername.phone}
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
                                                văn phòng
                                            </div>

                                            <div class="col-sm-8" style="font-weight: bold">
                                                ${appointmentList.officeByOfficeId.name}
                                                <input type="hidden" id="officeID" name="officeID"
                                                       value="${appointmentList.officeByOfficeId.id}">
                                            </div>
                                        </div>
                                        <div class="form-group clearfix" hidden>
                                            <div for="categoryId" class="col-sm-2 control-label">Id</div>
                                            ${office.categoryId}<input type="hidden" name="categoryId" id="categoryId"
                                                                       value="${office.categoryId}">
                                        </div>
                                        <div class="form-group clearfix">
                                            <div for="officeCategory" style="padding: 0" class="col-sm-4 control-label">
                                                Loại văn phòng
                                            </div>

                                            <div class="col-sm-8" style="font-weight: bold">
                                                ${office.categoryByCategoryId.description}
                                                <input type="hidden" id="officeCategory" name="officeCategory"
                                                       value="${office.categoryByCategoryId.description}">
                                            </div>
                                        </div>
                                        <div class="form-group clearfix">
                                            <div for="officeAddress" style="padding: 0" class="col-sm-4 control-label">
                                                Địa chỉ văn phòng
                                            </div>

                                            <div class="col-sm-8">
                                                ${office.address}
                                                <input type="hidden" id="officeAddress" name="officeAddress"
                                                       value="${office.address}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="form-group clearfix">

                                        </div>
                                    </div>
                                </div>
                                <c:if test="${office.categoryId == 2}">
                                    <div class="form-group clearfix">
                                        <div for="officeArea" class="col-sm-2 control-label">Diện tích thuê văn
                                            phòng(m<sup>2</sup>):
                                        </div>

                                        <div class="col-sm-4">
                                            <input type="number" onkeydown="calculatePaymentFee()" id="officeArea"
                                                   name="officeArea" min="${office.minArea}" class="form-control"
                                                   value="${office.minArea}" required="true">
                                        </div>

                                        <div hidden>
                                            <input name="parentArea" value="${office.area}">
                                            <input name="minArea" value="${office.minArea}">
                                        </div>
                                        <div for="time" style="text-align: right" class="col-sm-2 control-label">Thời
                                            gian
                                            thuê(tháng):
                                        </div>

                                        <div class="col-sm-4">
                                            <input type='number' class="form-control"
                                                   onchange="calculateEndDate();calculatePaymentFee()"
                                                   name="time" min="${office.minTime}"
                                                   id="time" required="true"
                                                   value="${office.minTime}"/>
                                        </div>
                                        <div hidden>
                                            <input name="minTime" value="${office.minTime}">
                                        </div>
                                        <div class="col-sm-12" style="margin: auto;">
                                            <div class="col-sm-2" style="padding: 0"><h5 style=" color: red">Lưu ý:</h5>
                                            </div>
                                            <div class="col-sm-10">
                                                <h5 style=" color: red">Diện tích thuê tối thiểu là: <span
                                                        style="font-weight: bold">${office.minArea} m<sup>2</sup></span>
                                                    - Diện
                                                    tích thuê tối đa là: <span
                                                            style="font-weight: bold">${office.area} m<sup>2</sup></span>
                                                    - Thời gian thuê tối thiểu là: <span
                                                            style="font-weight: bold">${office.minTime} tháng</span>

                                                </h5>
                                            </div>
                                        </div>

                                    </div>
                                </c:if>
                                <c:if test="${office.categoryId == 1}">
                                    <div class="form-group clearfix">
                                        <div for="officeArea" class="col-sm-2 control-label">Diện tích văn
                                            phòng(m<sup>2</sup>):
                                        </div>

                                        <div class="col-sm-4">
                                                ${office.area}
                                            <input type="hidden" id="officeArea"
                                                   name="officeArea" value="${office.area}">
                                        </div>
                                        <div for="time" style="text-align: right" class="col-sm-2 control-label">Thời
                                            gian
                                            thuê(tháng):
                                        </div>

                                        <div class="col-sm-4">
                                            <input type='number' class="form-control"
                                                   onchange="calculateEndDate();calculatePaymentFee()"
                                                   name="time" min="${office.minTime}"
                                                   id="time" required="true"
                                                   value="${office.minTime}"/>
                                        </div>
                                        <div hidden>
                                            <input name="minTime" value="${office.minTime}">
                                        </div>
                                        <div class="col-sm-12" style="margin: auto;">
                                            <div class="col-sm-6"></div>
                                            <div class="col-sm-2" style="padding: 0;text-align: right"><h5
                                                    style=" color: red">Lưu ý:</h5>
                                            </div>
                                            <div class="col-sm-4">
                                                <h5 style=" color: red">Thời gian thuê tối thiểu là: <span
                                                        style="font-weight: bold">${office.minTime} tháng</span>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="form-group clearfix">
                                    <div for="startDate" class="col-sm-2 control-label">Ngày bắt đầu</div>

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

                                    <div for="paymentTerm" class="col-sm-2 control-label">Kỳ hạn thanh toán:</div>

                                    <div class="col-sm-4">
                                        <select name="paymentTerm" class="form-control"
                                                onchange="calculatePaymentFee();"
                                                id="paymentTerm" required="true">
                                            <c:forEach var="item" items="${paymentTermList}">
                                                <option value="${item.id}">
                                                        ${item.description}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                </div>

                                <div class="form-group clearfix">
                                    <c:if test="${office.price != null}">

                                    <div for="paymentFee" class="col-sm-2 control-label">
                                        Giá thuê/m<sup>2</sup>:
                                    </div>

                                    <div class="col-sm-4">
                                        <input style="display: inline-block" type='number'
                                               onchange="calculatePaymentFee()" class="form-control"
                                               name="paymentFee" step="any" readonly min="0"
                                               id="paymentFee" value="${office.price}"
                                               required="true"/>
                                    </div>
                                    </c:if>
                                    <c:if test="${office.price == null}">

                                        <div for="paymentFee" class="col-sm-2 control-label">
                                            Giá thuê/m<sup>2</sup>:
                                        </div>

                                        <div class="col-sm-4">
                                            <input style="display: inline-block" type='number'
                                                   onchange="calculatePaymentFee()" class="form-control"
                                                   name="paymentFee" step="any" min="0"
                                                   id="paymentFee" value="${office.price}"
                                                   required="true"/>
                                        </div>
                                    </c:if>
                                    <div for="deposit" style="text-align: right" class="col-sm-2 control-label">Tiền đặt
                                        cọc văn phòng(VNĐ):
                                    </div>

                                    <div class="col-sm-4">
                                        <input style="display: inline-block" type='text' class="form-control"
                                               name="deposit" min="0" required="true" onkeyup="formatDeposit()"
                                               id="deposit" value=""/>
                                    </div>
                                    <input type="hidden" name="depositValue" id="depositValue" value=""/>
                                </div>
                                <div class="form-group clearfix">
                                    <div for="endDate" class="col-sm-2 control-label"> số tiền
                                        bên B phải thanh
                                        toán theo mỗi kỳ (<span name="term" id="term" style="font-weight: bold"></span>)(VNĐ):
                                    </div>

                                    <div class="col-sm-4">
                                        <span name="price" id="price" style="font-weight: bold"></span>
                                    </div>
                                    <div for="total" style="text-align: right" class="col-sm-2 control-label">Tổng
                                        giá
                                        trị hợp đồng(VNĐ):
                                    </div>

                                    <div class="col-sm-4">
                                        <input style="display: inline-block;font-weight: bold" readonly type='text'
                                               class="form-control"
                                               name="total" min="0" required="true"
                                               id="total" value=""/>
                                    </div>
                                </div>
                                <%--<div class="form-group clearfix">--%>
                                <%--<div for="price" class="col-sm-12 control-label"><h4>Tổng số tiền bên B phải thanh--%>
                                <%--toán cho bên A theo mỗi--%>
                                <%--kỳ (<span name="term" id="term" style="font-weight: bold"></span>) là: <span--%>
                                <%--name="price" id="price" style="font-weight: bold"></span> VNĐ</h4>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                            </div>
                            <div class="row" style="margin: 20px auto; ">
                                <div style="text-align:center; border-bottom:2px solid #000000"><h3>Hình ảnh văn bản
                                    hợp đồng</h3></div>
                                <div class="form-group clearfix">
                                    <div class="col-sm-2 control-label">Hình ảnh</div>
                                    <br>
                                    <input type="hidden" name="imageUrl" id="imageUrl" value="${contract.imageUrl}">

                                    <div class="images clearfix" id="images">

                                    </div>
                                    <div class="clear-float"></div>
                                    <input type="file" id="file" name="file" accept="image/*"
                                           title="Mời chọn hình ảnh">
                                </div>
                            </div>
                            <div class="button-post">
                                <button type="submit" value="save" name="action" class="btn btn-primary">Tạo mới
                                </button>
                                <a href="/admin/appointment?action=edit&id=${appointmentList.id}"
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

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/contract.js"></script>
</body>
</html>
