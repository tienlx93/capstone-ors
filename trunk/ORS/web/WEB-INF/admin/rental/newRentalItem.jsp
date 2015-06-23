<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 10/06/2015
  Time: 11:21 CH
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
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/typeahead.bundle.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title">Quản lý thiết bị</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Thêm mới thiết bị
                    </div>
                    <div>
                        <form action="rentalItem" method="post">
                            <div class="form-group clearfix">
                                <label for="name" class="col-sm-2 control-label">Tên thiết bị</label>

                                <div class="col-sm-10">
                                    <input type="text" name="name" class="form-control" id="name"
                                           value="${rentalItem.name}" required>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="description" class="col-sm-2 control-label">Mô tả</label>

                                <div class="col-sm-10">
                                <textarea name="description" class="form-control" id="description"
                                          required>${rentalItem.description}</textarea>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="price" class="col-sm-2 control-label">Giá (VND)</label>

                                <div class="col-sm-10">
                                    <input type="text" name="price" class="form-control" id="price"
                                           value="${rentalItem.price}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="quantity" class="col-sm-2 control-label">Số lượng (cái)</label>

                                <div class="col-sm-10">
                                    <input type="text" name="quantity" class="form-control" id="quantity"
                                           value="${rentalItem.price}">
                                </div>
                            </div>

                            <div class="button-post clearfix">
                                <button type="submit" value="save" class="btn btn-primary" name="action">Tạo mới
                                </button>
                                <a href="/admin/rentalItem" class="btn btn-default">Hủy</a>
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
</html>
