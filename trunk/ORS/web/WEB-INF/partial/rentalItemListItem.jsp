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
            <form action="rentalItem"
                  method="post" class="rentalItemForm">
                <input type="hidden" name="action" value="delete"/>
                <input type="hidden" value="${item.id}" name="id">
                <button type="submit"
                        class="btn btn-icon btn-default">
                    <i class="fa fa-trash-o color10" title="Xóa"></i></button>

                <a href="rentalItem?action=edit&id=${item.id}"
                   title="Sửa"
                   class="btn btn-icon btn-default"><i class="fa fa-wrench color5"></i></a>
            </form>
        </td>
    </tr>
</c:forEach>

<script type="text/javascript">

    $('.rentalItemForm').submit(function () {
        var currentForm = this;
        event.preventDefault();
        /*bootbox.confirm("Bạn đồng ý xóa thiết bị này?", function() {
         currentForm.submit();
         });*/
        bootbox.dialog({
            size: 'small',
            message: "Bạn đồng ý xóa thiết bị này?",
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