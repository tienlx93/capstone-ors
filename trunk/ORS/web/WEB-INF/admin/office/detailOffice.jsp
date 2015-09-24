<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" type="text/css">

  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>

  <script type="text/javascript"
          src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
  <script type="text/javascript"
          src="${pageContext.request.contextPath}/lib/datepicker/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/lib/bootbox.min.js"></script>
  <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
  <div class="page-header">
    <h1 class="title">Chi tiết văn phòng</h1>
  </div>

  <div class="container-padding">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div>
            <form action="office" method="post" class="form">

              <div class="form-group clearfix">
                <label class="col-sm-3">Tên văn phòng:</label>
                <span class="col-sm-7">${info.name}</span>
              </div>

              <div class="form-group clearfix">
                <label class="col-sm-3">Loại văn phòng:</label>
                <span class="col-sm-7">${info.categoryByCategoryId.description}</span>
              </div>

              <div class="form-group clearfix">
                <label class="col-sm-3">Địa chỉ:</label>
                <span class="col-sm-7">${info.address}</span>
              </div>

              <div class="form-group clearfix">
                <label class="col-sm-3">Số tầng:</label>
                <span class="col-sm-3">${info.floorNumber}</span>
                <label class="col-sm-3">Diện tích:</label>
                <span class="col-sm-3">${info.area} m<SUP>2</SUP></span>
              </div>
              <div class="form-group clearfix">
                <label class="col-sm-3">Thời gian thuê tối thiểu:</label>
                <span class="col-sm-3">${info.minTime} tháng</span>
                <c:if test="${info.categoryId == 1}">
                  <div class="col-sm-3" hidden>Diện tích thuê tối thiểu:</div>
                  <span class="col-sm-3" hidden>${info.minArea} m<SUP>2</SUP></span>
                </c:if>
                <c:if test="${info.categoryId == 2}">
                  <label class="col-sm-3">Diện tích thuê tối thiểu:</label>
                  <span class="col-sm-3">${info.minArea} m<SUP>2</SUP></span>
                </c:if>
              </div>

              <div class="form-group clearfix">
                <label class="col-sm-3">Giá thuê:</label>
                <span class="col-sm-3">
                  <c:choose>
                    <c:when test="${info.price == null}">
                      ${info.priceTermByPriceTerm.description}
                    </c:when>
                    <c:otherwise>
                      <fmt:formatNumber type="number" value="${info.price}"/>
                      VNĐ (${info.priceTermByPriceTerm.description})
                    </c:otherwise>
                  </c:choose>
                </span>
                <c:choose>
                  <c:when test="${info.price == info.basePrice}">
                <span class="col-sm-3">
                  Doanh thu theo hoa hồng ${info.commission}%
                </span>
                  </c:when>
                  <c:otherwise>
                    <label class="col-sm-3">Giá gốc:</label>
                    <span class="col-sm-3"><fmt:formatNumber type="number" value="${info.basePrice}"/> VND
                      <c:choose>
                        <c:when test="${info.categoryId == 1}">
                          (Nguyên căn)
                        </c:when>
                        <c:otherwise>
                          (Trên m<sup>2</sup>)
                        </c:otherwise>
                      </c:choose></span>
                  </c:otherwise>
                </c:choose>
              </div>
              <c:if test="${user.roleId != 5}">
                <h3>Thông tin chủ văn phòng</h3>

                <div class="form-group clearfix">
                  <label class="col-sm-3">Tên chủ sở hữu:</label>
                  <span class="col-sm-7">${info.accountByOwnerUsername.profileByUsername.fullName}</span>
                </div>
                <div class="form-group clearfix">
                  <label class="col-sm-3">Số điện thoại:</label>
                  <span class="col-sm-3">${info.accountByOwnerUsername.profileByUsername.phone}</span>
                  <label class="col-sm-3">Địa chỉ:</label>
                  <span class="col-sm-3">${info.accountByOwnerUsername.profileByUsername.address}</span>
                </div>
              </c:if>


              <div class="form-group clearfix">
                <label class="col-sm-3 control-label">Hình ảnh</label><br>

                <div class="images clearfix" id="images">
                </div>
                <div class="clear-float"></div>
                <input type="hidden" id="imageUrls" name="imageUrls" value="${info.imageUrls}">
              </div>

              <div class="form-group clearfix">
                <label class="col-sm-3">Tiện nghi:</label>
                <span class="col-sm-7">
                  <c:choose>
                    <c:when test="${amenity == '[]'}">
                      Không có tiện nghi
                    </c:when>
                    <c:otherwise>
                      <c:forEach var="item" items="${amenity}">
                        <span>${item}, </span>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>
                </span>
              </div>

              <div class="form-group clearfix">
                <label class="col-sm-3">Số lần sửa chữa:</label>
                <span class="col-sm-7">${count}</span>
              </div>

              <div class="button-post">
                <c:if test="${info.statusId != 4}">
                  <a class="btn btn-success" href="repair?action=filter&officeId=${info.id}">Danh sách sửa
                    chữa</a>
                </c:if>

                <input type="hidden" name="action" value="delete">

                <c:if test="${hasContract==true}">
                  <c:if test="${user.roleId != 5}">
                    <div style="display: inline-block;" data-toggle="tooltip" data-placement="top"
                       title="Không thể chỉnh sửa do văn phòng đang có hợp đồng">
                      <a href="" class="btn btn-primary disabled">Chỉnh sửa</a>
                    </div>
                  </c:if>
                  <div data-toggle="tooltip" data-placement="top" style="display: inline-block;"
                        title="Không thể xóa do văn phòng đang có hợp đồng">
                    <button type="submit" class="btn btn-danger" disabled>Xóa văn phòng</button>
                  </div>
                </c:if>
                <c:if test="${hasContract==false}">
                  <c:if test="${user.roleId != 5}">
                    <a class="btn btn-primary" href="office?action=edit&id=${info.id}">Chỉnh sửa</a>
                  </c:if>
                  <button type="submit" class="btn btn-danger">Xóa văn phòng</button>
                </c:if>

                <input type="hidden" name="id" value="${info.id}"/>

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

<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/admin/loadImg.js"
        charset="UTF-8"></script>
<script>
  $('.form').submit(function () {
    var currentForm = $(this);
    event.preventDefault();
    bootbox.dialog({
      size: 'small',
      message: "Nếu bạn xóa văn phòng này tất cả lịch hẹn của văn phòng này sẽ bị hủy. Bạn đồng ý xóa văn phòng này?",
      buttons: {
        cancel: {
          label: "Quay lại",
          className: "btn-default",
          callback: function () {

          }
        }, ok: {
          label: "Xóa",
          className: "btn-danger",
          callback: function () {
            var url = currentForm.attr('action');
            $.ajax({
              type: "POST",
              url: url,
              data: currentForm.serialize(), // serializes the form's elements.
              success: function (data) {
                data = JSON.parse(data);
                if (data == "Success") {
                  bootbox.alert("Xóa văn phòng thành công", function () {
                    window.location.href = "/admin/office";
                  });
                } else {
                  bootbox.alert("Không thể xóa văn phòng do đang có hợp đồng với văn phòng này");

                }
              }
            });
          }
        }
      }
    });
  });
</script>
</body>
</html>
