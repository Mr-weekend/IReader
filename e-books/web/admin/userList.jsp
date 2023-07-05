<%--
  Created by IntelliJ IDEA.
  User: mr.weekend
  Date: 2023/6/2
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>用户管理</title>
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
            <form class="navbar-form" action="adminUserSearch" method="get">
                <div class="input-group">
                    <input type="text" class="form-control" id="keyword" placeholder="用户名" name="keyword" required="required">
                    <span class="input-group-btn">
            <button type="submit" class="btn btn-default">搜索用户</button>
          </span>
                </div>
            </form>
        </div>
        <div class="col-lg-3">
            <span>共拥有用户</span>
            ${sum}
            <span>人</span>
        </div>
    </div>
    <div class="row">
        <table class="table table-bordered table-hover table-condensed" >
            <thead>
            <tr>
                <th class="td1">ID</th>
                <th class="td2">用户名</th>
                <th class="td3">密码</th>
                <th class="td4">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${not empty user}">
                <c:forEach var="user" items="${user}">
                    <tr>
                        <td>
                            <p>${user.id}</p>
                        </td>
                        <td>
                            <p>${user.username}</p>
                        </td>
                        <td>
                            <p>${user.userPassword}</p>
                        </td>
                        <td>
                                <span class="update">
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#updateUser" onclick="updateUser(${user.id})">修改</button>
                                </span>
                            <span class="delete">
                                    <a href="/AdminUserDeleteServlet?id=${user.id}" class="btn btn-danger">删除</a>
                                </span>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
    </div>
    <%--updateUserModal--%>
    <div class="modal fade" id="updateUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改用户信息</h4>
                </div>
                <div class="modal-body">
                    <form role = "form" action="/AdminUserUpdateConfirmServlet" id="updateForm" method="post">
                        <input type="text" class="form-control" id="userId" name="userId" style="display: none;">
                        <div class="row">
                            <div class="form-group col-lg-6">
                                <label for="updateUserPassword" class="control-label">用户名</label>
                                <input type="text" class="form-control" id="showUserName" name="updateUserName" readonly="readonly">
                            </div>
                            <div class="form-group col-lg-6">
                                <label for="updateUserPassword" class="control-label">密码</label>
                                <input type="text" class="form-control" id="updateUserPassword" name="updateUserPassword">
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
<script>
    function updateUser(id){
        $.ajax({
            type:'get',
            dataType: 'json',
            url:'/AdminUserUpdateServlet',
            data:{"id":id},
            success(data){
                $("#userId").val(data.updateUser.id);
                $("#showUserName").val(data.updateUser.username);
                $("#updateUserPassword").val(data.updateUser.userPassword);
            },
            error:function (){
                alert("出错了")
            }
        })
    }
</script>

</body>
</html>
