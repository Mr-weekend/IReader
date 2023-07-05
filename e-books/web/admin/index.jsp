<%@ page import="dao.AdminDao" %><%--
  Created by IntelliJ IDEA.
  User: mr.weekend
  Date: 2023/6/2
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>悦读乐园后台</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/navbar.css">
</head>
<body>
<jsp:include page="adminNavbar.jsp"></jsp:include>
<div class="container">
    <div style="margin-top: 60px"></div>
    <div class="alert alert-success" role="alert" style="width: 1170px;margin: 0 auto;">
        尊敬的管理员，请点击导航栏进行管理！
    </div>
</div>
</body>
</html>
