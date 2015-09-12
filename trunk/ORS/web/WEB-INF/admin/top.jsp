<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/2/2015
  Time: 10:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:if test="${user.roleId == null || user.roleId == 2}">
    <div id="top" class="clearfix">

        <!-- Start App Logo -->
        <c:if test="${user.roleId == 2}">
            <div class="applogo">
                <a href="${pageContext.request.contextPath}/admin/home" class="logo">Trang của người quản lý</a>
            </div>
            <!-- End App Logo -->
        </c:if>
        <c:if test="${user.roleId == null}">
            <div class="applogo">
                <a href="${pageContext.request.contextPath}/admin/home" class="logo">ORS</a>
            </div>
        </c:if>
        <a href="#" class="sidebar-open-button"><i class="fa fa-bars"></i></a>

        <!-- Start Searchbox -->
            <%--<form class="searchform">
                <input type="text" class="searchbox" id="searchbox" placeholder="Search">
                <span class="searchbutton"><i class="fa fa-search"></i></span>
            </form>--%>
        <!-- End Searchbox -->

        <!-- Start Top Menu -->
            <%--<ul class="topmenu">
                <li><a href="#">Files</a></li>
                <li><a href="#">Authors</a></li>

            </ul>--%>
        <!-- End Top Menu -->


        <!-- Start Top Right -->
        <c:if test="${sessionScope.user!=null}">
            <ul class="top-right">
                <li class="dropdown link">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle profilebox"
                       aria-expanded="false"><b>${user.username}</b><span class="caret"></span></a>
                    <ul class="dropdown-menu dropdown-menu-list dropdown-menu-right">
                        <li><a href="#"><i class="fa falist fa-key"></i> Đổi mật khẩu</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin?action=logout"><i
                                class="fa falist fa-power-off"></i> Đăng xuất</a></li>
                    </ul>
                </li>
            </ul>
        </c:if>

        <!-- End Top Right -->

    </div>
</c:if>

<c:if test="${user.roleId == 1}">
    <div id="top" class="clearfix" style="background: #8A8A8A">

        <!-- Start App Logo -->
        <div class="applogo">
            <a href="${pageContext.request.contextPath}/admin/home" class="logo">Trang của người quản trị</a>
        </div>
        <!-- End App Logo -->

        <a href="#" class="sidebar-open-button"><i class="fa fa-bars"></i></a>

        <!-- Start Searchbox -->
            <%--<form class="searchform">
                <input type="text" class="searchbox" id="searchbox" placeholder="Search">
                <span class="searchbutton"><i class="fa fa-search"></i></span>
            </form>--%>
        <!-- End Searchbox -->

        <!-- Start Top Menu -->
            <%--<ul class="topmenu">
                <li><a href="#">Files</a></li>
                <li><a href="#">Authors</a></li>

            </ul>--%>
        <!-- End Top Menu -->


        <!-- Start Top Right -->
        <c:if test="${sessionScope.user!=null}">
            <ul class="top-right">
                <li class="dropdown link">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle profilebox"
                       aria-expanded="false"><b>${user.username}</b><span class="caret"></span></a>
                    <ul class="dropdown-menu dropdown-menu-list dropdown-menu-right">
                        <li><a href="#"><i class="fa falist fa-key"></i> Đổi mật khẩu</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin?action=logout"><i
                                class="fa falist fa-power-off"></i> Đăng xuất</a></li>
                    </ul>
                </li>
            </ul>
        </c:if>

        <!-- End Top Right -->

    </div>
</c:if>

<c:if test="${user.roleId == 5}">
    <div id="top" class="clearfix" style="background: #f39c12">

        <!-- Start App Logo -->
        <div class="applogo">
            <a href="${pageContext.request.contextPath}/admin/home" class="logo">Trang của chủ văn phòng</a>
        </div>
        <!-- End App Logo -->

        <a href="#" class="sidebar-open-button"><i class="fa fa-bars"></i></a>

        <!-- Start Searchbox -->
            <%--<form class="searchform">
                <input type="text" class="searchbox" id="searchbox" placeholder="Search">
                <span class="searchbutton"><i class="fa fa-search"></i></span>
            </form>--%>
        <!-- End Searchbox -->

        <!-- Start Top Menu -->
            <%--<ul class="topmenu">
                <li><a href="#">Files</a></li>
                <li><a href="#">Authors</a></li>

            </ul>--%>
        <!-- End Top Menu -->


        <!-- Start Top Right -->
        <c:if test="${sessionScope.user!=null}">
            <ul class="top-right">
                <li class="dropdown link">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle profilebox"
                       aria-expanded="false"><b>${user.username}</b><span class="caret"></span></a>
                    <ul class="dropdown-menu dropdown-menu-list dropdown-menu-right">
                        <li><a href="#"><i class="fa falist fa-key"></i> Đổi mật khẩu</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin?action=logout"><i
                                class="fa falist fa-power-off"></i> Đăng xuất</a></li>
                    </ul>
                </li>
            </ul>
        </c:if>

        <!-- End Top Right -->

    </div>
</c:if>

<c:if test="${user.roleId == 3}">
    <div id="top" class="clearfix" style="background: #26a65b">

        <!-- Start App Logo -->
        <div class="applogo">
            <a href="${pageContext.request.contextPath}/admin/home" class="logo">Trang của nhân viên</a>
        </div>
        <!-- End App Logo -->

        <a href="#" class="sidebar-open-button"><i class="fa fa-bars"></i></a>

        <!-- Start Searchbox -->
            <%--<form class="searchform">
                <input type="text" class="searchbox" id="searchbox" placeholder="Search">
                <span class="searchbutton"><i class="fa fa-search"></i></span>
            </form>--%>
        <!-- End Searchbox -->

        <!-- Start Top Menu -->
            <%--<ul class="topmenu">
                <li><a href="#">Files</a></li>
                <li><a href="#">Authors</a></li>

            </ul>--%>
        <!-- End Top Menu -->


        <!-- Start Top Right -->
        <c:if test="${sessionScope.user!=null}">
            <ul class="top-right">
                <li class="dropdown link">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle profilebox"
                       aria-expanded="false"><b>${user.username}</b><span class="caret"></span></a>
                    <ul class="dropdown-menu dropdown-menu-list dropdown-menu-right">
                        <li><a href="#"><i class="fa falist fa-key"></i> Đổi mật khẩu</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin?action=logout"><i
                                class="fa falist fa-power-off"></i> Đăng xuất</a></li>
                    </ul>
                </li>
            </ul>
        </c:if>

        <!-- End Top Right -->

    </div>
</c:if>