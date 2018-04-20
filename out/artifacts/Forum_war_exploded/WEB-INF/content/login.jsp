<%@ page import="org.springframework.validation.Errors" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/13
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>账户登录</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/all.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin ">

    <div class="layui-header">
        <div class="layui-logo">CMBB</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/">博客</a></li>
            <li class="layui-nav-item"><a href="/tribune">论坛</a></li>
            <li class="layui-nav-item"><a href="/resource">资源</a></li>
        </ul>

    </div>
    <div class="layui-row">
        <div class="layui-col-lg6 layui-col-xs6 layui-col-md6" style="text-align: right"><img src="../../img/img5.jpg"
                                                                                              style="margin-top: 205px;height: 300px">
        </div>
        <div class="layui-col-lg6 layui-col-xs6 layui-col-md6">
            <div style="background-color: #FFFFFF;width: 450px;padding: 53px 0px 53px 0px;border-radius: 5px ;margin-top: 205px;">
                <%--<form class="layui-form" action="">--%>
                <form:form cssClass="layui-form" modelAttribute="user" action="/login" method="post">
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <%--<input type="text" class="layui-input" placeholder="请输入用户名" autocomplete="off"style="width: 240px;">--%>
                            <form:input path="username" cssClass="layui-input" placeholder="请输入用户名" autocomplete="off" cssStyle="width: 240px;"/>
                            <div>&nbsp<form:errors path="username" cssStyle="color: red"/></div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <%--<input type="password" class="layui-input" placeholder="请输入密码" autocomplete="off"style="width: 240px;">--%>
                            <form:password path="password" cssClass="layui-input" placeholder="请输入密码" autocomplete="off" cssStyle="width: 240px;"/>
                           <div>&nbsp</div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" type="submit" style="width: 240px">登录</button>
                        </div>
                    </div>
                </form:form>
                <%--</form>--%>
                <div style="float: right;margin-right: 25px;margin-top: 25px">还没有账号? <a href="/register"
                                                                                        style="color: #01AAED">立即注册</a>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer" style="width: 1000px">
        ©2017-2018 WANGWEV版权所有
        &nbsp
        吉ICP备17008925号
    </div>
</div>


<script src="../../layui/layui.js"></script>
<script>

</script>
</body>
</html>
