<%--
  Created by IntelliJ IDEA.
  User: mr.weekend
  Date: 2023/6/9
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--navbar--%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <ul class="nav navbar-nav navbar-left">
            <li>
                <a href="/index">
                    <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span> 悦读乐园
                </a>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <li><a href="#myModal" data-toggle="modal">登录/注册</a></li>
                </c:when>
                <c:otherwise>
                    <li>
                        <span class="navbar-text">
                            欢迎您：${sessionScope.user.username}
                        </span>
                    </li>
                    <li>
                        <a href="/userLogout">退出登录</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>
<div class="modal fade"  id="myModal" aria-labelledby="myModalLabel" aria-hidden="true" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal" aria-hidden="true">&times;</button>
                <div class="icon">
                    <span class="glyphicon glyphicon-tasks"></span>
                    <span>悦读乐园</span>
                </div>
            </div>
            <div class="forms">
                <form id="loginForm" role="form" onsubmit="login();return false;">
                    <div id="registerTittle">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
                        <span>请输入登录信息</span>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-danger" role="alert" id="notExistError">用户名不存在!</div>
                        <div class="alert alert-danger" role="alert" id="error">用户名或密码错误!</div>
                        <input type="text" name="username" id="loginUsername" placeholder="请输入用户名" class="form-control" required="required">
                        <input type="password" name="password"  id="loginPassword" placeholder="请输入密码" class="form-control" required="required" style="margin-top: 10px;">
                    </div>
                    <div class="modal-footer">
                        <div>
                            <button type="submit" class="btn btn-primary btn-lg btn-block" id="loginButton">登录</button>
                        </div>
                        <button class="btn btn-link" type="button" id="registerBtn">没有账号？去注册</button>
                    </div>
                </form>
                <form id="registerForm" role="form" onsubmit="register();return false;">
                    <div id="loginTittle">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
                        <span>请输入注册信息</span>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-danger" role="alert" id="existError">用户名已存在!</div>
                        <input type="text" name="username" id="registerUsername" placeholder="请输入用户名" class="form-control" required="required">
                        <input type="password" name="password" id="registerPassword" placeholder="请输入密码" class="form-control" required="required" style="margin-top: 10px;">
                    </div>
                    <div class="modal-footer">
                        <div>
                            <button type="submit" class="btn btn-primary btn-lg btn-block" id="registerButton">注册</button>
                        </div>
                        <button class="btn btn-link" type="button" id="loginBtn" >已有账号？去登录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    //隐藏注册表单和错误信息
    $('#registerForm').hide()
    $('#notExistError').hide()
    $('#error').hide()
    $('#existError').hide()
    //点击去注册，隐藏登录表单，显示注册表单
    $('#registerBtn').click(function (){
        $('#loginForm').hide()
        $('#registerForm').show()
        //隐藏提示框
        $('#notExistError').hide()
        $('#error').hide()
    })
    //点击去登录，隐藏注册表单，显示登录表单
    $('#loginBtn').click(function (){
        $('#registerForm').hide()
        $('#loginForm').show()
        //隐藏提示框
        $('#existError').hide()
    })
    function login(){
        var username = $('#loginUsername').val();
        var password = $('#loginPassword').val();
        //  ajax异步请求
        $.ajax({
            url: '/login',
            type:"post",
            dataType:"json",
            data:{
                username:username,
                password:password
            },
            success:function (data){
                if (data.success){      //用户名和密码都正确
                    $('#error').hide()
                    window.location.reload()
                }else if(!data.exist){  //用户名不存在
                    setTimeout(function () {
                        $('#error').hide()
                    },2000)
                    // $('#error').hide()
                    $('#notExistError').show()
                    setTimeout(function (){
                        $('#notExistError').hide()
                    },2000)
                }else{                  //用户名或密码错误
                    $('#notExistError').hide()
                    $('#error').show()
                    setTimeout(function () {
                        $('#error').hide()
                    },2000)
                }
            }
        })
    }
    function register(){
        var username = $('#registerUsername').val();
        var password = $('#registerPassword').val();
        //  ajax异步请求
        $.ajax({
            url: '/register',
            type:"post",
            dataType:"json",
            data:{
                username:username,
                password:password
            },
            success:function (data){
                if (data.exist){
                    $('#existError').show()
                }else{
                    $('#existError').hide()
                    window.location.reload()
                }
            }
        })
    }
</script>