<%@ page import="java.util.List" %>
<%@ page import="cn.jlsysql.entity.Resource" %>
<%@ page import="cn.jlsysql.entity.Blog" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParsePosition" %>
<%@ page import="java.util.Date" %>
<%@ page import="cn.jlsysql.util.Kind" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/26
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Resource> resources = (List<Resource>) request.getAttribute("resource");
%>
<html>
<head>
    <title>我的博客</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/all.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <%@include file="part/header.jsp" %>
    <div class="layui-row">
        <div class="layui-col-lg1">&nbsp;</div>
        <div class="layui-col-lg2">
            <div style="height: 240px;background-color: #FBFBFB;margin-top: 10px;text-align: center;padding: 20px 0px 0px 0px">
                <div><img src="/img/userimg/<%=((User)session.getAttribute("user")).getImg()%>" class="layui-nav-img"
                          style="height: 100px;width: 100px"></div>
                <div>
                    博客：<%=((User) session.getAttribute("user")).getBook_amount()%>
                </div>
                <div>
                    资源：<%=((User) session.getAttribute("user")).getResource_amount()%>
                </div>

            </div>
        </div>
        <div class="layui-col-lg7">
            <div class="layui-tab">
                <ul class="layui-tab-title" style="background-color: #efefef">
                    <li class="layui-this">我的博客</li>
                    <li>我的资源</li>
                </ul>
                <div class="layui-tab-content write-backgroud">
                    <div class="layui-tab-item  layui-show ">
                        <table class="layui-table">
                            <colgroup>
                                <col width="150">
                                <col width="200">
                                <col>
                            </colgroup>
                            <tbody>
                            <%
                                List<Blog> blogs = (List<Blog>) request.getAttribute("blog");
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                ParsePosition pos = new ParsePosition(0);
                                int size = blogs.size();
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
                                            <li style="display: inline-block;margin-left: 25px;"><a href="#"
                                                                                                    style="color: #1E9FFF;"><%=Kind.getKind1(Integer.parseInt(blogs.get(i).getKind())).getName()%>
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
                                }
                                ;
                            %>
                            </tbody>
                        </table>
                    </div>
                    <div class="layui-tab-item">
                        <table class="layui-table">
                            <colgroup>
                                <col width="150">
                                <col width="200">
                                <col>
                            </colgroup>
                            <tbody>
                            <%
                                if (resources != null) {
                                    for (Resource resource : resources) {
                            %>
                            <tr style="height: 95px">
                                <td>
                                    <div style="padding:  5px 15px 5px 15px">
                                        <div><a href="/filedownload/<%=resource.getId()%>"
                                                style="margin-left: 15px;font-size: 23px;margin-top: 5px;"><%=resource.getName()%>
                                        </a>
                                        </div>
                                        <ul style="margin-top: 10px">
                                            </li>
                                            <li style="display: inline-block;margin-left: 50px;"><a href="#"><i
                                                    class="layui-icon"
                                                    style="size: 11px;">&#xe6af;</i>上传者:<%=resource.getAuthor().getNickname()%>
                                            </a></li>
                                            <li style="display: inline-block;margin-left: 50px;"><%=resource.getTime()%>
                                            </li>
                                        </ul>
                                        <div style="float: right;margin-top: -50px">
                                            <div style="text-align: center;color: #1E9FFF;font-size: 20px"><%=resource.getCount()%>
                                            </div>
                                            <div>下载量</div>
                                        </div>

                                    </div>
                                </td>
                            </tr>
                            <%
                                    }
                                    ;
                                }
                            %>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>


</div>
<script src="/layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
</body>
</html>
