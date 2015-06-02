<%@ page import="dao.RepairDAO" %>
<%@ page import="entity.Repair" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 01/06/2015
  Time: 6:58 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Repair</title>
</head>
<body>
<h1>Repair List</h1>
<% RepairDAO dao = new RepairDAO();
    List<Repair> list = dao.findAll();%>
<table>
    <tr>
        <td>Hợp đồng</td>
        <td>Nhân viên được giao</td>
        <td>Loại yêu cầu</td>
        <td>Mô tả</td>
        <td>Tình trạng</td>
        <td></td>
    </tr>
    <c:forEach var="item" items="<%= list %>">
        <tr>
            <td>${item.contractId}</td>
            <td>${item.assignedStaff}</td>
            <td>${item.type}</td>
            <td>${item.description}</td>
            <td>${item.repairStatusId}</td>

            <td><a href="demoRepairDetail?action=edit&id=${item.id}">Xem chi tiết</a></td>

        </tr>
    </c:forEach>
</table>
</body>
</html>


