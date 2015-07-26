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
<div style="text-align: center;"><h1>Các văn phòng phù hợp với yêu cầu của bạn</h1></div>

    <%--<div><img src="http://tienlx.me/img/ban-1.jpg"></div>--%>
    <c:forEach items="${offices}" var="item">
        <div><a href="http://tienlx.me/#/detail/${item.id}">${item.name}</a></div>
        <div><img src="http://tienlx.me/${item.imageUrls}" width="150px" height="120px"></div>
    </c:forEach>
    <%--<p class="myStyle">${data}</p>--%>
</body>
</html>
