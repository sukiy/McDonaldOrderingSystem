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
    <link rel="stylesheet" href="layui/css/layui.css">
    <style>
        .mydiv{
            border: 1px solid #5FB878;
            width: 350px;
            margin: 180px auto;
            border-radius: 5px;
            box-shadow: gray 0px 0px 10px;
        }
    </style>
</head>
<body>
<form class="layui-form" id="myform">
    <div class="mydiv">
        <center><h2>用户登录</h2><br></center>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">工号</label>
                <div class="layui-input-inline">
                    <input name="job_num" class="layui-input">
                </div>
            </div><br>
            <div class="layui-inline">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input name="job_pwd" type="password" class="layui-input"><br>
                    <input type="button" value="登录" class="layui-btn" onclick="check()">
                </div>
            </div>
        </div>
    </div>
</form>
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
                 alert("用户名或密码错误");
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

