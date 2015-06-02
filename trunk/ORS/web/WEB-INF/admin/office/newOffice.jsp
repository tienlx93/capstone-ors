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
    <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/header.less" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
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
                            <div class="form-group">
                                <label for="name">Tên văn phòng</label>
                                <input type="text" name="name" class="" id="name" value="${office.name}">
                            </div>
                            <div class="form-group">
                                <label for="category">Loại văn phòng</label>
                                <select name="category" class="" id="category">
                                    <c:forEach var="item" items="${categoryList}">
                                        <option value="${item.id}"
                                                <c:if test="${office.categoryId==item.id}">selected</c:if> >
                                                ${item.description}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="address">Địa chỉ</label>
                                <input type="text" name="address" class="" id="address" value="${office.address}">
                            </div>
                            <div class="form-group">
                                <label for="description">Mô tả văn phòng</label>
                                <textarea name="description" class="" id="description">${office.description}</textarea>
                            </div>

                            <div class="form-group">
                                <label>Danh sách hình ảnh</label><br>

                                <div class="images clearfix" id="images">

                                </div>
                                <div class="clear-float"></div>
                                <input type="file" id="file" name="file" accept="image/*" title="Mời chọn hình ảnh">

                            </div>

                            <div class="form-group">
                                <label for="price">Giá</label>
                                <input type="text" name="price" class="" id="price" value="${office.price}">
                            </div>
                            <div class="form-group">
                                <label for="priceTerm">Đơn vị giá</label>
                                <select name="priceTerm" class="" id="priceTerm">
                                    <c:forEach var="item" items="${priceTermList}">
                                        <option value="${item.id}"
                                                <c:if test="${office.priceTerm==item.id}">selected</c:if> >
                                                ${item.description}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="floor">Số tầng</label>
                                <input type="text" name="floor" class="" id="floor" value="${office.floorNumber}">
                            </div>
                            <div class="form-group">
                                <label for="area">Diện tích (m<sup>2</sup>)</label>
                                <input type="text" name="area" class="" id="area" value="${office.area}">
                            </div>

                            <div class="button-post">
                                <input type="hidden" id="imageUrls" name="imageUrls">
                                <button type="submit" value="save" name="action">Tạo mới</button>

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
