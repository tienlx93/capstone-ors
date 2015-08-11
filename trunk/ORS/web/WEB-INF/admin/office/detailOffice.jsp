<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 21/07/2015
  Time: 9:55 CH
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
        <h1 class="page-header">Chi tiết văn phòng</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div>
                        <form action="office?action=editing" method="post">
                            <%--<div class="form-group clearfix" hidden>
                              <label for="id" class="col-sm-2 control-label">Id</label>
                              ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>--%>

                            <div class="form-group clearfix">
                                <div class="col-sm-10">
                                    <b>Tên văn phòng: </b>${info.name}
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <div class="col-sm-10">
                                    <b>Loại văn phòng: </b>${info.categoryByCategoryId.description}
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <div class="col-sm-10" id="address">
                                    <b>Địa chỉ: </b>${info.address}
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <div class="col-sm-10">
                                    <b>Số tầng: </b>${info.floorNumber}
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <b>Diện tích: </b>${info.area} m<SUP>2</SUP>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <div class="col-sm-10">
                                    <b>Giá: </b><c:choose>
                                    <c:when test="${info.price == null}">
                                        ${info.priceTermByPriceTerm.description}
                                    </c:when>
                                    <c:otherwise>
                                        ${info.price} VNĐ (${info.priceTermByPriceTerm.description})
                                    </c:otherwise>
                                </c:choose>
                                </div>
                            </div>


                            <div class="form-group clearfix">
                                <label class="col-sm-2 control-label">Hình ảnh</label><br>

                                <div class="images clearfix" id="images">
                                </div>
                                <div class="clear-float"></div>
                                <input type="hidden" id="imageUrls" name="imageUrls" value="${info.imageUrls}">
                            </div>

                            <div class="form-group clearfix">
                                <div class="col-sm-10" id="amenity">
                                    <b>Tiện nghi: </b><c:choose>
                                    <c:when test="${amenity == '[]'}">
                                        Không có tiện nghi
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="item" items="${amenity}">
                                            <span>${item}, </span>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="description" class="col-sm-2 control-label">Mô tả</label>

                                <div class="col-sm-10" id="description">
                                    <%--<input type="hidden" name="description" class="form-control" >--%>
                                    ${info.description}
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <div class="col-sm-10" id="fix">
                                    <b>Số lần sửa chữa: </b>${count}
                                </div>
                            </div>

                            <div class="button-post">
                                <a class="btn btn-primary" href="repair?action=filter&officeId=${info.id}">Danh sách sửa
                                    chữa</a>
                                <a class="btn btn-primary" href="office?action=edit&id=${info.id}">Chỉnh sửa</a>
                                <a href="${pageContext.request.contextPath}/admin/office"
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

<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/loadImg.js" charset="UTF-8"></script>

</body>
</html>
