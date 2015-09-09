<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>>

<c:forEach var="item" items="${data}">
  <c:if test="${item.username != 'admin'}">
    <tr>
      <td>${item.username}</td>
      <td>${item.email}</td>
      <td>
        <c:if test="${item.roleByRoleId.roleName == 'Owner'}">
          Chủ văn phòng
        </c:if>
        <c:if test="${item.roleByRoleId.roleName == 'Manager'}">
          Người quản lý
        </c:if>
        <c:if test="${item.roleByRoleId.roleName == 'Staff'}">
          Nhân viên
        </c:if>
        <c:if test="${item.roleByRoleId.roleName == 'Customer'}">
          Khách hàng
        </c:if>
      </td>
      <td>${item.accountStatusByStatusId.description}</td>
      <td>
        <form action="${pageContext.request.contextPath}/admin/user" method="post">
          <input type="hidden" value="${item.username}" name="username">

          <button type="submit" name="action" value="delete"
                  class="btn btn-icon btn-default"><i
                  class="fa fa-trash-o color10"></i></button>

          <a href="${pageContext.request.contextPath}/admin/user?action=edit&username=${item.username}"
             title="Sửa"
             class="btn btn-icon btn-default"><i class="fa fa-wrench color5"></i></a>

            <a href="user?action=editing&username=${item.username}"
               title="Chi tiết"
               class="btn btn-icon btn-default"><i
                    class="fa fa-info color5"></i></a>

        </form>
      </td>

    </tr>
  </c:if>
</c:forEach>
