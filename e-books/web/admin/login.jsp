<%--
  Created by IntelliJ IDEA.
  User: xiong
  Date: 2022/8/9
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>悦读乐园-后台登录</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script src="/js/jquery-3.6.3.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/css/toastr.min.css">
    <script src="/js/toastr.min.js">
    </script>
    <style>
        body {
            background-size: 100% auto;
            background-image: linear-gradient(to bottom right,#4092e0,#25d1a4);
        }
        .toast-center-center {
            top: 30%;
            left: 50%;
            margin-top: -25px;
            margin-left: -150px;
        }
        * {
            padding: 0;
            margin: 0;
        }
        .login-box {
            margin: 0 auto;
            padding-left: 25px;
            padding-right: 25px;
            padding-top: 15px;
            width: 350px;
            height: 300px;
            background: #FFFFFF;
            /*以下css用于让登录表单垂直居中在界面,可删除*/
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -175px;
            margin-left: -175px;
        }
        .login-box h1 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h1>管理员登录</h1>
        <form class="login-form" onsubmit="login();return false;">
            <div class="input-content">
                <div class="alert alert-danger" style="padding: 8px;margin-bottom: 10px; display: none;">用户名或密码错误！</div>
                <input type="text" placeholder="请输入用户名" name="username" id="username" class="form-control" required>
                <input type="password" placeholder="请输入密码" name="password" id="password" class="form-control" required style="margin-top: 10px;">
            </div>
            <button type="submit" class="btn btn-primary btn-lg btn-block" id="loginButton" style="margin-top: 10px;">登录</button>
        </form>
    </div>
</body>
<script>
    function login(){
        var username = $('#username').val();
        var password = $('#password').val();
        $.ajax({
            url: "${pageContext.request.contextPath}/adminLogin",
            type: "post",
            dataType: "json",
            data: {
                username:username,
                password:password
            },
            success:function (data){
                if (data.status){
                    window.location.href = "/admin/index.jsp";
                }else{
                    toastr.error("用户名或密码错误！");
                }
            }
        })
    }
    toastr.options = {
        closeButton: false,
        debug: false,
        progressBar: true,
        positionClass: "toast-center-center",
        onclick: null,
        showDuration: "300",
        hideDuration: "1000",
        timeOut: "2000",
        extendedTimeOut: "1000",
        showEasing: "swing",
        hideEasing: "linear",
        showMethod: "fadeIn",
        hideMethod: "fadeOut"
    };
</script>
</html>
