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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <style>
        .mydiv{
            border: 1px solid white;
            width: 380px;
            margin: 150px 800px;
            border-radius: 5px;
            box-shadow: gray 0px 0px 10px;
            padding: 10px;
            background-color: white;
        }

        body{
            background:url('image/login3.jpg')no-repeat;
            width:100%;
            height:100%;
            background-size:100% 100%;
            position: absolute;
          }
    </style>
</head>
<body>
<%--<form id="myform">
    <div class="mydiv">
        <center><h2>用户登录</h2><br></center>
                   工号：<input name="job_num"><br>
                   密码：<input name="job_pwd" type="password"><br>
                    <input type="button" value="登录" onclick="check()">

    </div>
</form>--%>
<div class="mydiv">
    <h2>用户登录</h2><br>
    <form class="form-horizontal" id="myform">
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">工号</label>
            <div class="col-sm-10">
                <input class="form-control" id="inputEmail3" name="job_num">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword3" name="job_pwd">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> 记住密码
                    </label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="button" value="登录" class="btn btn-default" onclick="check()">
            </div>
        </div>
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
             if (res && res==1){
                 window.location.href="${pageContext.request.contextPath}/administrators.jsp";
             }else if (res && res==2){
                 window.location.href="${pageContext.request.contextPath}/main.jsp";
             }else if(res && res==3){
                 window.location.href="${pageContext.request.contextPath}/manager.jsp";
             }else {
                 alert("用户名或密码错误");
                 window.location.href="${pageContext.request.contextPath}/index.jsp";
             }
         },
         error:function () {
             alert("网络繁忙");
         }
     });
   }
</script>

