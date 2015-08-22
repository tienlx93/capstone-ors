<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 02/06/2015
  Time: 9:50 CH
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
    <h1 class="title">Quản lí tài khoản</h1>
  </div>

  <div class="container-padding">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-title">
            Danh sách tài khoản
          </div>
          <div>
            <a class="btn" href="${pageContext.request.contextPath}/admin/user?action=new">
              <span class="icon color5"><i class="fa fa-plus"></i></span>
              Thêm mới tài khoản
            </a>
          </div>
          <div>
            <table class="table">
              <thead>
              <tr>
                <td>Tên đăng nhập</td>
                <td>Email</td>
                <td>Chức vụ</td>
                <td>Tình trạng</td>
                <td>Tác vụ</td>
              </tr>
              </thead>
              <tbody>

              <c:forEach var="item" items="${data}">
                <tr>
                  <td>${item.username}</td>
                  <td>${item.email}</td>
                  <td>${item.roleByRoleId.roleName}</td>
                  <td>${item.accountStatusByStatusId.name}</td>
                  <td>
                    <form action="${pageContext.request.contextPath}/admin/user" method="post">
                      <input type="hidden" value="${item.username}" name="username">
                      <button type="submit" name="action" value="delete">Xóa</button>
                    </form>
                    <a href="${pageContext.request.contextPath}/admin/user?action=edit&username=${item.username}">
                      Sửa</a>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="/WEB-INF/admin/bottom.jsp"/>
</div>
</body>
</html>
