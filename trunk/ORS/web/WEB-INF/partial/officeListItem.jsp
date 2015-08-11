<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${data}" var="item">
    <tr>
        <td>${item.name}</td>
        <td>${item.categoryByCategoryId.description}</td>
        <td>${item.price}</td>
        <td>${item.priceTermByPriceTerm.description}</td>
        <td>${item.area}</td>
        <td>${item.address}</td>
        <td>
            <a href="office?action=editing&id=${item.id}"
               title="Chi tiết"
               class="btn btn-icon btn-default"><i class="fa fa-info color5"></i></a>
        </td>
    </tr>
</c:forEach>