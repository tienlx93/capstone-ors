<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${data}" var="item">
  <c:if test="${item.statusId != 4}">
    <tr>
      <td><a class="btn"
             href="contract?action=viewProfile&username=${item.accountByCustomerUsername.username}">${item.accountByCustomerUsername.profileByUsername.fullName}</a>
      </td>
      <td>${item.officeByOfficeId.name}</td>
      <td><fmt:formatDate pattern="dd-MM-yyyy" value="${item.startDate}"/>
      </td>
      <td><fmt:formatDate pattern="dd-MM-yyyy" value="${item.endDate}"/></td>
      <td>
        <fmt:formatNumber type="number"
                          value="${item.paymentFee}" /></td>
      <td>${item.paymentTermByPaymentTerm.description}</td>
      <c:if test="${user.roleId == 2}">
        <td>
          <a href="${pageContext.request.contextPath}/admin/contract?action=editing&id=${item.id}"
             title="Chi tiết" class="btn btn-icon btn-default">
            <i class="fa fa-info color5"></i></a>
        </td>
      </c:if>
    </tr>
  </c:if>
</c:forEach>
