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
        <h1 class="page-header">Quản lí văn phòng</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Thêm mới văn phòng
                    </div>
                    <div>
                        <form action="office" method="post" id="form" onsubmit="return validateform()">
                            <div><h3>Thông tin cơ bản</h3></div>
                            <div class="form-group clearfix">
                                <label for="name" class="col-sm-2">Tên văn phòng *</label>

                                <div class="col-sm-10">
                                    <input type="text" name="name" class="form-control" id="name"
                                           value="${office.name}" required
                                           title="Tên văn phòng (5-150 kí tự)"
                                           pattern=".{5,150}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="address" class="col-sm-2">Địa chỉ *</label>

                                <div class="col-sm-10">
                                    <input type="text" name="address" class="form-control" id="address"
                                           onFocus="geolocate()"
                                           value="${office.address}" required>
                                </div>
                                <div class="col-sm-10">
                                    <table id="autocomplete">
                                        <tr class="hidden">
                                            <td class="label">Địa chỉ</td>
                                            <td class="slimField">
                                                <input class="field" id="street_number" disabled="true"></td>
                                            <td class="wideField" colspan="2">
                                                <input class="field" id="route" disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td class="label">Quận / Huyện</td>
                                            <td class="wideField" colspan="3">
                                                <input class="field" name="district"
                                                       id="administrative_area_level_2"
                                                       disabled="true"></td>
                                        </tr>
                                        <tr>
                                            <td class="label">Thành phố / Tỉnh</td>
                                            <td class="wideField" colspan="3">
                                                <input class="field" name="city"
                                                       id="administrative_area_level_1"
                                                       disabled="true"></td>
                                            <input type="hidden" name="latitude" id="latitude">
                                            <input type="hidden" name="longitude" id="longitude">

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
                                <label class="col-sm-5">Danh sách hình ảnh</label><br>

                                <div class="images clearfix" id="images">
                                </div>
                                <div class="clear-float"></div>
                                <input type="file" id="file" name="file" accept="image/*" title="Mời chọn hình ảnh">
                            </div>

                            <div class="form-group clearfix">
                                <label class="col-sm-5">Danh sách tiện nghi</label><br>

                                <div class="clear-float" id="amenity-list">

                                </div>
                                <div class="col-sm-5">
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
                                <label for="floor" class="col-sm-2">Số tầng *</label>

                                <div class="col-sm-10">
                                    <input type="number" name="floor" class="form-control" id="floor"
                                           value="${office.floorNumber}" min="0"
                                           onkeyup="this.value=this.value.replace(/[^\d]/,'')">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="area" class="col-sm-2">Diện tích (m<sup>2</sup>) *</label>

                                <div class="col-sm-10">
                                    <input type="text" name="area" class="form-control" id="area"
                                           value="${office.area}" required min="0">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="minArea" class="col-sm-2">Diện tích thuê tối thiểu *</label>

                                <div class="col-sm-10">
                                    <input type="number" name="minArea" class="form-control" id="minArea"
                                           value="${office.minArea}" required min="0" step="any">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="minTime" class="col-sm-2">Thời gian thuê tối thiểu *</label>

                                <div class="col-sm-10">
                                    <input type="number" name="minTime" class="form-control" id="minTime"
                                           value="${office.minTime}" required min="0" step="1">
                                </div>
                            </div>

                            <div><h3>Điều khoản giá</h3></div>
                            <div class="form-group clearfix">
                                <label for="price" class="col-sm-2">Giá (VND) *</label>

                                <div class="col-sm-10">
                                    <input type="number" name="price" class="form-control" id="price"
                                           value="${office.price}" step="1" title="Xin nhập giá hợp lệ">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="price" class="col-sm-3">Lợi nhuận theo hoa hồng (5%) *</label>

                                <div class="col-sm-9">
                                    <div class="onoffswitch" >
                                        <input type="checkbox" name="isPercent" class="onoffswitch-checkbox" id="isPercent" checked>
                                        <label class="onoffswitch-label" for="isPercent"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group clearfix collapse" >
                                <label for="basePrice" class="col-sm-3" style="text-align: right;">Giá thuê gốc *</label>

                                <div class="col-sm-9">
                                    <input type="text" name="basePrice" class="form-control" id="basePrice"
                                           value="${office.basePrice}">
                                </div>
                            </div>

                            <div class="form-group clearfix">
                                <label for="priceTerm" class="col-sm-2">Đơn vị giá *</label>

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

                            <div><h3>Thông tin chủ văn phòng</h3></div>
                            <div class="form-group clearfix">
                                <label for="ownerName" class="col-sm-2">Tên người đại diện *</label>
                                <div class="col-sm-10">
                                    <input type="text" name="ownerName" class="form-control" id="ownerName"
                                           value="${office.ownerName}" required
                                           title="Tên người đại diện (5-150 kí tự)"
                                           pattern=".{5,150}">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="ownerPhone" class="col-sm-2">Số điện thoại người đại diện *</label>
                                <div class="col-sm-10">
                                    <input type="text" name="ownerPhone" class="form-control" id="ownerPhone"
                                           value="${office.ownerPhone}" required
                                           title="Số điện thoại người đại diện (9-11 số)"
                                           pattern="[0-9]{9,11}">
                                </div>
                            </div>
                            <div class="form-group clearfix">
                                <label for="ownerAddress" class="col-sm-2">Địa chỉ người đại diện *</label>
                                <div class="col-sm-10">
                                    <input type="text" name="ownerAddress" class="form-control" id="ownerAddress"
                                           value="${office.ownerAddress}" required
                                           title="Địa chỉ người đại diện (5-150 kí tự)"
                                           pattern=".{5,150}">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/street.js"></script>
<script>
    function validateform() {
        var lat = $("#latitude").val();
        if (!lat || isNaN(lat)) {
            bootbox.alert({
                size: 'small',
                message: "Mời nhập địa chỉ và chọn từ danh sách đề xuất"
            });
            return false;
        } else {
            return true;
        }
    }
</script>

</body>
</html>
