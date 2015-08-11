<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${data}" var="item">
  <tr>
    <td>${item.name}</td>
    <td>${item.description}</td>
    <td>${item.weight}</td>
    <td>${item.priority}</td>
    <td><form action="${pageContext.request.contextPath}/admin/amenity" method="post">
      <button  type="submit" class="btn btn" name="action" value="delete" class="btn btn-icon btn-default"><i class="fa fa-trash-o color5"></i></button>
      <input type="hidden" value="${item.id}" name="id">

    </form></td>
    <td>
      <a href="amenity?action=edit&id=${item.id}"
         title="Cập nhật"
         class="btn btn-icon btn-default"><i class="fa fa-wrench color5"></i></a>

    </td>

  </tr>
</c:forEach>