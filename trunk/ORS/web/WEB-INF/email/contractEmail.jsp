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
<div style="text-align: center;"><h1>Thông báo tình trạng hợp đồng</h1></div>
<div>Xin chào, ${fullName}</div>
<br>
<div>Chúng tôi xin thông báo, hợp đồng với văn phòng ${contract} của bạn ${content}.</div>
<br>
<div>Bạn có thể quay lại website <a href="http://tienlx.me">Office Rental Service</a> để xem chi tiết.x</div>
<div>Đội ngũ phát triển Office Rental Service.</div>
</body>
</html>
