<%@ page import="cn.jlsysql.entity.Forum" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.jlsysql.entity.ForumComment" %>
<%@ page import="cn.jlsysql.entity.Comment" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/14
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Forum forum = (Forum) request.getAttribute("forum");
%>
<html>
<head>
    <title><%=forum.getContent()%></title>
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

    <!--header end-->
    <div class="layui-row" style="margin-top: 10px;min-height: 643px">
        <div class="layui-col-lg2">&nbsp;</div>
        <div class="layui-col-lg8">
            <div class="write-backgroud">
                <div style="padding: 15px;margin-left: 15px" class="layui-row">
                    <div class="layui-col-lg9">
                        <%--<h1><%=forum.getTitle()%></h1>--%>
                        <h1><%=forum.getContent()%></h1>
                    </div>
                </div>
                <hr class="layui-bg-gray">
            </div>
            <%
                List<ForumComment> comments = forum.getComment();
                for (int i = 0; i < comments.size(); i++) {
            %>
            <div style="background-color: #f6f6f6;height: 5px"></div>
            <div style=" background-color: #FFFFFF;" class="critic">
                <div>
                    <div class="layui-row">
                        <div class="layui-col-lg1" style="text-align: center">
                            <div><img src="../../img/userimg/<%=comments.get(i).getAuthor().getImg()%>"
                                      class="layui-circle" style="width: 30px;height: 30px"></div>
                            <div><a href="#" style="margin-left: 10px"><%=comments.get(i).getAuthor().getNickname()%>
                            </a></div>
                        </div>
                        <div class="layui-col-lg10">
                            <div>
                                <%=comments.get(i).getContent()%>
                            </div>
                            <div style="margin-top: 15px" class="layui-row">
                                <div class="layui-col-lg5"><%=comments.get(i).getTime()%>
                                </div>
                                <div class="layui-col-lg6"><i
                                        class="layui-icon">&#xe6c6;</i><%=comments.get(i).getPraise()%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
                ;
            %>
            <div style="height: 160px;background-color: #FFFFFF;margin-top: 5px;padding: 15px 15px 15px 15px">

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <textarea class="layui-input comment-text" style="height: 105px"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">&nbsp;</label>
                    <button class="layui-btn" onclick="comment()">提交回复</button>
                </div>

            </div>
        </div>
        <div class="layui-col-lg2">&nbsp;</div>
    </div>
    <div class="layui-bg-black" style="height: 45px">
        <br>
        <div class="layui-row" style="margin-top: -5px">
            <div class="layui-col-lg4">&nbsp</div>
            <div class="layui-col-lg2">©2017-2018 WANGWEV版权所有</div>
            <div class="layui-col-lg2">吉ICP备17008925号</div>
        </div>


    </div>

</div>
<script src="/bootstrap/jquery.js" charset="UTF-8"></script>
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

    function comment() {
        var str = $(".comment-text").val();
        $.ajax({
            type: "post",
            url: "/addcomment",
            data: {
                data: str,
                id:<%=forum.getId()%>
            },
            success: function (result) {
                location.reload();
            }
        });
        return true;
    }
</script>
</body>
</html>

