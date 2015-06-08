<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dao.RepairStatusDAO" %>
<%@ page import="entity.RepairStatus" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.AccountDAO" %>
<%@ page import="entity.Account" %>
<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 02/06/2015
  Time: 1:04 SA
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
    <link rel="stylesheet/less" href="${pageContext.request.contextPath}/css/header.less" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css" type="text/css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
    <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>

<div class="content">
    <div class="page-header">
        <h1 class="title">Chỉnh sửa yêu cầu</h1>
    </div>

    <div class="container-padding">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <%--<div class="panel-title">
                        Thêm mới văn phòng
                    </div>--%>
                    <div>
                        <form action="Repair?action=editing" method="post">
                            <%--<div class="form-group">
                                <label for="id">Id</label>
                                &lt;%&ndash;<input type="text" name="name" class="" id="id" value="${office.name}">&ndash;%&gt;
                                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
                            </div>

                            <div class="form-group">
                                <label for="contractId">Hợp đồng</label>
                                &lt;%&ndash;<input type="text" name="address" class="" id="contractId" value="${office.address}">&ndash;%&gt;
                                ${info.contractId}<input type="hidden" name="contractId" id="contractId"
                                                         value="${info.contractId}">
                            </div>--%>
                            <div class="form-group">
                                <label for="assignedStaff">Nhân viên được giao</label>
                                <%--<select name="category" class="" id="category">
                                    <c:forEach var="item" items="${categoryList}">
                                        <option value="${item.id}"
                                                <c:if test="${office.categoryId==item.id}">selected</c:if> >
                                                ${item.description}</option>
                                    </c:forEach>
                                </select>--%>
                                <% AccountDAO acc = new AccountDAO();
                                    List<Account> listAcc = acc.findAll();%>
                                <select name="assignedStaff" id="assignedStaff">
                                    <c:forEach var="itemAcc" items="<%= listAcc %>">
                                        <option value="${itemAcc.username}">${itemAcc.username}</option>
                                    </c:forEach>
                                </select>
                            </div>


                            <div class="form-group">
                                <label for="description">Mô tả</label>
                                <%--<textarea name="description" class="" id="description">${office.description}</textarea>--%>
                                <textarea type="text" name="description" id="description">${info.description}</textarea>
                                <%--<input type="text" name="description" value="${info.description}">--%>
                            </div>

                            <div class="form-group">
                                <label for="repairStatusId">Tình trạng</label>
                                <% RepairStatusDAO dao = new RepairStatusDAO();
                                    List<RepairStatus> list = dao.findAll();%>
                                <select name="repairStatusId" id="repairStatusId">
                                    <c:forEach var="item" items="<%= list %>">
                                        <option value="${item.id}">${item.description}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <%--<div class="form-group">
                                <label>Danh sách hình ảnh</label><br>

                                <div class="images clearfix" id="images">

                                </div>
                                <div class="clear-float"></div>
                                <input type="file" id="file" name="file" accept="image/*" title="Mời chọn hình ảnh">

                            </div>

                            <div class="form-group">
                                <label for="price">Giá</label>
                                <input type="text" name="price" class="" id="price" value="${office.price}">
                            </div>
                            <div class="form-group">
                                <label for="priceTerm">Đơn vị giá</label>
                                <select name="priceTerm" class="" id="priceTerm">
                                    <c:forEach var="item" items="${priceTermList}">
                                        <option value="${item.id}"
                                                <c:if test="${office.priceTerm==item.id}">selected</c:if> >
                                                ${item.description}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="floor">Số tầng</label>
                                <input type="text" name="floor" class="" id="floor" value="${office.floorNumber}">
                            </div>
                            <div class="form-group">
                                <label for="area">Diện tích (m<sup>2</sup>)</label>
                                <input type="text" name="area" class="" id="area" value="${office.area}">
                            </div>--%>

                            <div class="button-post">
                                <%--<input type="hidden" id="imageUrls" name="imageUrls">--%>
                                <button type="submit" name="action">Lưu</button>
                                <%--<input type="submit" value="save">--%>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/admin/bottom.jsp"/>

</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.ajaxfileupload.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/upload.js" charset="UTF-8"></script>


<%--<head>
    <title>Repair Detail</title>
</head>
<body>
<form method="post" action="Repair?action=editing">

    <table>
        <tr>
            <td>Id</td>
            <td>${info.id}<input type="hidden" name="id" value="${info.id}"></td>
        </tr>
        <tr>
            <td>Hợp đồng</td>
            <td>${info.contractId}<input type="hidden" name="contractId" value="${info.contractId}"></td>
        </tr>
        <tr>
            <td>Nhân viên được giao</td>
            <% AccountDAO acc = new AccountDAO();
                List<Account> listAcc = acc.findAll();%>
            <td><select name="assignedStaff">
                <c:forEach var="itemAcc" items="<%= listAcc %>">
                    <option value="${itemAcc.username}">${itemAcc.username}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td>Loại yêu cầu</td>
            <td><input type="text" name="type" value="${info.type}"></td>
        </tr>
        <tr>
            <td>Mô tả</td>
            <td><input type="text" name="description" value="${info.description}"></td>
        </tr>
        <tr>
            <td>Tình trạng</td>
            <% RepairStatusDAO dao = new RepairStatusDAO();
                List<RepairStatus> list = dao.findAll();%>
            <td><select name="repairStatusId">
                <c:forEach var="item" items="<%= list %>">
                    <option value="${item.id}">${item.description}</option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="save"></td>
        </tr>
    </table>
</form>--%>
</body>
</html>
