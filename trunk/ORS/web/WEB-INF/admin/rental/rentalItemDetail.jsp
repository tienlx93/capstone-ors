<%--
  Created by IntelliJ IDEA.
  User: Thành
  Date: 10/06/2015
  Time: 11:47 SA
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
    <h1 class="title">Chỉnh sửa thiết bị</h1>
  </div>

  <div class="container-padding">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">

          <div>
            <form action="rentalItem?action=editing" method="post">
              <div class="form-group" hidden>
                <label for="id">Id</label>
                <%--<input type="text" name="name" class="" id="id" value="${office.name}">--%>
                ${info.id}<input type="hidden" name="id" id="id" value="${info.id}">
              </div>

              <div class="form-group">
                <label for="name">Tên</label>
                <input type="text" name="name" id="name" value="${info.name}" />
              </div>

              <div class="form-group">
                <label for="description">Mô tả</label>
                <textarea type="text" name="description" id="description">${info.description}</textarea>
              </div>

              <div class="form-group">
                <label for="price">Giá</label>
                <input type="text" name="price" id="price" value="${info.price}" />
              </div>

              <div class="form-group">
                <label for="quantity">Số lượng</label>
                <input type="text" name="quantity" id="quantity" value="${info.quantity}" />
              </div>

              <%--<div class="form-group">
                <label for="price">Tên</label>
                &lt;%&ndash;<input type="text" name="address" class="" id="contractId" value="${office.address}">&ndash;%&gt;
                ${info.contractId}<input type="hidden" name="price" id="price"
                                         value="${info.price}">
              </div>

              <div class="form-group">
                <label for="quantity">Tên</label>
                &lt;%&ndash;<input type="text" name="address" class="" id="contractId" value="${office.address}">&ndash;%&gt;
                ${info.contractId}<input type="hidden" name="quantity" id="quantity"
                                         value="${info.quantity}">
              </div>--%>

              <%--<div class="form-group">
                <label for="assignStaff">Nhân viên được giao</label>

                <% AccountDAO acc = new AccountDAO();
                  List<Account> listAcc = acc.findAll();%>
                <select name="assignStaff" id="assignStaff">
                  <c:forEach var="itemAcc" items="<%= listAcc %>">
                    <option value="${itemAcc.username}"
                            <c:if test="${info.assignStaff==itemAcc.username}">selected</c:if>>${itemAcc.username}</option>
                  </c:forEach>
                </select>
              </div>


              <div class="form-group">
                <label for="description">Mô tả</label>
                <textarea type="text" name="description" id="description">${info.description}</textarea>
              </div>

              <div class="form-group">
                <label for="statusId">Tình trạng</label>
                <% RepairStatusDAO dao = new RepairStatusDAO();
                  List<RepairStatus> list = dao.findAll();%>
                <select name="statusId" id="statusId">
                  <c:forEach var="item" items="<%= list %>">
                    <option value="${item.id}"
                            <c:if test="${info.statusId==item.id}">selected</c:if>
                            >${item.description}</option>
                  </c:forEach>
                </select>
              </div>

              <div class="form-group">
                <label for="list">Thông tin chi tiết</label>
                <% RentalDetailDAO rdd = new RentalDetailDAO();
                  List<RentalDetail> detailList = rdd.findAll();%>
                <div>
                  <table class="table" id="list">
                    <thead>
                    <tr>
                      <th>Thiết bị</th>
                      <th>Giá</th>
                      <th>Số lượng</th>
                      <th>Thành tiền</th>
                      &lt;%&ndash;<th></th>&ndash;%&gt;
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="<%= detailList %>">
                      <tr>
                        <td>${item.rentalItemByRentalItemId.name}</td>
                        <td>${item.unitPrice} VNĐ</td>
                        <td>${item.quantity} (cái)</td>
                        <td>${item.unitPrice * item.quantity} VNĐ</td>
                          &lt;%&ndash;<td><a href="repair?action=edit&id=${item.id}">Chỉnh sửa</a></td>&ndash;%&gt;
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
--%>
              <div class="button-post">
                <button type="submit" name="action">Lưu</button>

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
</body>
</html>
