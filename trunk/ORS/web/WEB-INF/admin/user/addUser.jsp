<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 02/06/2015
  Time: 9:49 CH
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
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/lib/bootstrap-datepicker-1.4.0-dist/css/bootstrap-datepicker3.css"
          type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootbox.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-datepicker-1.4.0-dist/js/bootstrap-datepicker.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title">Quản lí tài khoản</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        <h1 class="title">Thêm mới tài khoản</h1>
                    </div>
                    <div>
                        <form action="${pageContext.request.contextPath}/admin/user" method="post">


                            <div class="form-group clearfix">
                                <label class="col-sm-3">Tên đăng nhập (*)</label>

                                <div class="col-sm-3">
                                    <input type="text" name="username" class="" id="username" required
                                           title="Tên đăng nhập (5-30 kí tự)"
                                           pattern=".{5,30}">
                                </div>

                                <label class="col-sm-3">Họ và tên (*)</label>

                                <div class="col-sm-3">
                                    <input type="text" name="fullname" class="" id="fullname" required
                                           pattern=".{0,30}" title="Nhập tối đa 50 kí tự">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="password" class="col-sm-3">Mật khẩu (*)</label>

                                <div class="col-sm-3">
                                    <input type="password" name="password" class="" id="password" required
                                           title="Mật khẩu (8-30 kí tự)"
                                           pattern=".{8,30}">
                                </div>

                                <label class="col-sm-3">Địa chỉ</label>

                                <div class="col-sm-3">
                                    <input type="text" name="address" class="" id="address">
                                </div>
                            </div>


                            <div class="form-group clearfix">
                                <label for="email" class="col-sm-3">Email (*)</label>

                                <div class="col-sm-3">
                                    <input type="email" name="email" class="" id="email" required>
                                </div>
                                <label class="col-sm-3">Công ty</label>

                                <div class="col-sm-3">
                                    <input type="text" name="company" class="" id="company">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-3">Danh xưng</label>

                                <div class="col-sm-3">
                                    <select name="title" id="title" required>
                                        <option value=""></option>
                                        <option value="Ông">Ông</option>
                                        <option value="Bà">Bà</option>
                                    </select>
                                </div>
                                <label class="col-sm-3">Số điện thoại (*)</label>

                                <div class="col-sm-3">
                                    <input type="text" name="phone" class="" id="phone" required pattern=".{10,11}"
                                           title="Vui lòng nhập từ 10 đến 11 ký tự">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="role" class="col-sm-3">Chức vụ</label>

                                <div class="col-sm-3">
                                    <select name="role" class="" id="role" required>
                                        <div class="col-sm-3">
                                            <option value=""></option>
                                            <c:forEach var="item" items="${roleList}">
                                            <option value="${item.id}">${item.roleName}</option>
                                        </div>
                                        </c:forEach>
                                    </select>
                                </div>
                                <label class="col-sm-3">Ngày sinh</label>

                                <div class='col-sm-3'>
                                    <input type='text' class="" id='date' name="date" placeholder="dd-mm-yyyy"
                                           required/>
                                </div>
                            </div>


                            <div class="button-post">
                                <button type="submit" value="save" class="btn btn-primary" name="action">Tạo mới
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

</body>
<script type="text/javascript">
    $(document).ready(function () {
        var now = new Date();
        $('#date').datepicker({
            format: 'dd-mm-yyyy',
            endDate: now
        }).data('datepicker');
    });
    $("#phone").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
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
</html>