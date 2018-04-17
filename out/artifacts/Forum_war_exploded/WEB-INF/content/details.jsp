<%@ page import="cn.jlsysql.entity.Blog" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParsePosition" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.jlsysql.entity.Comment" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/13
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Blog blog= (Blog) request.getAttribute("blog");
    SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
    ParsePosition parsePosition=new ParsePosition(0);
    Date date=dateFormat.parse(blog.getTime(),parsePosition);
%>
<html>
<head>
    <title><%=blog.getTitle()%></title>
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
<body >
<div class="layui-layout layui-layout-admin">
    <!--header-->
    <%@include file="part/header.jsp"%>

    <div class="layui-row" style="margin-top: 10px">
        <div class="layui-col-lg1">&nbsp;</div>
        <div class="layui-col-lg7">
            <div class="write-backgroud">
                <div style="padding: 15px;margin-left: 15px">
                    <h1><%=blog.getTitle()%></h1>
                    <div class="layui-row" style="margin-top: 15px;margin-left: 15px">
                        <div class="layui-col-lg3 " style="color: #9F9F9F;"><%=dateFormat.format(date)%></div>
                        <div class="layui-col-lg7">框架</div>
                        <div class="layui-col-lg2" style="color: #9F9F9F"><i class="layui-icon">&#xe705;</i> <%=blog.getVisit()%></div>
                    </div>
                </div>
                <hr class="layui-bg-gray">
                <div class="content">
                    <%--<h2>spring带来了什么？</h2>--%>
                    <%--<p>说到Spring肯定离不开它的两大特性AOP和IOC</p>--%>
                    <%--<p>IOC：把我们的类上交，由Spring来进行统一的管理和配置，在需要使用的地方注入。好处是减少了各个类之间的相互依赖，依赖控制交给Spring管理。</p>--%>
                    <%--<p> AOP：封装了jdk和cglib的动态代理，结合IOC提供了更方便的增强类的方法。</p>--%>
                    <%--<h2> 没有Spring会怎么样？</h2>--%>
                    <%--<p> 想知道为什么使用，最好的办法就是想想如果没有会怎样，没有手机、没有电脑、没有操作系统……。没有Spring框架。</p>--%>
                    <%--<p>--%>
                        <%--如果没有Spring，我们不得不在使用每个类之前，实例化一个对象。当然我们可以用工厂方法来做这件事，就可以集中管理并且让调用者和被调用者之间的耦合更松散。于是需要大量的工厂类，并且在增加或改变接口实现的时候，还需要对工厂进行调整。而Spring就像一个大工厂一样，使用了大量的反射机制来生成需要实例的对象。</p>--%>
                    <%--<p>--%>
                        <%--除此之外Spring还带来了强大的代理，我们使用的每个注入的对象都是经过代理的增强对象，同时可以使用aop包来定义一些与业务逻辑不相关的切面。增强功能模块的内聚，拆分功能模块和非业务模块。而AOP又是建立在IOP基础之上，因此如果没有Spring，功能模块和非功能模块混在一起，导致逻辑混乱不清晰。</p>--%>
                    <%--<h2>为什么要用Spring</h2>--%>
                    <%--<p>--%>
                        <%--现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？--%>
                    <%--</p>--%>
                    <%=blog.getContent()%>
                </div>
            </div>
            <div style="background-color: #f6f6f6;height: 15px">

            </div>
            <div style=" background-color: #FFFFFF;padding: 20px 20px 5px 20px" class="critic">
                <%
                    List<Comment> comments=blog.getComments();
                    for (int i=0;i<comments.size();i++){
                        ParsePosition parsePosition1=new ParsePosition(0);
                        Date date1=dateFormat.parse(comments.get(i).getTime(),parsePosition1);
                %>
                <div>
                    <img src="../../img/userimg/<%=comments.get(i).getAuthor().getImg()%>" class="layui-circle" style="width: 30px;height: 30px"><a href="#"
                                                                                                           style="margin-left: 10px"><%=comments.get(i).getAuthor().getNickname()%></a><span
                        style="margin-left: 25px;"><%=dateFormat.format(date1)%></span>
                    <div style="margin-left: 30px">
                        <%=comments.get(i).getContent()%>
                    </div>
                    <hr class="layui-bg-gray">
                </div>
                <%
                    };
                %>
                <%--<div>--%>
                    <%--<img src="../../img/img1.jpg" class="layui-circle" style="width: 30px;height: 30px"><a href="#"--%>
                                                                                                           <%--style="margin-left: 10px">weiwei</a><span--%>
                        <%--style="margin-left: 25px;">2017年12月2日</span>--%>
                    <%--<div style="margin-left: 30px">--%>
                        <%--现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？--%>
                    <%--</div>--%>
                    <%--<hr class="layui-bg-gray">--%>
                <%--</div>--%>
                <%--<div>--%>
                    <%--<img src="../../img/img1.jpg" class="layui-circle" style="width: 30px;height: 30px"><a href="#"--%>
                                                                                                           <%--style="margin-left: 10px">weiwei</a><span--%>
                        <%--style="margin-left: 25px;">2017年12月2日</span>--%>
                    <%--<div style="margin-left: 30px">--%>
                        <%--现在已经很清晰了，用Spring可以让各个模块耦合更松散，可以在业务逻辑之外进行增强代理，实现非业务功能。所以就算没了Spring，也会有类似的其他框架来实现这些目的，而现在Spring的生态比较大，社区又比较活跃，为什么不用呢？--%>
                    <%--</div>--%>
                    <%--<hr class="layui-bg-gray">--%>
                <%--</div>--%>
            </div>
        </div>
        <div class="layui-col-lg2">
            <div style="margin-left: 15px;padding: 25px" class="write-backgroud">
                <div class="layui-row">
                    <div class="layui-col-lg5"><img src="../../img/userimg/<%=blog.getAuthor().getImg()%>" style="height:65px;width: 65px"
                                                    class="layui-circle"></div>
                    <div class="layui-col-lg7">
                        <a href="index.jsp" style="font-size: 20px"><%=blog.getAuthor().getNickname()%></a>
                        <button class="layui-btn" style="margin-top: 5px">关注</button>
                    </div>
                </div>
            </div>
            <div style="margin-top: 10px;padding: 12px;margin-left: 15px" class="write-backgroud">
                <div style="padding: 15px 5px"><span style="width: 1px;height: 15px;background-color: #FD482C">&nbsp;</span>
                    博主其他文章<a href="index.jsp" style="float: right;color: #1E9FFF">更多</a>
                </div>
                <ul style="margin-top: -15px">
                    <%
                        for (int i = 0; i < 5; i++) {
                    %>
                    <li style="margin-top: 15px">
                        <a href="/details/2">如何用分片技术把7笔/秒的区块链交易提升到2488笔/秒</a>
                    </li>
                    <%
                        }
                        ;
                    %>
                </ul>
            </div>
            <div style="background-color:#ffffff;margin-top: 10px;padding: 9px;margin-left: 15px">
                <div style="padding: 15px 20px"><span style="width: 1px;height: 15px;background-color: #FD482C">&nbsp;</span>
                    关于
                </div>
                <div style="padding: 20px">
                    ©2017-2018 WANGWEV版权所有<br>
                    吉ICP备17008925号
                </div>
            </div>
        </div>
        <div class="layui-col-lg1"> </div>
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
