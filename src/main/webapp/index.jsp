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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>
<body>
<div style="width:250px;margin: 150px auto">
    <h2>用户登录</h2>
    <form id="myform">
              <input type="">
        工号：<input name="job_num"><br>
        密码：<input name="job_pwd" type="password"><br>
        <input type="button" value="登录" onclick="check()">
    </form>
</div>
</body>
</html>
<script type="text/javascript">
   function check() {
    var parm=$("#myform").serialize();
     $.ajax({
         url:"${pageContext.request.contextPath}/usersAction/doLogin",
         data:parm,
         type:"post",
         async:true,
         success:function (res) {
             if (res && res=="index"){
                 window.location.href="${pageContext.request.contextPath}/index.jsp";
             }else {
                 window.location.href="${pageContext.request.contextPath}/main.jsp";
             }
         },
         error:function () {
             alert("网络繁忙");
         }
     });
   }
</script>

