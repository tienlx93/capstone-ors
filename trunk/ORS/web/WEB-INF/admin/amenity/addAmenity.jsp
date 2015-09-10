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
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title">Quản lí tiện nghi</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        <h1 class="title">Thêm mới tiện nghi</h1>
                    </div>
                    <div>
                        <form action="${pageContext.request.contextPath}/admin/amenity" method="post">

                            <div class="form-group clearfix">
                                <label for="name" class="col-sm-2">Tên tiện nghi</label>

                                <div class="col-sm-10">
                                    <input type="text" name="name" class="" id="name" required>
                                </div>
                            </div>


                            <%--<div class="form-group clearfix">
                                <label for="description" class="col-sm-2">Mô tả</label>

                                <div class="col-sm-10">
                                    <input type="text" name="description" class="" id="description">
                                </div>
                            </div>--%>


                            <div class="form-group clearfix">
                                <label for="weight" class="col-sm-2">Trọng số</label>

                                <div class="col-sm-10">
                                    <input type="number" min="1" name="weight" class="" id="weight" required>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="priority" class="col-sm-2">Độ ưu tiên</label>

                                <div class="col-sm-10">
                                    <select name="priority" id="priority" required>
                                        <option></option>
                                        <option value="1">Cao</option>
                                        <option value="0">Thấp</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="group" class="col-sm-2">Nhóm thiết bị</label>

                                <div class="col-sm-10">
                                    <select name="group" class="" id="group" required>
                                        <option></option>
                                        <c:forEach var="item" items="${groupList}">
                                            <option value="${item.id}">${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="weight" class="col-sm-2">Có thể sửa chữa</label>

                                <div class="col-sm-10">
                                    <input type="checkbox" value="True" name="repairable" class="checkbox">
                                </div>
                            </div>

                            <div class="button-post">
                                <button type="submit" value="save" class="btn btn-success" name="action"><i
                                        class="fa fa-arrow-right"></i>Tạo mới
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

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/admin/upload.js"
        charset="UTF-8"></script>
</body>
</html>