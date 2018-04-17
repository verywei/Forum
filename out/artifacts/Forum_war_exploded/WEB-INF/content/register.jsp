<%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/13
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>注册账号</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/all.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin ">
    <div class="layui-row">
        <div class="layui-col-lg5 layui-col-xs5 layui-col-md5"><img src="../../img/img4.jpg"
                                                                    style="width: 400px;height: 780px"></div>
        <div class="layui-col-lg7 layui-col-xs7 layui-col-md5">
            <div style="margin-top: 145px">
                <h1>欢迎注册</h1>
            </div>
            <div style="margin-top: 45px">
                <form:form modelAttribute="user" method="post" action="register" cssClass="layui-form">
                    <div class="layui-form-item" style="width: 350px">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <%--<input type="text" class="layui-input" >--%>
                            <form:input path="username" cssClass="layui-input" placeholder="请输入用户名" autocomplete="off" />
                            <form:errors path="username" cssStyle="color: red"/>
                        </div>
                    </div>
                    <div class="layui-form-item" style="width: 350px;">
                        <label class="layui-form-label">密码</label>
                        <div class="layui-input-block">
                            <%--<input type="password" class="layui-input" >--%>
                            <form:password path="password" cssClass="layui-input" placeholder="请输入密码" autocomplete="off"/>
                            <form:errors path="password" cssStyle="color: red"/>
                        </div>
                    </div>
                    <div class="layui-form-item" style="width: 350px;">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-block">
                            <%--<input type="password" class="layui-input" placeholder="请输入密码" autocomplete="off">--%>
                            <form:password path="confirmpass" cssClass="layui-input" placeholder="请输入密码" autocomplete="off"/>
                            <form:errors path="confirmpass" cssStyle="color: red"/>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" type="reset">重置</button>
                            <button class="layui-btn" type="submit" style="margin-left: 95px;">注册</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <div class="layui-footer" style="width: 1200px;margin-left: 200px">
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
