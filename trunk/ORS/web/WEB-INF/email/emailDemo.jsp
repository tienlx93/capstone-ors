<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 7/17/2015
  Time: 1:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .myStyle {
            color: red;
            font-weight: bold;
        }
    </style>
    <title></title>
</head>
<body>
    <h1>Chào mừng</h1>
    <p>Test image</p>
    <%--<div><img src="http://tienlx.me/img/ban-1.jpg"></div>--%>
    <p>Test link</p>
    <c:forEach items="${offices}" var="item">
        <p><a href="http://tienlx.me/#/detail/${item}">Office</a> </p>
    </c:forEach>
    <p>Test dynamic content</p>
    <%--<p class="myStyle">${data}</p>--%>
</body>
</html>
