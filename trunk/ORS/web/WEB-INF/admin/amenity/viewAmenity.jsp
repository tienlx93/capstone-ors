<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <h1 class="title">Quản lí tiện nghi</h1>
  </div>

  <div class="container-padding">
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-title">
            Danh sách tiện nghi
          </div>
          <div>
            <a class="btn" href="${pageContext.request.contextPath}/admin/amenity?action=new">
              <span class="icon color5"><i class="fa fa-plus"></i></span>
              Thêm mới tiện nghi
            </a>
          </div>
          <div>
            <table class="table">
              <thead>
              <tr>
                <th>Tên tiện nghi</th>
                <th>Mô tả</th>
                <th>Trọng số</th>
                <th>Độ ưu tiên</th>
                <th></th>
              </tr>
              </thead>
              <tbody id="table-body">
              <c:forEach items="${data}" var="item">
                <tr>
                  <td>${item.name}</td>
                  <td>${item.description}</td>
                  <td>${item.weight}</td>
                  <td>${item.priority}</td>
                  <td><a href="amenity?action=edit&id=${item.id}">Cập nhật</a>
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
                  <li id="item-${i}" class="items <c:if test="${i==1}">active</c:if>"><a href="#" onclick="goto(${i})">${i}</a></li>

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
      pageNumber --;
      getPage(pageNumber);
    }
  };
  var next = function () {
    if (pageNumber < pageCount) {
      pageNumber ++;
      getPage(pageNumber);
    }
  };
  var goto = function(i) {
    pageNumber = i;
    getPage(pageNumber);
  };
  var getPage = function(page) {
    var selector = $(".items");
    selector.removeClass("active");
    $(selector[page-1]).addClass("active");
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
      url: "amenity",
      data: {
        action: "page",
        startPage: page
      }
    }).done(function (data) {
      $("#table-body").html(data);
    });
  };
</script>
</html>
