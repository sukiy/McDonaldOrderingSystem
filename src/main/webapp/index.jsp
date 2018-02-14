<%--
  Created by IntelliJ IDEA.
  User: Sukiy
  Date: 2018/2/7
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
<c:if test="#parameters.attributeName[0]==0">
    <p>用户名不为空</p>
</c:if>
<div style="width:250px;margin: 150px auto">
    <h2>用户登录</h2>
    <form action="${pageContext.request.contextPath}/usersAction/doLogin" method="post">
        工号：<input name="job_num"><br>
        密码：<input name="job_pwd" type="password"><br>
        <input type="submit" value="登录" onclick="check()">
    </form>
</div>
</body>
</html>

