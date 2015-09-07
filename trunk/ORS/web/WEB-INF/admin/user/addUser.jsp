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

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-datepicker-1.4.0-dist/js/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootbox.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/datepicker/css/datepicker.css"
          type="text/css">
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title"></h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        <h1 class="title">Thêm tài khoản mới</h1>
                    </div>
                    <div>
                        <form action="${pageContext.request.contextPath}/admin/user" method="post">


                            <div class="form-group clearfix">
                                <label class="col-sm-3">Tên đăng nhập</label>

                                <div class="col-sm-3">
                                    <input type="text" name="username" class="" id="username" required
                                           title="Tên đăng nhập (5-30 kí tự)"
                                           pattern=".{5,30}">
                                </div>
                                <div>
                                    <label class="col-sm-3">Tên đầy đủ</label>

                                    <div class="col-sm-3">
                                        <input type="text" name="fullname" class="" id="fullname" required>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label for="password" class="col-sm-3">Mật khẩu</label>

                                <div class="col-sm-3">
                                    <input type="password" name="password" class="" id="password" required
                                           title="Mật khẩu (8-32 kí tự)"
                                           pattern=".{8,32}">
                                </div>
                                <label for="" class="col-sm-3">Địa chỉ</label>

                                <div class="col-sm-3">
                                    <input type="text" name="address" class="" id="address" required>
                                </div>
                            </div>
                            <br/>

                            <div class="form-group clearfix">
                                <label for="email" class="col-sm-3">Email</label>

                                <div class="col-sm-3">
                                    <input type="email" name="email" class="" id="email" required>
                                </div>
                                <label for="" class="col-sm-3">Công ty</label>

                                <div class="col-sm-3">
                                    <input type="text" name="company" class="" id="company" required>
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
                                <label for="" class="col-sm-3">Số điện thoại</label>

                                <div class="col-sm-3">
                                    <input type="number" name="phone" class="" id="phone" required>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="role" class="col-sm-3">Chức vụ</label>

                                <div class="col-sm-3">
                                    <select name="role" class="" id="role">
                                        <div class="col-sm-3">
                                            <c:forEach var="item" items="${roleList}">
                                            <option value="${item.id}">${item.roleName}</option>
                                        </div>
                                        </c:forEach>
                                    </select>
                                </div>
                                <label class="col-sm-3">Ngày sinh</label>

                                <div class='col-sm-3'>
                                    <input type='text' class="" id='date' name="date" placeholder="dd-mm-yyyy"/>
                                </div>
                            </div>


                            <div class="button-post">
                                <button type="submit" value="save" class="btn btn-primary" name="action">Tạo mới
                                </button>
                                <a href="${pageContext.request.contextPath}/admin/user" class="btn btn-default">Hủy</a>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <input type="text" bootstrap-datepicker data-date-end-date="0d"/>
    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>

</div>

</body>
<script type="text/javascript">

    $('#date').datepicker({
        format: 'dd-mm-yyyy',
    }).data('datepicker');

</script>
</html>