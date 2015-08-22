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
            <h1 class="title">Cập nhật tài khoản</h1>
          </div>
          <div>
            <form action="${pageContext.request.contextPath}/admin/user" method="post">
              <div class="form-group clearfix">
                <label  class="col-sm-2">Tên đăng nhập</label>

                <div class="col-sm-10">
                  <span>${account.username}</span>
                  <input type="hidden" name="username" class="" value="${account.username}">
                </div>
              </div>


              <div class="form-group clearfix">
                <label for="password" class="col-sm-2">Mật khẩu</label>
                <div class="col-sm-10">
                  <input type="password" name="password" class="" id="password" value="${account.password}" required>
                </div>
              </div>


              <div class="form-group clearfix">
                <label for="email" class="col-sm-2">Email</label>
                <div class="col-sm-10">
                  <input type="email" name="email" class="" id="email" value="${account.email}" required>
                </div>
              </div>

              <div class="form-group clearfix" hidden>
                <input type="hidden" name="statusId" class="" value="${account.statusId}">
              </div>
              <c:choose>
                <c:when test="${account.username == 'admin'}">

                </c:when>
                <c:otherwise>
                  <div class="form-group clearfix" hiden>
                    <label for="role" class="col-sm-2">Chức vụ</label>
                    <div class="col-sm-10">
                    <select name="role" class="" id="role">

                      <c:forEach var="item" items="${roleList}">
                        <option value="${item.id}" <c:if test="${account.roleId==item.id}">selected</c:if> >${item.roleName}</option>

                      </c:forEach>
                    </select>
                    </div>
                  </div>
                </c:otherwise>
              </c:choose>

              <%--<div>
              <form action="${pageContext.request.contextPath}/admin/user" method="post">
                <input type="hidden" value="${item.username}" name="username">
              </form>
              </div>--%>
              <div class="button-post">


                <button type="submit" class="btn btn-primary" value="update" name="action">Cập nhật</button>
                <c:choose>
                  <c:when test="${account.username == 'admin'}">

                  </c:when>
                  <c:otherwise>
                    <c:if test="${account.statusId == 1}">
                    <button type="submit" class="btn btn-danger" value="ban" name="action">Khóa tài khoản</button>
                    </c:if>
                    <c:if test="${account.statusId == 2}">
                    <button type="submit" class="btn btn-success" value="unban" name="action">Mở tài khoản</button>
                    </c:if>
                  </c:otherwise>
                </c:choose>
                <a href="${pageContext.request.contextPath}/admin/user" class="btn btn-default">Hủy</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="/WEB-INF/admin/bottom.jsp"/>

</div>
</body>
</html>
