<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 02/06/2015
  Time: 9:50 CH
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
    <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/office.less" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootbox.min.js"></script>

    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title">Quản lí tài khoản</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-title">
                        Danh sách tài khoản
                    </div>
                    <div>
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/user?action=new">
                            <span class="icon color5"><i class="fa fa-plus"></i>
                            Thêm mới tài khoản</span>
                        </a>
                    </div>
                    <div>
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Tên đăng nhập</th>
                                <th>Email</th>
                                <th>Chức vụ</th>
                                <th>Tình trạng</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody id="table-body">
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
            url: "user",
            data: {
                action: "page",
                startPage: page
            }
        }).done(function (data) {
            $("#table-body").html(data);
        });
    };

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
</html>
