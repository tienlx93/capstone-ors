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
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places"></script>
    <script src="${pageContext.request.contextPath}/lib/bootbox.min.js"></script>
    <title>Office Rental Service</title>
</head>
<body onload="initialize()">
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
                        <h2 style="margin-top: 5px; text-align: center">Sửa thông tin văn phòng</h2>
                    </div>
                    <div>
                        <form action="office" method="post" id="form" onsubmit="return validateform()">
                            <input type="hidden" name="id" class="form-control" id="id"
                                   value="${office.id}">

                            <div><h3>Thông tin cơ bản</h3></div>
                            <div class="form-group clearfix">
                                <label for="name" class="col-sm-2">Tên văn phòng *</label>

                                <div class="col-sm-8">
                                    <input type="text" maxlength="100" name="name" class="form-control" id="name"
                                           value="${office.name}" required
                                           title="Tên văn phòng (5-150 kí tự)"
                                           pattern=".{5,150}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="address" class="col-sm-2">Địa chỉ *</label>

                                <div class="col-sm-8">
                                    <input type="text" name="address" class="form-control" id="address"
                                           onFocus="geolocate()"
                                           value="${office.address}" required>
                                </div>
                                <div class="col-sm-8">
                                    <table id="autocomplete">
                                        <tr class="hidden">
                                            <td class="label">Địa chỉ</td>
                                            <td class="slimField">
                                                <input class="field" id="street_number" readonly></td>
                                            <td class="wideField" colspan="2">
                                                <input class="field" id="route" readonly></td>
                                        </tr>
                                        <tr>
                                            <td class="label">Quận / Huyện</td>
                                            <td class="wideField" colspan="3">
                                                <input class="field" name="district"
                                                       id="administrative_area_level_2"
                                                       readonly value="${office.district}"></td>
                                        </tr>
                                        <tr>
                                            <td class="label" style="padding-right: 15px;padding-top: 10px;">
                                                Thành phố / Tỉnh
                                            </td>
                                            <td class="wideField" colspan="3" style="padding-top: 10px">
                                                <input class="field" name="city"
                                                       id="administrative_area_level_1"
                                                       readonly value="${office.city}"></td>
                                            <input type="hidden" name="latitude" id="latitude"
                                                   value="${office.latitude}">
                                            <input type="hidden" name="longitude" id="longitude"
                                                   value="${office.longitude}">

                                        </tr>
                                    </table>
                                    <div id="map-canvas"></div>
                                </div>
                            </div>
                            <div><h3>Mô tả văn phòng</h3></div>
                            <div class="form-group clearfix">
                                <label for="description" class="col-sm-2">Mô tả văn phòng *</label>

                                <div class="col-sm-10">
                                    <textarea name="description" class="form-control" id="description" rows="5"
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
                                    <c:forEach var="item" items="${amenityList}">
                                        <script>
                                            amenityList.push(item);
                                        </script>
                                        <div>${item}<span class="color10 fa fa-remove"
                                                          onclick="deleteAmenity('${item}')"></span></div>
                                    </c:forEach>
                                </div>
                                <div style="width: 0">
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
                                <label for="category" class="col-sm-2">Loại văn phòng *</label>

                                <div class="col-sm-8">
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
                                <label for="floor" class="col-sm-2">Số tầng *</label>

                                <div class="col-sm-8">
                                    <input type="number" name="floor" class="form-control" id="floor"
                                           value="${office.floorNumber}" min="1" step="1"
                                           onkeyup="this.value=this.value.replace(/[^\d]/,'')">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="area" class="col-sm-2">Diện tích (m<sup>2</sup>) *</label>

                                <div class="col-sm-8">
                                    <input type="number" name="area" class="form-control" id="area"
                                           value="${office.area}" required min="0">
                                </div>
                            </div>
                            <c:if test="${office.categoryId == 1}">
                                <div class="form-group clearfix" id="divMinArea" hidden>
                                    <label for="minArea" class="col-sm-2 control-label">Diện tích thuê tối thiểu (m<sup>2</sup>)</label>

                                    <div class="col-sm-8">
                                        <input type="text" name="minArea" class="form-control" id="minArea"
                                               value="${office.minArea}">
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${office.categoryId == 2}">
                                <div class="form-group clearfix" id="divMinArea">
                                    <label for="minArea" class="col-sm-2 control-label">Diện tích thuê tối thiểu (m<sup>2</sup>)</label>

                                    <div class="col-sm-8">
                                        <input type="text" name="minArea" class="form-control" id="minArea"
                                               value="${office.minArea}">
                                    </div>
                                </div>
                            </c:if>
                            <div class="form-group clearfix">
                                <label for="minTime" class="col-sm-2 control-label">Thời gian thuê tối thiểu
                                    (tháng)</label>

                                <div class="col-sm-8">
                                    <input type="number" name="minTime" class="form-control" id="minTime" step="1"
                                           value="${office.minTime}" required min="1">
                                </div>
                            </div>

                            <div><h3>Điều khoản giá</h3></div>
                            <div class="form-group clearfix">
                                <label for="price" style="float:left;margin-right:5px;">Lợi nhuận theo hoa hồng</label>

                                <div class="col-sm-2">
                                    <div class="onoffswitch" >
                                        <input type="checkbox" name="isPercent" class="onoffswitch-checkbox"
                                               id="isPercent" <c:if test="${office.commission > 0}">checked</c:if>>
                                        <label class="onoffswitch-label" for="isPercent">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                                <div>
                                    <label for="commission" class="col-sm-2">Tỉ lệ hoa hồng (%)</label>

                                    <div class="col-sm-2" style="margin-top: -5px;">
                                        <input type="number" name="commission" class="form-control" id="commission"
                                               value="${office.commission}" step="1">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group clearfix" >
                                <label for="basePrice" class="col-sm-2" >Giá thuê gốc (VND) *</label>

                                <div class="col-sm-8">
                                    <input type="text" min="0" name="basePrice" class="form-control" id="basePrice"
                                           value="${office.basePrice}" onchange="onChangeBasePrice()">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="price" class="col-sm-2">Giá thuê (VND)</label>

                                <div class="col-sm-8">
                                    <input type="number" name="price" class="form-control" id="price"
                                           value="${office.price}" step="1" title="Xin nhập giá hợp lệ">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="priceTerm" class="col-sm-2">Đơn vị giá *</label>

                                <div class="col-sm-8">
                                    <select name="priceTerm" class="form-control" id="priceTerm" required>
                                        <c:forEach var="item" items="${priceTermList}">
                                            <option value="${item.id}"
                                                    <c:if test="${office.priceTerm==item.id}">selected</c:if> >
                                                    ${item.description}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="button-post">
                                <input type="hidden" id="imageUrls" name="imageUrls" value="${office.imageUrls}">
                                <input type="hidden" id="amenityList" name="amenityList">
                                <button type="submit" value="update" class="btn btn-primary" name="action">Cập nhật
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
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/admin/upload.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/admin/street.js"></script>

</body>
</html>
