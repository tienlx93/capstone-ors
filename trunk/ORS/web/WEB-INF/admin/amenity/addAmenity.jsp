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
            Thêm tài khoản mới
          </div>
          <div>
            <form action="${pageContext.request.contextPath}/admin/amenity" method="post">
              <div class="form-group">
                <label for="name">Tên tiện nghi</label>
                <input type="text" name="name" class="" id="name">
              </div>

              <div class="form-group">
                <label for="description">Mô tả</label>
                <input type="text" name="description" class="" id="description">
              </div>

              <div class="form-group">
                <label for="weight">Trọng số</label>
                <input type="text" name="weight" class="" id="weight">
              </div>

              <div class="form-group">
                <label for="priority">Độ ưu tiên</label>
                <input type="text" name="priority" class="" id="priority">
              </div>

              <div class="form-group">
                <label for="group">Nhóm thiết bị</label>
                <select name="group" class="" id="group">
                  <c:forEach var="item" items="${groupList}">
                    <option value="${item.id}">${item.name}</option>
                  </c:forEach>
                </select>
              </div>

              <div class="button-post">
                <button type="button" value="cancel" name="action">Hủy</button>
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