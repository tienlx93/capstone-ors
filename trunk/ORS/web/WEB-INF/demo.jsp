<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/28/2015
  Time: 8:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello World</title>
</head>
<body>
<h1>Hello World</h1>
<table>
    <tr>
        <td>Username</td>
        <td>Email</td>
        <td>Role</td>
    </tr>
    <c:forEach var="item" items="${data}">
        <tr>
            <td>${item.username}</td>
            <td>${item.email}</td>
            <td>${item.roleByRoleId.roleName}</td>
        </tr>
    </c:forEach>
</table>

<form action="demo2" method="post">
    Username <input type="text" name="username"> <br>
    Password <input type="password" name="password"> <br>
    Email <input type="email" name="email"> <br>
    <input type="submit" name="action" value="Save">
</form>
</body>
</html>
