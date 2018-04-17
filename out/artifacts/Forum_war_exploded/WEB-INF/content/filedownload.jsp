<%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/13
  Time: 20:01
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
            <div class="write-backgroud" style="padding: 25px 15px 25px 35px;margin-top: 10px">
                <div style="font-size: 20px">Java数据结构和算法</div>
                <div class="layui-row" style="margin-top: 5px">
                    <div class="layui-col-lg3" style="margin-left: 30px">上传时间:2018-02-25</div>
                    <div class="layui-col-lg4">大小:20MB</div>
                </div>
                <blockquote class="layui-elem-quote">Java数据结构和算法，超级全面，第二版，Data Structures & Algorithms in JAVA
                </blockquote>
                <div class="layui-row">
                    <div class="layui-col-lg11" style="font-size: 20px">下载数:<span style="color: #D15FEE">50</span></div>
                    <div class="layui-col-lg1">
                        <button class="layui-btn layui-bg-red">下载</button>
                    </div>
                </div>
            </div>
            <div style="background-color: #f6f6f6;height: 10px">

            </div>
            <div style=" background-color: #FFFFFF;padding: 20px 20px 5px 20px" class="critic">
                <div>
                    <img src="../../img/img1.jpg" class="layui-circle" style="width: 30px;height: 30px"><a href="#"
                                                                                                           style="margin-left: 10px">weiwei</a><span
                        style="margin-left: 25px;">2017年12月2日</span>
                    <div style="margin-left: 30px">
                        现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？
                    </div>
                    <hr class="layui-bg-gray">
                </div>
                <div>
                    <img src="../../img/img1.jpg" class="layui-circle" style="width: 30px;height: 30px"><a href="#"
                                                                                                           style="margin-left: 10px">weiwei</a><span
                        style="margin-left: 25px;">2017年12月2日</span>
                    <div style="margin-left: 30px">
                        现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？
                    </div>
                    <hr class="layui-bg-gray">
                </div>
                <div>
                    <img src="../../img/img1.jpg" class="layui-circle" style="width: 30px;height: 30px"><a href="#"
                                                                                                           style="margin-left: 10px">weiwei</a><span
                        style="margin-left: 25px;">2017年12月2日</span>
                    <div style="margin-left: 30px">
                        现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？
                    </div>
                    <hr class="layui-bg-gray">
                </div>
            </div>
        </div>
        <div class="layui-col-lg2">
            <div style="margin-left: 15px;margin-top: 10px; padding: 25px" class="write-backgroud">
                <div class="layui-row" style="text-align: center">
                    <div><img src="../../img/img1.jpg" style="height:105px;width:105px" class="layui-circle"></div>
                    <div><a href="index.jsp" style="font-size: 20px">隔壁老王</a></div>
                    <div style="font-size: 12px">资源数量:<span>12</span></div>
                </div>
                <div style="text-align: center;">
                    <button class="layui-btn" style="margin-top: 5px">关注</button>
                </div>
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
        <div class="layui-col-lg2"></div>
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
