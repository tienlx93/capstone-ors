<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 02/06/2015
  Time: 1:04 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Repair Detail</title>
</head>
<body>
Hello
<form method="post" action="RepairController?action=editing">

<table>
    <tr>
        <td>Id</td>
        <td>${info.id}<input type="hidden" name="id" value="${info.id}"></td>
    </tr>
    <tr>
        <td>Hợp đồng</td>
        <td><input type="text" name="contractId" value="${info.contractId}"></td>
    </tr>
    <tr>
        <td>Nhân viên được giao</td>
        <td><input type="text" name="assignedStaff" value="${info.assignedStaff}"></td>
    </tr>
    <tr>
        <td>Loại yêu cầu</td>
        <td><input type="text" name="type" value="${info.type}"></td>
    </tr>
    <tr>
        <td>Mô tả</td>
        <td><input type="text" name="description" value="${info.description}"></td>
    </tr>
    <tr>
        <td>Tình trạng</td>
        <td><input type="text" name="repairStatusId" value="${info.repairStatusId}"></td>
    </tr>

</table>
</form>
</body>
</html>
