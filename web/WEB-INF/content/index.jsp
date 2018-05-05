<%@ page import="cn.jlsysql.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.jlsysql.entity.Blog" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.ParsePosition" %>
<%@ page import="cn.jlsysql.util.Kind" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/13
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>come on baby</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/all.css">
    <%--<link rel="stylesheet" href="bootstrap/css/bootstrap.css">--%>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!--header-->
    <%@include file="part/header.jsp" %>
    <!--header end-->
    <div class="layui-main">
        <div class="layui-row">
            <div class="layui-col-lg2" style="text-align: right;">
                <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="demo"
                    style="margin-right: 10px; width: 100px;text-align: center ;display: inline-block">
                    <li class="layui-nav-item layui-nav-itemed"><a href="/classify/0">推荐</a></li>
                    <li class="layui-nav-item"><a href="/classify/1">人工智能</a></li>
                    <li class="layui-nav-item"><a href="/classify/2">大数据</a></li>
                    <li class="layui-nav-item"><a href="/classify/3">区块链</a></li>
                    <li class="layui-nav-item"><a href="/classify/4">数据库</a></li>
                    <li class="layui-nav-item"><a href="/classify/5">前端</a></li>
                    <li class="layui-nav-item"><a href="/classify/6">移动开发</a></li>
                    <li class="layui-nav-item"><a href="/classify/7">物联网</a></li>
                    <li class="layui-nav-item"><a href="/classify/8">运维</a></li>
                    <li class="layui-nav-item"><a href="/classify/9">编程语言</a></li>
                    <li class="layui-nav-item"><a href="/classify/10">架构</a></li>
                    <li class="layui-nav-item"><a href="/classify/11">安全</a></li>
                    <li class="layui-nav-item"><a href="/classify/12">游戏开发</a></li>
                </ul>
            </div>
            <div class="layui-col-lg6">
                <table class="layui-table">
                    <colgroup>
                        <col width="150">
                        <col width="200">
                        <col>
                    </colgroup>
                    <tbody class="addtable">
                    <%
                        List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        ParsePosition pos = new ParsePosition(0);
                        int size=blogs.size();
                        for (int i = 0; i < size; i++) {
                            Date date = dateFormat.parse(blogs.get(i).getTime(), pos);
                    %>
                    <tr style="height: 95px">
                        <td>
                            <div>
                                <div><a href="/details/<%=blogs.get(i).getId()%>"
                                        style="margin-left: 15px;font-size: 23px;margin-top: 5px;"><%=blogs.get(i).getTitle()%>
                                </a>
                                </div>
                                <ul style="margin-top: 10px">
                                    <li style="display: inline-block;margin-left: 25px;"><a href="#" style="color: #1E9FFF;"><%=Kind.getKind1(Integer.parseInt(blogs.get(i).getKind())).getName()%>
                                    </a>
                                    </li>
                                    <li style="display: inline-block;margin-left: 50px;"><a href="#"><i
                                            class="layui-icon"
                                            style="size: 11px;">&#xe6af;</i><%=blogs.get(i).getAuthor().getNickname()%>
                                    </a></li>
                                    <li style="display: inline-block;margin-left: 50px;"><%=blogs.get(i).getTime()%>
                                    </li>
                                </ul>
                                <div style="float: right;margin-top: -50px">
                                    <div style="text-align: center;color: #1E9FFF"><%=blogs.get(i).getVisit()%>
                                    </div>
                                    <div>阅读量</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                        };
                    %>
                    </tbody>
                </table>
                <div style="width: 740px;height: 40px;background-color: #FFFFFF;text-align: center"><button class="layui-btn addrow" style="width: 745px">加载更多</button></div>
            </div>
            <div class="layui-col-lg4">
                <div style="margin-left: 10px;margin-top: 10px">
                    <div class="layui-carousel" id="test1" lay-filter="test1">
                        <div carousel-item="">
                            <div class="layui-bg-cyan"><img src="../../img/img1.jpg" style="width: 295px;height: 150px">
                            </div>
                            <div class="layui-bg-cyan"><img src="../../img/img2.jpg" style="width: 295px;height: 150px">
                            </div>
                            <div class="layui-bg-cyan"><img src="../../img/img3.jpg" style="width: 295px;height: 150px">
                            </div>
                        </div>
                    </div>
                    <div style="background-color:#ffffff;width:278px;margin-top: 10px;padding: 9px">
                        <div style="padding: 15px 20px"><span style="width: 1px;height: 15px;background-color: #FD482C">&nbsp;</span>
                            热点推荐
                        </div>
                        <ul style="margin-top: -15px">
                            <%
                                for (int i = 0; i < 10; i++) {
                            %>
                            <li style="margin-top: 15px">
                                <div class="layui-row">
                                    <div class="layui-col-lg4">
                                        <a href="#"><img src="../../img/img1.jpg" style="width:90px;"></a>
                                    </div>
                                    <div class="layui-col-lg8"><a href="#">如何用分片技术把7笔/秒的区块链交易提升到2488笔/秒</a></div>
                                </div>
                            </li>
                            <%
                                }
                                ;
                            %>
                        </ul>
                    </div>
                    <div style="background-color:#ffffff;width:278px;margin-top: 10px;padding: 9px">
                        <div style="padding: 15px 20px"><span style="width: 1px;height: 15px;background-color: #FD482C">&nbsp;</span>
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
    $(function () {
        var page=0;
        $(".addrow").click(function () {
            $.ajax({
                url:'/getblogbypage',
                type:'post',
                async:true,
                data:{page:page},
                success:function (data) {
                    var blogs=JSON.parse(data);
                    var count=0;
                    for (var item in blogs){
                        $(".addtable").append('<tr style="height: 95px">\n' +
                            '                        <td>\n' +
                            '                            <div>\n' +
                            '                                <div><a href="/details/'+blogs[count].id+'"\n' +
                            '                                        style="margin-left: 15px;font-size: 23px;margin-top: 5px;">'+blogs[count].title+'\n' +
                            '                                </a>\n' +
                            '                                </div>\n' +
                            '                                <ul style="margin-top: 10px">\n' +
                            '                                    <li style="display: inline-block;margin-left: 25px;"><a href="#" style="color: #1E9FFF;">'+blogs[count].kind+'\n' +
                            '                                    </a>\n' +
                            '                                    </li>\n' +
                            '                                    <li style="display: inline-block;margin-left: 50px;"><a href="#"><i\n' +
                            '                                            class="layui-icon"\n' +
                            '                                            style="size: 11px;">&#xe6af;</i>'+blogs[count].author.nickname+'\n' +
                            '                                    </a></li>\n' +
                            '                                    <li style="display: inline-block;margin-left: 50px;">'+blogs[count].time+'\n' +
                            '                                    </li>\n' +
                            '                                </ul>\n' +
                            '                                <div style="float: right;margin-top: -50px">\n' +
                            '                                    <div style="text-align: center;color: #1E9FFF">'+blogs[count].visit+'\n' +
                            '                                    </div>\n' +
                            '                                    <div>阅读量</div>\n' +
                            '                                </div>\n' +
                            '                            </div>\n' +
                            '                        </td>\n' +
                            '                    </tr>');
                        count++;
                    }

                }

            })
        page++;
        });
    })
</script>
</body>
</html>
