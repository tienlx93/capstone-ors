<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"/><link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
                                                                                                                  type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
              type="text/css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
        <link rel="stylesheet" type="text/css" href="../../css/adminlogin.css"/>

        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
        <title>Office Rental Service</title>
        <title>Login</title>
    <jsp:include page="/WEB-INF/admin/top.jsp"/>
    </head>
    <body>
        <div id="container">
            <form class="form-signin" id="login" action="${pageContext.request.contextPath}/admin" method="post">
                <h2>Đăng nhập vào hệ thống</h2>
                <input class="form-control" type="text" name="txtUsername" id="loginEmail" value="${username}" placeholder="Tài khoản" required >
                <input class="form-control" type="password" name="txtPassword" id="loginPass" value="${password}" placeholder="Mật khẩu" required >
                <div class="error">${error}</div>
                <button type="submit" class="btn btn-primary" name="action" value="login">Đăng nhập</button>
                <button type="reset" class="btn btn-default" name="123" value="Reset">Reset</button>
            </form>
        </div>
    </body>


</html>



