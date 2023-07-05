<%--
  Created by IntelliJ IDEA.
  User: mr.weekend
  Date: 2023/6/2
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>电子书管理</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/admincss.css">
    <script src="js/jquery-3.6.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<%--adminNavbar--%>
<jsp:include page="adminNavbar.jsp"></jsp:include>
<div class="container">
    <div style="margin: 70px;"></div>
    <%--SearchBook--%>
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
            <form class="navbar-form" action="adminSearchBook" method="get">
                <div class="input-group">
                    <input type="text" class="form-control" id="keyword" placeholder="书名" name="keyword" required="required">
                    <span class="input-group-btn">
            <button type="submit" class="btn btn-default">搜书</button>
          </span>
                </div>
            </form>
        </div>
        <div class="col-lg-3">
            <span>共收录电子书:</span>
            ${sum}
            <span>本</span>
        </div>
    </div>
    <%--addEbook--%>
    <div class="row">
        <a href="#addEbook" class="btn btn-info" data-toggle="modal">新增电子书</a>
    </div>
    <%--addEbookModal--%>
    <div class="modal fade" id="addEbook" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">新增电子书</h4>
                </div>
                <div class="modal-body">
                    <form role = "form" action="/AdminAddConfirmServlet" id="addForm" method="post" enctype="multipart/form-data">
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label for="addBookName" class="control-label">电子书名</label>
                                <input type="text" class="form-control" id="addBookName" name="addBookName">
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="addAuthor" class="control-label">作者</label>
                                <input type="text" class="form-control" id="addAuthor" name="addAuthor">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label for="addPress" class="control-label">出版社</label>
                                <input type="text" class="form-control" id="addPress" name="addPress">
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="addISBN" class="control-label">ISBN</label>
                                <input type="text" class="form-control" id="addISBN" name="addISBN">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12">
                                <label for="addIntroduction" class="control-label">介绍</label>
                                <textarea class="form-control" id="addIntroduction" rows="4" name="addIntroduction"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label for="addImage" class="control-label">电子书图片</label>
                                <input type="file" name="addImage" id="addImage">推荐尺寸: 540 * 678
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="addFile" class="control-label">电子书文件</label>
                                <input type="file" name="addFile" id="addFile">选择电子书文件
                            </div>
                        </div>
                        <div class="row" >
                            <div style="padding-right: 15px;padding-left: 15px; float: right">
                                <button type="submit" class="btn btn-info">新增</button>
                            </div>
                            <div style="float: right">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <%--ebookslist--%>
    <div class="row">
            <table class="table table-bordered table-hover table-condensed" >
                <thead>
                <tr>
                    <th class="td1">ID</th>
                    <th class="td2">图片</th>
                    <th class="td3">电子书名</th>
                    <th class="td4">作者</th>
                    <th class="td5">出版社</th>
                    <th class="td6">ISBN</th>
                    <th class="td7">简介</th>
                    <th class="td8">下载次数</th>
                    <th class="td9">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${not empty ebook}" >
                    <c:forEach var="ebook" items="${ebook}">
                        <tr>
                            <td>
                                <p>${ebook.id}</p>
                            </td>
                            <td>
                                <p>
                                    <a href="">
                                        <img src="${ebook.image}" alt="">
                                    </a>
                                </p>
                            </td>
                            <td>
                                <p>${ebook.bookname}</p>
                            </td>
                            <td>
                                <p>${ebook.author}</p>
                            </td>
                            <td class="five">
                                <p>${ebook.press}</p>
                            </td>
                            <td>
                                <p>${ebook.isbn}</p>
                            </td>
                            <td>
                                <p>${ebook.introduction}</p>
                            </td>
                            <td class="eight">
                                <p>${ebook.download}</p>
                            </td>
                            <td>
                                <span class="update">
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#updateEbook" onclick="updateEbook(${ebook.id})">修改</button>
                                </span>
                                <span class="delete">
                                    <a href="/AdminDeleteEbookServlet?id=${ebook.id}" class="btn btn-danger">删除</a>
                                </span>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
    </div>
    <%--updateEbookModal--%>
    <div class="modal fade" id="updateEbook" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改电子书信息</h4>
                </div>
                <div class="modal-body">
                    <form role = "form" action="/AdminEbookUpdateConfirmServlet" id="updateForm" method="post" enctype="multipart/form-data">
                        <input type="text" class="form-control" id="bookId" name="bookId" style="display: none;">
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label for="updateBookName" class="control-label">电子书名</label>
                                <input type="text" class="form-control" id="updateBookName" name="updateBookName">
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="updateAuthor" class="control-label">作者</label>
                                <input type="text" class="form-control" id="updateAuthor" name="updateAuthor">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label for="updatePress" class="control-label">出版社</label>
                                <input type="text" class="form-control" id="updatePress" name="updatePress">
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="updateISBN" class="control-label">ISBN</label>
                                <input type="text" class="form-control" id="updateISBN" name="updateISBN">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-12">
                                <label for="updateIntroduction" class="control-label">介绍</label>
                                <textarea class="form-control" id="updateIntroduction" rows="4" name="updateIntroduction"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label for="updateImage" class="control-label">电子书图片</label>
                                <input type="file" id="updateImage" name="updateImage">推荐尺寸: 540 * 678
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="updateFile" class="control-label">电子书文件</label>
                                <input type="file" id="updateFile" name="updateFile">选择电子书文件
                            </div>
                        </div>
                        <div class="row" >
                            <div style="padding-right: 15px;padding-left: 15px; float: right">
                                <button type="submit" class="btn btn-primary">修改</button>
                            </div>
                            <div style="float: right">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    //请求一个servlet，将电子书信息先写进修改模态框中的表单中
    function updateEbook(id){
        $.ajax({
            type:'get',
            dataType: 'json',
            url:'/AdminEbookUpdateServlet',
            data:{"id":id},
            success(data){
                $("#bookId").val(data.updateEbook.id);
                $("#updateBookName").val(data.updateEbook.bookname);
                $("#updateAuthor").val(data.updateEbook.author);
                $("#updatePress").val(data.updateEbook.press);
                $("#updateISBN").val(data.updateEbook.isbn);
                $("#updateIntroduction").val(data.updateEbook.introduction);
            },
            error:function (){
                alert("出错了")
            }
        })
    }
</script>

</html>
