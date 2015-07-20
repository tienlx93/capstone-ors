<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${data}" var="item">
    <tr>
        <td>${item.name}</td>
        <td>${item.description}</td>
        <td>${item.price}</td>
        <td>${item.quantity}</td>
        <td><a href="rentalItem?action=edit&id=${item.id}">Chỉnh sửa</a></td>
    </tr>
</c:forEach>