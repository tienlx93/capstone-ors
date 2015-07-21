<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${data}" var="item">
  <tr>
    <td>${item.name}</td>
    <td>${item.description}</td>
    <td>${item.weight}</td>
    <td>${item.priority}</td>
    <td><a href="amenity?action=edit&id=${item.id}">Cập nhật</a>
    </td>
  </tr>
</c:forEach>