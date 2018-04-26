<%@ page import="java.util.List" %>
<%@ page import="cn.jlsysql.entity.Resource" %>
<%@ page import="cn.jlsysql.pojo.LoginUser" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/13
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资源下载</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/all.css">
</head>
<body>
<%
    List<Resource> resources= (List<Resource>) request.getAttribute("resources");
    List<Resource> resources_by_time=(List<Resource>) request.getAttribute("resource_by_time");
%>
<div class="layui-layout layui-layout-admin">
    <!--header-->
    <%@include file="part/header.jsp"%>
    <!--header end-->
    <div class="layui-row">
        <div class="layui-col-lg1">&nbsp;</div>
        <div class="layui-col-lg7">
            <div class="layui-tab">
                <ul class="layui-tab-title" style="background-color: #efefef">
                    <li class="layui-this">热门资源</li>
                    <li>最新上传</li>
                </ul>
                <div class="layui-tab-content write-backgroud">
                    <div class="layui-tab-item layui-show ">
                        <%
                            if (resources!=null){
                            for (Resource resource:resources){
                        %>
                        <div style="padding:  5px 15px 5px 15px">
                            <div><a href="/filedownload/<%=resource.getId()%>" style="margin-left: 15px;font-size: 23px;margin-top: 5px;"><%=resource.getName()%></a>
                            </div>
                            <ul style="margin-top: 10px">
                                </li>
                                <li style="display: inline-block;margin-left: 50px;"><a href="#"><i
                                        class="layui-icon" style="size: 11px;">&#xe6af;</i>上传者:<%=resource.getAuthor().getNickname()%></a></li>
                                <li style="display: inline-block;margin-left: 50px;"><%=resource.getTime()%></li>
                            </ul>
                            <div style="float: right;margin-top: -50px">
                                <div style="text-align: center;color: #1E9FFF;font-size: 20px"><%=resource.getCount()%></div>
                                <div>下载量</div>
                            </div>
                            <hr class="layui-bg-gray"/>
                        </div>
                        <%
                            };
                            }
                        %>

                    </div>
                    <div class="layui-tab-item ">
                     <%
                        if (resources_by_time!=null){
                            for (Resource resource:resources_by_time){
                    %>
                        <div style="padding:  5px 15px 5px 15px">
                            <div><a href="/filedownload/<%=resource.getId()%>" style="margin-left: 15px;font-size: 23px;margin-top: 5px;"><%=resource.getName()%></a>
                            </div>
                            <ul style="margin-top: 10px">
                                </li>
                                <li style="display: inline-block;margin-left: 50px;"><a href="#"><i
                                        class="layui-icon" style="size: 11px;">&#xe6af;</i>上传者:<%=resource.getAuthor().getNickname()%></a></li>
                                <li style="display: inline-block;margin-left: 50px;"><%=resource.getTime()%></li>
                            </ul>
                            <div style="float: right;margin-top: -50px">
                                <div style="text-align: center;color: #1E9FFF;font-size: 20px"><%=resource.getCount()%></div>
                                <div>下载量</div>
                            </div>
                            <hr class="layui-bg-gray"/>
                        </div>
                        <%
                                };
                            }
                        %></div>
                </div>
            </div>
        </div>
        <div class="layui-col-lg2">
            <div style="margin-left: 15px;margin-top: 10px; padding: 25px" class="write-backgroud">
                <%

                    if (user==null){

                %>
                <div style="text-align: center;">
                    <button class="layui-btn" style="margin-top: 5px"><a href="/login">登录</a></button>
                </div>

                <%
                }else {
                %>
                <div class="layui-row" style="text-align: center">
                    <div><img src="../../img/userimg/<%=user.getImg()%>" style="height:105px;width:105px" class="layui-circle"></div>
                    <div><a href="index.jsp" style="font-size: 20px"><%=user.getNickname()%></a></div>
                    <div style="font-size: 12px">资源数量:<span><%=user.getResource_amount()%></span></div>
                </div>
                <div style="text-align: center;">
                    <button class="layui-btn" style="margin-top: 5px"><a href="fileupload">上传资源</a></button>
                </div>
                <%
                    }
                %>
            </div>
            <div style="background-color:#ffffff;margin-top: 10px;padding: 9px;margin-left: 15px">
                <div style="padding: 15px 20px"><span
                        style="width: 1px;height: 15px;background-color: #FD482C">&nbsp;</span>
                    关于
                </div>
                <div style="padding: 20px">
                    ©2017-2018 WANGWEV版权所有<br>
                    吉ICP备17008925号
                </div>
            </div>
        </div>
    </div>


</div>


<script src="../../layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    })
</script>
</body>
</html>
