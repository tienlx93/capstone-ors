<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:forEach items="${data}" var="item">
    <tr>
    <tr>
        <td>${item.name}</td>
        <td>${item.weight}</td>
        <td>
            <c:if test="${item.priority == 1}">
                Cao
            </c:if>
            <c:if test="${item.priority == 0 || item.priority == null}">
                Thấp
            </c:if>
        </td>
        <td>${item.amenityGroupByAmenityGroupId.name}</td>
        <td>
            <form action="amenity" method="post"
                  class="amenityForm">
                <input type="hidden" name="action" value="delete"/>
                <input type="hidden" value="${item.id}" name="id">
                <button type="submit"
                        class="btn btn-icon btn-default"><i
                        class="fa fa-trash-o color10"></i></button>

                <a href="amenity?action=edit&id=${item.id}"
                   title="Cập nhật"
                   class="btn btn-icon btn-default"><i class="fa fa-wrench color5"></i></a>
            </form>
        </td>
    </tr>
    </tr>
</c:forEach>

<script type="text/javascript">

    $('.amenityForm').submit(function () {
        var currentForm = $(this);
        event.preventDefault();
        /*bootbox.confirm("Bạn đồng ý xóa thiết bị này?", function() {
         currentForm.submit();
         });*/
        bootbox.dialog({
            size: 'small',
            message: "Bạn đồng ý xóa tiện nghi này?",
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