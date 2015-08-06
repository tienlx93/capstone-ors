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
                        <form action="${pageContext.request.contextPath}/admin/user" method="post">
                            <div class="form-group">
                                <label for="username">Tên tài khoản</label>
                                <input type="text" name="username" class="" id="username" required>
                            </div>

                            <div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <input type="password" name="password" class="" id="password" required>
                            </div>

                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" name="email" class="" id="email" required>
                            </div>

                            <div class="form-group">
                                <label for="role">Chức vụ</label>
                                <select name="role" class="" id="role" required>
                                    <c:forEach var="item" items="${roleList}">
                                        <option value="${item.id}">${item.roleName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="button-post">
                                <a href="${pageContext.request.contextPath}/admin/user" class="btn btn-default">Hủy</a>
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

</body>
</html>