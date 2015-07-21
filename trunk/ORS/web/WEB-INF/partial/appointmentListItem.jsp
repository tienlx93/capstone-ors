<%@ page import="entity.Account" %>
<%@ page import="dao.AccountDAO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% AccountDAO acc = new AccountDAO();
  List<Account> listAcc = acc.findStaff();%>
<c:forEach items="${data}" var="item" varStatus="index">
  <c:if test="${item.statusId == 1}">
    <tr>
      <form action="/admin/appointment?action=editing"
            method="post" name="appointment">
        <td>${item.accountByCustomerUsername.username}</td>
        <td>${item.officeByOfficeId.name}</td>
        <td>${item.time}</td>
        <td>
          <input type="hidden" name="id"
                 value="${item.id}">
          <select name="assignedStaff"
                  id="assignedStaff"
                  class="form-control">
            <option value="">(Không có đề xuất)</option>
            <c:forEach var="itemAcc"
                       items="<%= listAcc %>">
              <option value="${itemAcc.username}"
                      <c:if test="${suggestMap[item.id] == itemAcc.username}">selected</c:if> >
                  ${itemAcc.username}</option>
            </c:forEach>
          </select>
        </td>

        <td>
          <button class="btn btn-default" id="assign"
                  type="submit" name="button"
                  value="assign">Giao việc
          </button>
          <a class="btn"
             href="${pageContext.request.contextPath}/admin/appointment?action=edit&id=${item.id}">
            Chi tiết
          </a>
        </td>
      </form>
    </tr>
  </c:if>
</c:forEach>