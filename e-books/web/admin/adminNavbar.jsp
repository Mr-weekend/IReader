<%--
  Created by IntelliJ IDEA.
  User: mr.weekend
  Date: 2023/6/9
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--adminNavbar--%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <ul class="nav navbar-nav navbar-left">
            <li>
                <a href="/admin/index.jsp">
                    <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span> 悦读乐园
                </a>
            </li>
        </ul>
        <p class="navbar-text">后台管理页面</p>
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <a href="/adminEbooks">
                        <span></span>电子书管理
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-left">
                <li>
                    <a href="/adminUser">
                        <span></span>用户管理
                    </a>
                </li>
            </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="navbar-text">欢迎您，管理员：${sessionScope.administrator.adname}</li>
            <li><a href="/adminLogout">退出登录</a></li>
        </ul>
    </div>
</nav>