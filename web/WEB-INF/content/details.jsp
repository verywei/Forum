<%@ page import="cn.jlsysql.entity.Blog" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParsePosition" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.jlsysql.entity.Comment" %>
<%@ page import="cn.jlsysql.util.Kind" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/13
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Blog blog = (Blog) request.getAttribute("blog");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    ParsePosition parsePosition = new ParsePosition(0);
    Date date = dateFormat.parse(blog.getTime(), parsePosition);
%>
<html>
<head>
    <title><%=blog.getTitle()%>
    </title>
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
    <%@include file="part/header.jsp" %>

    <div class="layui-row" style="margin-top: 10px">
        <div class="layui-col-lg1">&nbsp;</div>
        <div class="layui-col-lg7">
            <div class="write-backgroud">
                <div style="padding: 15px;margin-left: 15px">
                    <h1><%=blog.getTitle()%>
                    </h1>
                    <div class="layui-row" style="margin-top: 15px;margin-left: 15px">
                        <div class="layui-col-lg3 " style="color: #9F9F9F;"><%=dateFormat.format(date)%>
                        </div>
                        <div class="layui-col-lg7"><%=Kind.getKind1(Integer.parseInt(blog.getKind())).getName()%>
                        </div>
                        <div class="layui-col-lg2" style="color: #9F9F9F"><i
                                class="layui-icon">&#xe705;</i> <%=blog.getVisit()%>
                        </div>
                    </div>
                </div>
                <hr class="layui-bg-gray">
                <div class="content">
                    <%=blog.getContent()%>
                </div>
            </div>
            <div style="background-color: #f6f6f6;height: 15px">

            </div>
            <div style=" background-color: #FFFFFF;padding: 20px 20px 5px 20px" class="critic">
                <%
                    if (((User)session.getAttribute("user"))!=null){
                %>
                <form class="layui-form">
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <button class="layui-btn" style="float: right">提交评论</button>
                    </div>
                </form>
                <%
                    }else {
                %>
                <div style="text-align: center ;padding: 0px 0px 15px 0px">您还没有登录，请<a href="/login" style="color: #1E9FFF"> [登录]</a></div>
                <%
                    }
                %>

                <%
                    List<Comment> comments = blog.getComments();
                    for (int i = 0; i < comments.size(); i++) {
                        ParsePosition parsePosition1 = new ParsePosition(0);
                        Date date1 = dateFormat.parse(comments.get(i).getTime(), parsePosition1);
                %>
                <hr class="layui-bg-gray">
                <div>
                    <img src="../../img/userimg/<%=comments.get(i).getAuthor().getImg()%>" class="layui-circle"  style="width: 30px;height: 30px"><a href="#" style="margin-left: 10px"><%=comments.get(i).getAuthor().getNickname()%></a>
                    <span style="margin-left: 25px;"><%=dateFormat.format(date1)%></span>
                    <div style="margin-left: 30px">
                        <%=comments.get(i).getContent()%>
                    </div>
                    <hr class="layui-bg-gray">
                </div>
                <%
                    }
                    ;
                %>
            </div>
        </div>
        <div class="layui-col-lg2">
            <div style="margin-left: 15px;padding: 25px" class="write-backgroud">
                <div class="layui-row">
                    <div class="layui-col-lg5"><img src="../../img/userimg/<%=blog.getAuthor().getImg()%>"
                                                    style="height:65px;width: 65px"
                                                    class="layui-circle"></div>
                    <div class="layui-col-lg7">
                        <a href="index.jsp" style="font-size: 20px"><%=blog.getAuthor().getNickname()%>
                        </a>
                        <%
                            boolean canFollow = (boolean) request.getAttribute("canfollow");
                            if (canFollow&&session.getAttribute("user")!=null) {
                        %>
                        <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                            <button class="layui-btn layui-btn-normal" id="focus" style="margin-top: 5px"
                                    onclick="ssss()">关注
                            </button>
                        </div>
                        <%
                        } else {
                        %>
                        <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">
                            <button class="layui-btn layui-btn-normal layui-btn-disabled" style="margin-top: 5px">关注
                            </button>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <div style="margin-top: 10px;padding: 12px;margin-left: 15px" class="write-backgroud">
                <div style="padding: 15px 5px"><span
                        style="width: 1px;height: 15px;background-color: #FD482C">&nbsp;</span>
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
        <div class="layui-col-lg1"></div>
    </div>


</div>
<script src="/bootstrap/jquery.js" charset="UTF-8"></script>
<script src="/layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
        var carousel = layui.carousel;
        carousel.render({
            elem: '#test1'
            , arrow: 'hover'
            , width: '295px'
            , height: '150px'
        });
    });

    function ssss() {
        $.ajax({
            type: "post",
            url: "/focus?followed=<%=blog.getAuthor().getId()%>",
            success: function (result) {
                if (result == 'ok') {
                    $("#focus").addClass(" layui-btn-disabled ")
                }
            }
        })
    }
</script>
</body>
</html>
