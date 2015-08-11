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
                                <div class="col-sm-6" style="border-right: 2px solid #000000">
                                    <div><h3>Bên cho thuê văn phòng (Bên A)</h3></div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Ông(Bà):
                                        </div>

                                        <div class="col-sm-9">
                                            Công ty ORS
                                        </div>
                                    </div>
                                    <div class="form-group clearfix">
                                        <div style="text-align: right" for="officeID" class="col-sm-3 control-label">
                                            Email:
                                        </div>

                                        <div class="col-sm-9">
                                            contact@tienlx.me
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
                                <div class="col-sm-6">

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
                            <div style="margin: 40px auto 10px auto; border-top:2px solid #000000;padding: 15px"><h3>Thông tin thuê văn phòng</h3></div>
                            <div class="form-group clearfix">
                                <div for="officeID" class="col-sm-2 control-label">Tên văn phòng:</div>

                                <div class="col-sm-10" style="font-weight: bold">
                                    ${contract.officeByOfficeId.name}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <div for="officeID" class="col-sm-2 control-label">Loại văn phòng:</div>

                                <div class="col-sm-10" style="font-weight: bold">
                                    ${contract.officeByOfficeId.categoryByCategoryId.description}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <div for="officeID" class="col-sm-2 control-label">Địa chỉ văn phòng:</div>

                                <div class="col-sm-10">
                                    ${contract.officeByOfficeId.address}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <div for="officeArea" class="col-sm-2 control-label">Diện tích thuê(m2):</div>

                                <div name="officeArea" id="officeArea" class="col-sm-4">
                                    ${contract.officeByOfficeId.area}
                                </div>
                                <div for="paymentFee" class="col-sm-2 control-label">Giá thuê/m2:</div>

                                <div name="paymentFee" id="paymentFee" class="col-sm-4">
                                    ${contract.paymentFee} VNĐ
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <div for="startDate" class="col-sm-2 control-label">Ngày bắt đầu:</div>

                                <div name="startDate" id="startDate" class="col-sm-4">
                                    ${contract.startDate}

                                </div>
                                <div for="endDate" class="col-sm-2 control-label">Ngày kết thúc:</div>

                                <div name="endDate" id="endDate" class="col-sm-4">
                                    ${contract.endDate}
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <div class="col-sm-2 control-label">Kỳ hạn thanh toán:</div>

                                <div class="col-sm-4">
                                    ${contract.paymentTermByPaymentTerm.description}
                                    <input type="hidden" name="paymentTerm" id="paymentTerm"
                                           value="${contract.paymentTerm}">
                                </div>
                                <div for="paymentFee" class="col-sm-2 control-label">Số tiền đặt cọc:</div>

                                <div class="col-sm-4" id="deposit">
                                    ${contract.deposit} VNĐ
                                </div>
                            </div>

                            <div style="padding: 15px">
                                <h4>Số tiền bên B ông(bà): <span style="font-weight: bold">${contract.accountByCustomerUsername.profileByUsername.fullName}</span>,
                                phải thanh toán mỗi kỳ(<span style="font-weight: bold">${contract.paymentTermByPaymentTerm.description}</span>) cho bên A ông(bà): Công ty ORS, là: <span id="total" style="font-weight: bold"></span>
                                đồng.</h4>
                            </div>
                            <div class="row" style="margin: 40px auto 10px auto; border-top:2px solid #000000">
                                <div><h3>Thông tin thêm</h3></div>
                                <div class="form-group clearfix">
                                    <div class="col-sm-2 control-label">Hình ảnh</div>
                                    <br>
                                    <input type="hidden" name="imageUrl" id="imageUrl" value="${contract.imageUrl}">

                                    <div class="images clearfix" id="images">
                                        <div class="upload-img">
                                            <div class="img"><img
                                                    src="${contract.imageUrl!=null?contract.imageUrl:'/upload/placeholder.jpg'}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear-float"></div>
                                    <input type="file" id="file" name="file" accept="image/*"
                                           title="Mời chọn hình ảnh">
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

        var total = time * parseInt(fee) * parseFloat(area);

        document.getElementById('total').innerHTML = numberWithCommas(total);
        document.getElementById('paymentFee').innerHTML = numberWithCommas(fee);
        document.getElementById('deposit').innerHTML = numberWithCommas(document.getElementById('deposit').innerText);

    });

    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
</script>
</body>
</html>
