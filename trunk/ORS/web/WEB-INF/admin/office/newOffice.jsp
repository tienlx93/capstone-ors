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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/office.less" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/typeahead.bundle.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title">Quản lí văn phòng</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Thêm mới văn phòng
                    </div>
                    <div>
                        <form action="office" method="post">
                            <div class="form-group clearfix">
                                <label for="name" class="col-sm-2 control-label">Tên văn phòng</label>

                                <div class="col-sm-10">
                                    <input type="text" name="name" class="form-control" id="name"
                                           value="${office.name}" required>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="address" class="col-sm-2 control-label">Địa chỉ</label>

                                <div class="col-sm-10">
                                    <input type="text" name="address" class="form-control" id="address"
                                           value="${office.address}" required>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="description" class="col-sm-2 control-label">Mô tả văn phòng</label>

                                <div class="col-sm-10">
                                    <textarea name="description" class="form-control" id="description"
                                              required>${office.description}</textarea>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Danh sách hình ảnh</label><br>

                                <div class="images clearfix" id="images">
                                </div>
                                <div class="clear-float"></div>
                                <input type="file" id="file" name="file" accept="image/*" title="Mời chọn hình ảnh">
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Danh sách tiện nghi</label><br>

                                <div class="clear-float" id="amenity-list">

                                </div>
                                <div class="col-lg-4">
                                    <div class="input-group">
                                        <input type="text" class="form-control typeahead" autocomplete="off"
                                               id="amenity" style="width: 355px;">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" onclick="addAmenity()" type="button">+</button>
                                    </span>
                                    </div>
                                    <!-- /input-group -->
                                </div>
                                <!-- /.col-lg-4 -->
                            </div>

                            <div class="form-group clearfix">
                                <label for="category" class="col-sm-2 control-label">Loại văn phòng</label>

                                <div class="col-sm-10">
                                    <select name="category" class="form-control" id="category">
                                        <c:forEach var="item" items="${categoryList}">
                                            <option value="${item.id}"
                                                    <c:if test="${office.categoryId==item.id}">selected</c:if> >
                                                    ${item.description}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="price" class="col-sm-2 control-label">Giá (VND)</label>

                                <div class="col-sm-10">
                                    <input type="text" name="price" class="form-control" id="price"
                                           value="${office.price}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="priceTerm" class="col-sm-2 control-label">Đơn vị giá</label>

                                <div class="col-sm-10">
                                    <select name="priceTerm" class="form-control" id="priceTerm" required>
                                        <c:forEach var="item" items="${priceTermList}">
                                            <option value="${item.id}"
                                                    <c:if test="${office.priceTerm==item.id}">selected</c:if> >
                                                    ${item.description}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="floor" class="col-sm-2 control-label">Số tầng</label>

                                <div class="col-sm-10">
                                    <input type="number" name="floor" class="form-control" id="floor"
                                           value="${office.floorNumber}"
                                           onkeyup="this.value=this.value.replace(/[^\d]/,'')">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="area" class="col-sm-2 control-label">Diện tích (m<sup>2</sup>)</label>

                                <div class="col-sm-10">
                                    <input type="text" name="area" class="form-control" id="area"
                                           value="${office.area}" required>
                                </div>
                            </div>

                            <div class="button-post">
                                <input type="hidden" id="imageUrls" name="imageUrls">
                                <input type="hidden" id="amenityList" name="amenityList">
                                <button type="submit" value="save" class="btn btn-primary" name="action">Tạo mới
                                </button>
                                <a href="/admin/office" class="btn btn-default">Hủy</a>
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
