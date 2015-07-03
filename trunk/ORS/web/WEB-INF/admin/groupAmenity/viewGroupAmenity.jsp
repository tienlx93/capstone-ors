<%--
  Created by IntelliJ IDEA.
  User: Tuan
  Date: 6/23/2015
  Time: 4:47 PM
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

  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/less-1.5.0.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/lib/plugin.js"></script>
  <script type="text/javascript"
          src="${pageContext.request.contextPath}/lib/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
  <title>Office Rental Service</title>
</head>
<body>
<jsp:include page="/WEB-INF/admin/top.jsp"/>

<jsp:include page="/WEB-INF/admin/left.jsp"/>
<div class="content">
  <div class="page-header">
    <h1 class="title">Quản lí nhóm tiện nghi</h1>
  </div>

  <div class="container-padding">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-title">
            Danh sách nhóm tiện nghi
          </div>
          <div>
            <a class="btn" href="${pageContext.request.contextPath}/admin/groupAmenity?action=new">
              <span class="icon color5"><i class="fa fa-plus"></i></span>
              Thêm mới nhóm tiện nghi
            </a>
          </div>
          <div>
            <table class="table">
              <thead>
              <tr>
                <th>Tên nhóm</th>
                <th>Mô tả</th>
                <th></th>
              </tr>
              </thead>
              <tbody>
              <c:forEach items="${list}" var="item">
                <tr>
                  <td>${item.name}</td>
                  <td>${item.description}</td>
                  <td><a href="groupAmenity?action=edit&id=${item.id}">Cập nhật</a>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="/WEB-INF/admin/bottom.jsp"/>
</div>
</body>
</html>
