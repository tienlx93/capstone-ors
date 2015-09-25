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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" type="text/css">

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
                        <h1 class="title">Cập nhật tiện nghi</h1>
                    </div>
                    <div>
                        <form action="${pageContext.request.contextPath}/admin/amenity" method="post">

                            <div class="form-group clearfix">
                                <label for="name" class="col-sm-2">Tên tiện nghi *</label>

                                <div class="col-sm-10">
                                    <input name="name" class="" value="${amenity.name}" id="name"
                                           required>
                                </div>
                            </div>

                            <%--<div class="form-group clearfix">
                                <label for="description" class="col-sm-2">Mô tả</label>
                                <div class="col-sm-10">
                                    <input type="text" name="description" class="" id="description"
                                           value="${amenity.description}" >
                                </div>
                            </div>--%>

                            <div class="form-group clearfix">
                                <label for="weight" class="col-sm-2">Trọng số *</label>

                                <div class="col-sm-10">
                                    <input type="number" min="1" name="weight" class="" id="weight"
                                           value="${amenity.weight}" required>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="priority" class="col-sm-2">Độ ưu tiên *</label>

                                <div class="col-sm-10">
                                    <select name="priority" id="priority" required>
                                        <option></option>
                                        <c:choose>
                                            <c:when test="${amenity.priority == 1}">
                                                <option value="1" selected>Cao</option>
                                                <option value="0">Thấp</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="1">Cao</option>
                                                <option value="0" selected>Thấp</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <%--<c:choose>
                                            <c:when test="${amenity.priority == 0}">
                                                <option value="0" selected>Thấp</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="0">Thấp</option>
                                            </c:otherwise>
                                        </c:choose>--%>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="group" class="col-sm-2">Nhóm thiết bị *</label>

                                <div class="col-sm-10">
                                    <select name="group" class="" id="group" required>
                                        <option></option>
                                        <c:forEach var="item" items="${groupList}">
                                            <option value="${item.id}"
                                                    <c:if test="${item.id == amenity.amenityGroupId}">selected</c:if>
                                                    >${item.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="weight" class="col-sm-2">Có thể sửa chữa</label>

                                <%--<div class="col-sm-10">
                                    <input type="checkbox" value="True" name="repairable" class="checkbox"
                                    <c:if test="${amenity.repairable == true}"> checked </c:if>>
                                </div>--%>

                                <div class="col-sm-2">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="repairable" value="True" class="onoffswitch-checkbox" id="isPercent"
                                        <c:if test="${amenity.repairable == true}"> checked </c:if>>
                                        <label class="onoffswitch-label" for="isPercent">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <%--<div class="form-group clearfix">
                                <label for="priority" class="col-sm-2">Độ ưu tiên</label>

                                <div class="col-sm-10">
                                    <input type="text" min="0" name="priority" class="" id="priority"
                                           value="${amenity.priority}" required>
                                </div>
                            </div>--%>

                            <input type="hidden" name="id" class="" value="${amenity.id}">
                            <input type="hidden" name="group" class="" value="${amenity.amenityGroupId}">

                            <div class="button-post clearfix">
                                <button class="btn btn-primary" type="submit" value="update" name="action">Cập nhật
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
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/admin/upload.js"
        charset="UTF-8"></script>--%>
</body>
</html>