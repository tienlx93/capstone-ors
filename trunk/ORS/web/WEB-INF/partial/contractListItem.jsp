<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${data}" var="item">
  <c:if test="${item.statusId != 4}">
    <tr>
      <td>${item.accountByCustomerUsername.username}</td>
      <td>${item.officeByOfficeId.name}</td>
      <td>${item.startDate}</td>
      <td>${item.endDate}</td>
      <td>${item.paymentFee}</td>
      <td>${item.paymentTermByPaymentTerm.description}</td>
    </tr>
  </c:if>
</c:forEach>