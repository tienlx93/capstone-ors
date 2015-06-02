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
  <title></title>
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
</body>
</html>
