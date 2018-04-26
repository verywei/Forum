<%@ page import="cn.jlsysql.entity.Resource" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="cn.jlsysql.util.TimeUtil" %><%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/13
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Resource resource= (Resource) request.getAttribute("resource");
%>
<html>
<head>
    <title><%=resource.getName()%></title>
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
            <%
                if (resource!=null){
            %>
            <div class="write-backgroud" style="padding: 25px 15px 25px 35px;margin-top: 10px">
                <div style="font-size: 20px"><%=resource.getName()%></div>
                <div class="layui-row" style="margin-top: 5px">
                    <div class="layui-col-lg3" style="margin-left: 30px">上传时间:<%=TimeUtil.fomatDate(resource.getTime(),"yyyy-MM-dd").toString()%></div>
                    <div class="layui-col-lg4">大小:<%=resource.getSize()%> MB</div>
                </div>
                <blockquote class="layui-elem-quote"><%=resource.getContent()%>
                </blockquote>
                <div class="layui-row">
                    <div class="layui-col-lg11" style="font-size: 20px">下载数:<span style="color: #D15FEE"><%=resource.getCount()%></span></div>
                    <div class="layui-col-lg1">
                        <button class="layui-btn layui-bg-red"><a href="/resource/<%=resource.getUrl()%>">下载</a></button>
                    </div>
                </div>
            </div>
            <%
                }
            %>
            <div style="background-color: #f6f6f6;height: 10px">

            </div>
            <div style=" background-color: #FFFFFF;padding: 20px 20px 5px 20px" class="critic">
                <%
                    if (((User)session.getAttribute("user"))!=null){
                %>
                <%--<form class="layui-form">--%>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" class="layui-textarea comment-input"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" style="float: right" onclick="comment()">提交评论</button>
                </div>
                <%--</form>--%>
                <%
                }else {
                %>
                <div style="text-align: center ;padding: 0px 0px 15px 0px">您还没有登录，请<a href="/login" style="color: #1E9FFF"> [登录]</a></div>
                <%
                    }
                %>
                <%
                    for (int i=0;i<resource.getComments().size();i++){
                %>

                <div>
                    <hr class="layui-bg-gray">
                    <img src="../../img/userimg/<%=resource.getComments().get(i).getAuthor().getImg()%>" class="layui-circle" style="width: 30px;height: 30px"><a href="#"
                                                                                                           style="margin-left: 10px"><%=resource.getComments().get(i).getAuthor().getNickname()%></a><span
                        style="margin-left: 25px;"><%=resource.getComments().get(i).getTime()%></span>
                    <div style="margin-left: 30px">
                        <%=resource.getComments().get(i).getContent()%>
                    </div>

                </div>
                <%
                    }
                %>
                <hr class="layui-bg-gray">
            </div>
        </div>
        <div class="layui-col-lg2">
            <div style="margin-left: 15px;margin-top: 10px; padding: 25px" class="write-backgroud">
                <div class="layui-row" style="text-align: center">
                    <div><img src="../../img/userimg/<%=resource.getAuthor().getImg()%>" style="height:105px;width:105px" class="layui-circle"></div>
                    <div><a href="index.jsp" style="font-size: 20px"><%=resource.getAuthor().getNickname()%></a></div>
                    <div style="font-size: 12px">资源数量:<span><%=resource.getAuthor().getResource_amount()%></span></div>
                </div>
                <div style="text-align: center;">
                    <%
                        boolean canfollow= (boolean) request.getAttribute("canfollow");
                        if (canfollow){
                    %>
                    <button class="layui-btn" style="margin-top: 5px" onclick="ssss()">关注</button>
                    <%
                        }else {
                    %>
                    <button class="layui-btn layui-btn-disabled" style="margin-top: 5px">关注</button>
                    <%
                        }
                    %>
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

<script src="/bootstrap/jquery.js" charset="UTF-8"></script>
<script src="../../layui/layui.js"></script>
<script>
    layui.use('element', function () {
        var element = layui.element;
    })
    function comment() {
        var  str=$(".comment-input").val();
        $.ajax({
            type:"post",
            url:"/addresourcecomment/<%=resource.getId()%>",
            data:{data:str,id:12},
            success:function (result) {
            }
        });
        location.reload();
        return false;
    }
    function ssss() {
        $.ajax({
            type: "post",
            url: "/focus?followed=<%=resource.getAuthor().getId()%>",
            success: function (result) {
                if (result == 'ok') {
                    $("#focus").addClass(" layui-btn-disabled ")
                }
                location.reload();
            }
        })
    }
</script>
</body>
</html>
