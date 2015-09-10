<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
>

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
                <form action="user" method="post" class="userForm">
                    <input type="hidden" value="${item.username}" name="username">
                    <input type="hidden" name="action" value="delete">
                    <button type="submit"
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

<script type="text/javascript">

    $('.userForm').submit(function () {
        var currentForm = this;
        event.preventDefault();
        /*bootbox.confirm("Bạn đồng ý xóa thiết bị này?", function() {
         currentForm.submit();
         });*/
        bootbox.dialog({
            size: 'small',
            message: "Bạn đồng ý xóa tài khoản này?",
            buttons: {
                cancel: {
                    label: "Quay lại",
                    className: "btn-default",
                    callback: function () {

                    }
                }, ok: {
                    label: "Đồng ý",
                    className: "btn-primary",
                    callback: function () {
                        currentForm.submit();
                    }
                }
            }
        });

    });
</script>
