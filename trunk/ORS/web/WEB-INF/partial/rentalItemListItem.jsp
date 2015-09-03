<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="item" items="${data}">
    <tr>
        <td>${item.name}</td>
        <td>${item.description}</td>
        <td><fmt:formatNumber type="number"
                              value="${item.price}"/>
        </td>
        <td>${item.quantity}</td>
        <td>
            <form action="${pageContext.request.contextPath}/admin/rentalItem"
                  method="post" class="rentalItemForm">
                <button type="submit" name="action" value="delete"
                        class="btn btn-icon btn-default">
                    <i class="fa fa-trash-o color10" title="Xóa"></i></button>
                <input type="hidden" value="${item.id}" name="id">

                <a href="rentalItem?action=edit&id=${item.id}"
                   title="Sửa"
                   class="btn btn-icon btn-default"><i class="fa fa-wrench color5"></i></a>
            </form>
        </td>
    </tr>
</c:forEach>