<%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/14
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/all.css">
    <style>
        .content {
            font-size: 17px;
            padding: 25px;
        }

        .critic div {
            padding: 5px;
            margin-left: 5px;
        }
    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!--header-->
    <%@include file="part/header.jsp"%>
    <!--header end-->
    <div class="layui-row" style="margin-top: 10px">
        <div class="layui-col-lg2">&nbsp;</div>
        <div class="layui-col-lg8">
            <div class="write-backgroud">
                <div style="padding: 15px;margin-left: 15px" class="layui-row">
                    <div class="layui-col-lg9"><h1>思考：为什么要用Spring</h1></div>
                    <div class="layui-col-lg3" style="text-align: right"><button class="layui-btn">我要跟贴</button></div>
                </div>
                <hr class="layui-bg-gray">
            </div>
            <div style="background-color: #f6f6f6;height: 15px"></div>
            <div style=" background-color: #FFFFFF;" class="critic">
                <div>
                    <div class="layui-row">
                        <div class="layui-col-lg1" style="text-align: center">
                            <div><img src="../../img/img1.jpg" class="layui-circle" style="width: 30px;height: 30px"></div>
                            <div><a href="#" style="margin-left: 10px">weiwei</a></div>
                        </div>
                        <div class="layui-col-lg10">
                            <div>
                                现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？
                                现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？
                                现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？
                            </div>
                            <div style="margin-top: 15px" class="layui-row">
                                <div class="layui-col-lg5">2015-12-12 12:20</div>
                                <div class="layui-col-lg6"><i class="layui-icon">&#xe6c6;</i>15</div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%
                for (int i = 0; i < 5; i++) {
            %>
            <div style="background-color: #f6f6f6;height: 5px"></div>
            <div style=" background-color: #FFFFFF;" class="critic">
                <div>
                    <div class="layui-row">
                        <div class="layui-col-lg1" style="text-align: center">
                            <div><img src="../../img/img1.jpg" class="layui-circle" style="width: 30px;height: 30px"></div>
                            <div><a href="#" style="margin-left: 10px">weiwei</a></div>
                        </div>
                        <div class="layui-col-lg10">
                            <div>
                                现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？
                                现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？
                                现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？
                            </div>
                            <div style="margin-top: 15px" class="layui-row">
                                <div class="layui-col-lg5">2015-12-12 12:20</div>
                                <div class="layui-col-lg6"><i class="layui-icon">&#xe6c6;</i>15</div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <%
                }
                ;
            %>
        </div>
        <div class="layui-col-lg2">&nbsp;</div>
    </div>
    <div class="layui-bg-black" style="height: 45px">
        <br>
        <div class="layui-row" style="margin-top: -5px" >
            <div class="layui-col-lg4">&nbsp</div>
            <div class="layui-col-lg2">©2017-2018 WANGWEV版权所有</div>
            <div class="layui-col-lg2">吉ICP备17008925号</div>
        </div>


    </div>

</div>

<script src="../../layui/layui.js"></script>
<script>
    layui.use(['element', 'carousel'], function () {
        var element = layui.element;
        var carousel = layui.carousel
        carousel.render({
            elem: '#test1'
            , arrow: 'hover'
            , width: '295px'
            , height: '150px'
        });

    });
</script>
</body>
</html>

