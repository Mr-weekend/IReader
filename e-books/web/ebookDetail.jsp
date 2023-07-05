<%--
  Created by IntelliJ IDEA.
  User: mr.weekend
  Date: 2023/6/9
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>电子书详情</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/body.css">
    <script src="js/jquery-3.6.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<%--navbar--%>
<jsp:include page="navbar.jsp"></jsp:include>
<%--container--%>
<div class="container">
    <div style="margin-top: 100px;"></div>
    <c:if test="${not empty ebook}">
        <div class="row ebookCard" style="border-radius: 5px;">
            <div class="col-sm-3">
                <a href="">
                    <img src="${ebook.image}" alt="">
                </a>
            </div>
            <div class="col-sm-7">
                <h3>${ebook.bookname}</h3>
                <div style="margin: 15px;"></div>
                <div class="row"></div>
                <div class="row introduction ">
                    <span class="col-sm-12 introduction">${ebook.introduction}</span>
                </div>
                <div style="margin: 15px;"></div>
                <div class="row author">
                    <span class="col-sm-2">作者：</span>
                    <span class="col-sm-4">${ebook.author}</span>
                </div>
                <div class="row press">
                    <span class="col-sm-2">出版社：</span>
                    <span class="col-sm-4">${ebook.press}</span>
                </div>
                <div class="row ISBN">
                    <span class="col-sm-2">ISBN：</span>
                    <span class="col-sm-4">${ebook.isbn}</span>
                </div>
                <div style="margin: 10px;"></div>
                <div class="row download">
                <span class="col-sm-2">
                        <a id="link" href="download?id=${ebook.id}&src=${ebook.file}&count=${ebook.download}" >
                            <button class="btn btn-success"   id = "download" >
                                <span aria-hidden="true" class="glyphicon glyphicon-save"></span>
                                    点击下载
                            </button>
                        </a>
                </span>
                </div>
            </div>
        </div>
    </c:if>
</div>
<%--hasNotLoginModal--%>
<div id = "hasNotLoginModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <div>要进行下载操作请先登录！</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<%--footer--%>
<jsp:include page="footer.jsp"></jsp:include>

<c:if test="${empty user}">
    <script>
        $('#hasNotLoginModal').modal('show')
        $('#download').attr("disabled","disabled")
        $("#link").click(function (){
            $('#hasNotLoginModal').modal('show')
        })
    </script>
</c:if>
</body>
</html>
