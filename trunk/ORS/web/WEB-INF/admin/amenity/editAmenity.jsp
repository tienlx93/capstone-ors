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
        <h1 class="title"></h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        <h1 class="title">Cập nhật tiện nghi</h1>
                    </div>
                    <div>
                        <form action="${pageContext.request.contextPath}/admin/amenity" method="post">


                            <div class="form-group clearfix">
                                <label for="name" class="col-sm-2">Tên tiện nghi</label>

                                <div class="col-sm-10">
                                    <span>${amenity.name}</span>
                                    <input type="hidden" name="name" class="" value="${amenity.name}" id="name" required>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="description" class="col-sm-2">Mô tả</label>
                                <div class="col-sm-10">
                                    <input type="text" name="description" class="" id="description"
                                           value="${amenity.description}" required>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="weight" class="col-sm-2">Trọng số</label>
                                <div class="col-sm-10">
                                    <input type="text" name="weight" class="" id="weight" value="${amenity.weight}" required>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="priority" class="col-sm-2">Độ ưu tiên</label>
                                <div class="col-sm-10">
                                    <input type="text" name="priority" class="" id="priority" value="${amenity.priority}" required>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <input type="hidden" name="id" class="" value="${amenity.id}">
                                <input type="hidden" name="group" class="" value="${amenity.amenityGroupId}">
                            </div>
                            <div class="button-post clearfix">
                                <button class="btn btn-primary" type="submit" value="update" name="action">Cập nhật
                                </button>
                                <a onclick="window.history.back()" class="btn btn-default">Hủy</a>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/upload.js" charset="UTF-8"></script>
</body>
</html>