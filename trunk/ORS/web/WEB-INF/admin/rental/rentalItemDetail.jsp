<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 10/06/2015
  Time: 11:47 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
          type="text/css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/office.less" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.ajaxfileupload.js"></script>
    <script src="${pageContext.request.contextPath}/lib/jquery.validate.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/localization/messages_vi.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>
<div class="content">
    <div class="page-header">
        <h1 class="title">Quản lí thiết bị</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        <h2 style="margin-top: 5px">Xem chi tiết thiết bị</h2>
                    </div>
                    <div>
                        <form action="rentalItem?action=editing" method="post" id="myform">
                            <div class="form-group" hidden>
                                <label for="id">Id</label>

                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>

                            <div class="form-group clearfix">
                                <label for="name" class="col-sm-2 control-label">Mã thiết bị</label>

                                <div class="col-sm-4">
                                    <input type="text" name="name" class="form-control" id="name"
                                           value="${info.name}" required>
                                </div>

                                <label for="name" class="col-sm-2 control-label">Thiết bị dành cho</label>

                                <div class="col-sm-4">
                                    <select name="officeType" class="col-sm-12">
                                        <option value="0">Cả hai loại văn phòng
                                        </option>
                                        <c:forEach var="item" items="${categoryList}">
                                            <option value="${item.id}"
                                                    <c:if test="${info.officeType==item.id}">selected</c:if>>${item.description}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="price" class="col-sm-2 control-label">Giá (VND)</label>

                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="price" name="price2"
                                           value="${info.price}" required min="1" onkeyup="formatPrice()">
                                    <input type="hidden" name="price1" id="priceValue" value="${info.price}"
                                           title="Mời nhập số lớn hơn không"/>
                                </div>

                                <label for="quantity" class="col-sm-2 control-label">Số lượng (cái)</label>

                                <div class="col-sm-4">
                                    <input type="number" name="quantity" class="form-control" id="quantity"
                                           value="${info.quantity}" required step="1" min="1"
                                           title="Mời nhập từ 1 trở lên">
                                </div>
                            </div>


                            <div class="form-group clearfix">
                                <label for="description" class="col-sm-2 control-label">Mô tả</label>

                                <div class="col-sm-10">
                                <textarea name="description" class="form-control" id="description"
                                          required rows="5" required>${info.description}</textarea>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Hình ảnh</label><br>
                                <input type="hidden" name="imageUrl" id="imageUrl" value="${info.imageUrl}">

                                <div class="images clearfix" id="images">
                                    <div class="upload-img">
                                        <div class="img"><img
                                                src="${info.imageUrl!=null?info.imageUrl:'/upload/placeholder.jpg'}">
                                        </div>
                                    </div>
                                </div>
                                <div class="clear-float"></div>
                                <input type="file" id="file" name="file" accept="image/*" title="Mời chọn hình ảnh">
                            </div>


                            <div class="button-post">
                                <button type="submit" name="action" class="btn btn-primary">Lưu</button>
                                <a href="${pageContext.request.contextPath}/admin/rentalItem"
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
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/admin/uploadRental.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var price = document.getElementById('price').value != '' ? document.getElementById('price').value : 0;
        document.getElementById('price').value = numberWithCommas(parseInt(price));
    });
    function formatPrice() {
        var price = document.getElementById('price').value != '' ? document.getElementById('price').value : 0;
        if (price != 0) {
            document.getElementById('priceValue').value = parseFloat(price.replace(/\./g, ''));
            document.getElementById('price').value = numberWithCommas(document.getElementById('priceValue').value);
        }
    };
    function numberWithCommas(x) {
        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    };
    $("#myform").validate({

    })

    $("#price").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                    // Allow: Ctrl+A
                (e.keyCode == 65 && e.ctrlKey === true) ||
                    // Allow: Ctrl+C
                (e.keyCode == 67 && e.ctrlKey === true) ||
                    // Allow: Ctrl+X
                (e.keyCode == 88 && e.ctrlKey === true) ||
                    // Allow: home, end, left, right
                (e.keyCode >= 35 && e.keyCode <= 39)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
</script>

</body>
</html>
