<%@ page import="dao.RentalItemDAO" %>
<%@ page import="entity.RentalItem" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 10/06/2015
  Time: 10:54 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/css/bootstrap.min.css"
          type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/font-awesome-4.3.0/css/font-awesome.min.css"
          type="text/css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/core.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootbox.min.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title">Quản lí thiết bị</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Danh sách thiết bị
                    </div>
                    <div>
                        <a class="btn btn-default"
                           href="${pageContext.request.contextPath}/admin/rentalItem?action=new">
                            <span class="icon color5"><i class="fa fa-plus"></i>
                            Thêm mới thiết bị</span>
                        </a>
                    </div>

                    <div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Tên</th>
                                <th>Mô tả</th>
                                <th>Giá (VNĐ)</th>
                                <th>Số lượng (cái)</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="table-body">
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
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <nav>
                            <ul class="pagination">
                                <li id="prev" class="disabled">
                                    <a href="#" onclick="prev()" aria-label="Previous">
                                        <span aria-hidden="true">«</span>
                                    </a>
                                </li>
                                <c:forEach var="i" begin="1" end="${pageCount}">
                                    <li id="item-${i}" class="items <c:if test="${i==1}">active</c:if>"><a href="#"
                                                                                                           onclick="goto(${i})">${i}</a>
                                    </li>

                                </c:forEach>
                                <li id="next">
                                    <a href="#" onclick="next()" aria-label="Next">
                                        <span aria-hidden="true">»</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>
</div>
</body>
<script>
    var pageNumber = 1;
    var pageCount = ${pageCount};
    var prev = function () {
        if (pageNumber > 1) {
            pageNumber--;
            getPage(pageNumber);
        }
    };
    var next = function () {
        if (pageNumber < pageCount) {
            pageNumber++;
            getPage(pageNumber);
        }
    };
    var goto = function (i) {
        pageNumber = i;
        getPage(pageNumber);
    };
    var getPage = function (page) {
        var selector = $(".items");
        selector.removeClass("active");
        $(selector[page - 1]).addClass("active");
        $("#next").removeClass("disabled");
        $("#prev").removeClass("disabled");
        if (page == pageCount) {
            $("#next").addClass("disabled");
        }
        if (page == 1) {
            $("#prev").addClass("disabled");
        }
        $.ajax({
            method: "GET",
            url: "rentalItem",
            data: {
                action: "page",
                startPage: page
            }
        }).done(function (data) {
            $("#table-body").html(data);
        });
    };
</script>

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
</html>
