<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach var="item" items="${data}">
    <tr>
        <td>${item.name}</td>
        <td>${item.description}</td>
        <td><fmt:formatNumber type="number"
                              value="${item.price}" />
        </td>
        <td>${item.quantity}</td>
        <td><a href="rentalItem?action=edit&id=${item.id}"
               title="Sửa"
               class="btn btn-icon btn-default"><i class="fa fa-wrench color5"></i></a>
        </td>
    </tr>
</c:forEach>