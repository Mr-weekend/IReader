<%--
  Created by IntelliJ IDEA.
  User: mr.weekend
  Date: 2023/6/12
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>电子书修改</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/admincss.css">
</head>
<body>
<%--AdminNavbar--%>
<jsp:include page="adminNavbar.jsp"></jsp:include>
<div class="container">
    <div style="margin-top: 70px;"></div>
    <div class="row">
        <form action="">
            <div class="form-group">
                <label>电子书名</label>
                <input class="form-control" value="${ebook.bookname}">
            </div>
            <div class="form-group">
                <label>作者</label>
                <input class="form-control" value="${ebook.author}">
            </div>
            <div class="form-group">
                <label>出版社</label>
                <input class="form-control" value="${ebook.press}">
            </div>
            <div class="form-group">
                <label>ISBN</label>
                <input class="form-control" value="${ebook.isbn}">
            </div>
            <div class="form-group">
                <label>ISBN</label>
                <input class="form-control" value="${ebook.isbn}">
            </div>
            <div class="form-group">
                <label>介绍</label>
                <textarea class="form-control" rows="3" style="resize: none;">${ebook.introduction}</textarea>
            </div>
            <div class="form-group">
                <label>图片</label>

                    <img src="${ebook.image}" style="width: 50%"/>
                    <input type="file" name="cover"  id="input_file">推荐尺寸: 500 * 500

            </div>
        </form>
    </div>
</div>
</body>
</html>
