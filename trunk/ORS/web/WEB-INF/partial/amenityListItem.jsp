<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${data}" var="item">
  <tr>
    <td>${item.name}</td>
    <td>${item.description}</td>
    <td>${item.weight}</td>
    <td>${item.priority}</td>
    <td>
      <form action="${pageContext.request.contextPath}/admin/amenity" method="post">
        <div class="btn-group" role="group">
          <button  type="submit" name="action" value="delete" class="btn btn-icon btn-default"><i class="fa fa-trash-o color10"></i></button>
          <input type="hidden" value="${item.id}" name="id">

          <a href="amenity?action=edit&id=${item.id}"
             title="Cập nhật"
             class="btn btn-icon btn-default"><i class="fa fa-wrench color5"></i></a>
        </div>
      </form>
    </td>

  </tr>
</c:forEach>