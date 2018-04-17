<%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/14
  Time: 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/all.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!--header-->
     <%@include file="part/header.jsp"%>
    <!--header end-->
    <div class="layui-row">
        <div class="layui-col-lg1">&nbsp;</div>
        <div class="layui-col-lg7">
            <table class="layui-table">
                <colgroup>
                    <col width="150">
                    <col width="200">
                    <col>
                </colgroup>
                <tbody>
                <%
                    for (int i = 0; i < 15; i++) {
                %>
                <tr style="height: 95px">
                    <td>
                        <div>
                            <div><a href="/topics/<%=i %>" style="margin-left: 15px;font-size: 23px;margin-top: 5px;">spring基础配置.xml</a>
                            </div>
                            <ul style="margin-top: 10px">
                                <li style="display: inline-block;margin-left: 25px;"><a href="#" style="color: #1E9FFF;">框架</a>
                                </li>
                                <li style="display: inline-block;margin-left: 50px;"><a href="#"><i
                                        class="layui-icon" style="size: 11px;">&#xe6af;</i>wwwwww</a></li>
                                <li style="display: inline-block;margin-left: 50px;">2017年4月2日</li>
                            </ul>
                            <div style="float: right;margin-top: -50px">
                                <div style="text-align: center;color: #1E9FFF">25</div>
                                <div>跟帖量</div>
                            </div>
                        </div>
                    </td>
                </tr>
                <%
                    }
                    ;
                %>
                </tbody>
            </table>
        </div>
        <div class="layui-col-lg2">
            <div style="margin-left: 15px;margin-top: 10px; padding: 25px" class="write-backgroud">

                <div style="text-align: center;">
                    <button class="layui-btn" style="margin-top: 5px;width: 150px">我要发贴</button>
                </div>
            </div>
            <div style="background-color:#ffffff;margin: 10px 0px 0px 15px;padding: 9px">
                <div style="padding: 15px 20px"><span style="width: 1px;height: 15px;background-color: #FD482C">&nbsp;</span>
                    热点板块
                </div>
                <ul style="margin-top: -25px;padding: 15px">
                    <%
                        for (int i = 0; i < 10; i++) {
                    %>
                    <li style="margin-top: 15px">
                        <div class="layui-row">
                            <div style="margin-left: 15px" class="layui-col-lg5"><a href="/tribune/classify/<%=i%>">数据库</a></div>
                            <div class="layui-col-lg5" style="text-align:  right">155</div>
                        </div>
                        <hr class="layui-bg-gray">
                    </li>
                    <%
                        }
                        ;
                    %>
                </ul>
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
