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
<div style="text-align: center;"><h1>Thông báo văn phòng phù hợp</h1></div>
<div>Xin chào, ${fullName}</div>
<br>
<div>Dưới đây là các văn phòng phù hợp với yêu cầu của bạn:</div>
<table style="width: 600px">
  <c:forEach items="${offices}" var="item" varStatus="loopStatus" step="2">
    <tr>
      <td width="300px" style="vertical-align: top;">
        <div style="width: 200px; text-align: center">
          <img src="http://tienlx.me/${offices[loopStatus.index].imageUrls}" width="150px" height="120px">
        </div>
        <div style="width: 200px; text-align: center">
          <a href="http://tienlx.me/#/detail/${offices[loopStatus.index].id}">${offices[loopStatus.index].name}</a>
        </div>
      </td>
      <td width="300px" style="vertical-align: top;">
        <c:if test="${offices[loopStatus.index+1].name != null}">
          <div style="width: 200px; text-align: center">
            <img src="http://tienlx.me/${offices[loopStatus.index+1].imageUrls}" width="150px" height="120px">
          </div>
          <div style="width: 200px; text-align: center">
            <a href="http://tienlx.me/#/detail/${offices[loopStatus.index+1].id}">${offices[loopStatus.index+1].name}</a>
          </div></c:if>
      </td>
    </tr>
  </c:forEach>
</table>
<br>
<div>Bạn có thể quay lại website <a href="http://tienlx.me">Office Rental Service</a> để xem chi tiết hoặc hủy yêu cầu thông
  báo văn phòng phù hợp.</div>
<br>
<div>Chúc bạn sớm tìm được văn phòng phù hợp,</div>
<div>Đội ngũ phát triển Office Rental Service.</div>
</body>
</html>
