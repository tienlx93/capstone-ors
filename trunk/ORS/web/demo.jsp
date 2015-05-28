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
<c:forEach var="item" items="data">
  Username: <c:out value="item.userName"/><br/>
  Email: <c:out value="item.email"/><br/>
  Role: <c:out value="item.userName"/><br/>
</c:forEach>
</body>
</html>
