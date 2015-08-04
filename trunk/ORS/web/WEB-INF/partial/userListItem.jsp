<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>>

<c:forEach var="item" items="${data}">
  <tr>
    <td>${item.username}</td>
    <td>${item.email}</td>
    <td>${item.roleByRoleId.roleName}</td>
    <td>${item.accountStatusByStatusId.name}</td>
    <td>
      <form action="${pageContext.request.contextPath}/admin/user" method="post">
        <input type="hidden" value="${item.username}" name="username">
        <button type="submit" name="action" value="delete">Xóa</button>
      </form>
      <a href="${pageContext.request.contextPath}/admin/user?action=edit&username=${item.username}">
        Sửa</a>
    </td>
    <c:if test="${item.roleId == 4}">
      <td><a class="btn"
             href="user?action=editing&username=${item.username}">
        Xem chi tiết
      </a></td>
    </c:if>
  </tr>
</c:forEach>
