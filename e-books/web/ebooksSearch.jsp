<%--
  Created by IntelliJ IDEA.
  User: mr.weekend
  Date: 2023/6/5
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>搜索结果</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/body.css">
    <script src="js/jquery-3.6.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<%--navbar--%>
<jsp:include page="/navbar.jsp"></jsp:include>
<%--container--%>
<div class="container">
    <div style="margin: 70px;"></div>
    <%--  search--%>
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
            <form class="navbar-form" action="ebooksSearch" method="get">
                <div class="input-group">
                    <input type="text" class="form-control" id="keyword" placeholder="书名" name="ebookName" required="required" value="${keyword}">
                    <span class="input-group-btn">
            <button type="submit" class="btn btn-default">搜书</button>
          </span>
                </div>
            </form>
        </div>
        <div class="col-lg-3">
            <span>收录电子书:</span>
            ${sum}
            <span>本</span>
        </div>
    </div>
    <%--  ebookslst--%>
    <div class="row" id="ebookList" style="margin-top: 25px">
        <c:choose>
            <c:when test="${empty searchResult}">
                <div class="alert alert-info" role="alert">
                    <span>暂无相关资源</span>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="ebook" items="${searchResult}">
                    <div class="col-sm-6 col-md-3">
                        <div class="bookCard">
                            <a href="/ebookDetail?id=${ebook.id}">
                                <img src="${ebook.image}" alt="">
                            </a>
                            <div class="bookContent">
                                <a href="/ebookDetail?id=${ebook.id}">
                                    <h4>${ebook.bookname}</h4>
                                </a>
                                <p>${ebook.author}</p>
                                <p>${ebook.press}</p>
                                <p>
                                    <span>
                                        <span aria-hidden="true" class="glyphicon glyphicon-download-alt"></span>
                                        <span>下载量</span>
                                        <span>${ebook.download}</span>
                                    </span>
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
</div>
</div>
<%--footer--%>
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
