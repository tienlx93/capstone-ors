<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach var="item" items="${list}">
  <c:if test="${item.repairStatusId == 4}">
    <tr>
      <td>${item.contractByContractId.officeByOfficeId.name}</td>
      <td>${item.contractByContractId.customerUsername}</td>
      <c:if test="${user.roleId == 2}">
        <td>${item.assignedStaff}</td>
      </c:if>
      <td>${item.description}</td>

      <td><a href="repair?action=edit&id=${item.id}">Xem chi tiết</a>
      </td>
    </tr>
  </c:if>
</c:forEach>
