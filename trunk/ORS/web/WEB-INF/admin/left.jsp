<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/2/2015
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="sidebar clearfix">

    <ul class="sidebar-panel nav">
        <li class="sidetitle">MAIN</li>
        <li><a href="">
            <span class="icon color5"><i class="fa fa-home"></i></span>
            Trang chủ</a>
        </li>
        <li><a href="${pageContext.request.contextPath}/admin/office">
            <span class="icon color6"><i class="fa fa-building-o"></i></span>
            Văn phòng</a>
        </li>
        <c:if test="${user.roleId == 1}">
            <li><a href="${pageContext.request.contextPath}/admin/user">
                <span class="icon color6"><i class="fa fa-user"></i></span>
                Người dùng</a>
            </li>
        </c:if>

        <c:if test="${user.roleId != 1}">
            <li><a href="${pageContext.request.contextPath}/admin/appointment">
                <span class="icon color6"><i class="fa fa fa-calendar"></i></span>
                Lịch hẹn
                    <%--TODO: số lượng lịch hẹn chưa xử lí--%>
                <span class="label label-default"></span></a>
            </li>
            <c:if test="${user.roleId != 3}">
                <li><a href="${pageContext.request.contextPath}/admin/contract">
                    <span class="icon color6"><i class="fa fa-file-text-o"></i></span>
                    Hợp đồng
                        <%--TODO: số lượng hợp đồng chưa xử lí--%>
                    <span class="label label-default"></span></a>
                </li>
                <li>
                    <a href="#">
                    <span class="icon color6"><i class="fa fa-file-text-o"></i></span>
                    Yêu cầu của khách hàng
                    <span class="caret"></span>
                    </a>
                    <ul>
                        <li>
                            <a href="#">Trả trước hạn</a>
                        </li>
                        <li>
                            <a href="#">Gia hạn</a>
                        </li>
                    </ul>
                </li>
            </c:if>
            <li><a href="${pageContext.request.contextPath}/admin/repair">
                <span class="icon color6"><i class="fa fa-wrench"></i></span>
                Sửa chữa
                    <%--TODO: số lượng repair chưa xử lí--%>
                <span class="label label-default"></span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/admin/rental">
                <span class="icon color6"><i class="fa fa-fax"></i></span>
                Thuê thiết bị
                    <%--TODO: số lượng thuê thiết bị chưa xử lí--%>
                <span class="label label-default"></span></a>
            </li>
            <li><a href="${pageContext.request.contextPath}/admin/rentalItem">
                <span class="icon color6"><i class="fa fa-cubes"></i></span>
                Quản lý thiết bị</a>
            </li>
        </c:if>

    </ul>


</div>
