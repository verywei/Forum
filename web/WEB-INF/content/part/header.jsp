<%@ page import="cn.jlsysql.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/14
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user= (User) session.getAttribute("user");
%>
<div class="layui-header">
    <div class="layui-logo">CMBB</div>
    <ul class="layui-nav layui-layout-left">
        <li class="layui-nav-item"><a href="/">博客</a></li>
        <li class="layui-nav-item"><a href="/tribune">论坛</a></li>
        <li class="layui-nav-item"><a href="/resource">资源</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
        <%
            if (user!=null){
        %>
        <li class="layui-nav-item"><a href="/addblog">写博客</a></li>
        <li class="layui-nav-item">
            <a href="javascript:;">
                <img src="/img/userimg/<%=user.getImg()%>" class="layui-nav-img">
                <%=user.getNickname()%>
            </a>
            <dl class="layui-nav-child">
                <dd><a href="/myblog">我的博客</a></dd>
                <dd><a href="/usersetting">账号设置</a></dd>
                <dd><a href="/logout">退出</a></dd>
            </dl>
        </li>
        <%
        }else {
        %>
        <li class="layui-nav-item">
            <a href="/login">登录</a>
        </li>
        <%
            }
        %>
    </ul>
</div>
