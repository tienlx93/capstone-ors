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
    <h1 class="title">Thông tin người dùng</h1>
  </div>

  <div class="container-padding">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div>
            <form action="user?action=editing" method="post">
              <%--<div class="form-group clearfix" hidden>
                <label for="id" class="col-sm-2 control-label">Id</label>
                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
              </div>--%>

              <div class="form-group clearfix">
                <div class="col-sm-10">
                  <b>Họ và tên: </b>${info.profileByUsername.fullName}
                </div>
              </div>


                <div class="form-group clearfix">
                  <div class="col-sm-10">
                    <b>Xưng hô: </b>${info.profileByUsername.title}
                  </div>
                </div>

                <div class="form-group clearfix">
                  <div class="col-sm-10">
                    <b>Tên đăng nhập </b>${info.username}
                  </div>
                </div>


              <div class="form-group clearfix">
                <div class="col-sm-10" id="address">
                  <b>Công ty: </b>${info.profileByUsername.company}
                </div>
              </div>

              <div class="form-group clearfix">
                <div class="col-sm-10">
                  <b>Địa chỉ: </b>${info.profileByUsername.address}


                </div>
              </div>
                <div class="form-group clearfix">
                  <div class="col-sm-10" id="address">
                    <b>Ngày sinh: </b>${info.profileByUsername.birthday}
                  </div>
                </div>
                <div class="button-post">

                  <a onclick="window.history.back()" class="btn btn-default">Quay lại</a>
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
