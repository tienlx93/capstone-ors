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

        <button  type="submit" class="btn btn" name="action" value="delete" class="btn btn-icon btn-default"><i class="fa fa-trash-o color5"></i></button>
      </form>
    </td>
    </td>
    <td>
      <a href="${pageContext.request.contextPath}/admin/user?action=edit&username=${item.username}"
         title="Sửa"
         class="btn btn-icon btn-default"><i class="fa fa-wrench color5"></i></a>
      <c:if test="${(item.roleId ==5)||(item.roleId==4)}">
        <a href="user?action=editing&username=${item.username}"
           title="Chi tiết"
           class="btn btn-icon btn-default"><i class="fa fa-info color5"></i></a>
      </c:if>
    </td>
    <td>
    </td>
  </tr>
</c:forEach>
