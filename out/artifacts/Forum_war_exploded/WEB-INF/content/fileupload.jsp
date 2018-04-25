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
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/all.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!--header-->
    <%@include file="part/header.jsp" %>
    <!--header end-->
    <div class="layui-row">
        <div class="layui-col-lg1">&nbsp;</div>
        <div class="layui-col-lg7">
            <div class="write-backgroud" style="padding: 45px 15px 45px 135px;margin-top: 10px;" >
                <form class="layui-form" enctype="multipart/form-data" action="submitfile" method="post">
                    <div class="layui-form-item" style="width: 500px">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="title" id="title" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item" style="width: 500px">
                        <label class="layui-form-label">简介</label>
                        <div class="layui-input-block">
                            <input type="text" name="content" id="content" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">选择文件</label>
                        <div class="layui-input-block">
                            <input type="file" name="file" id="file">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" type="submit">提交</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="layui-col-lg2">
            <div style="margin-left: 15px;margin-top: 10px; padding: 25px" class="write-backgroud">
                <div class="layui-row" style="text-align: center">
                    <div><img src="../../img/userimg/<%=user.getImg()%>" style="height:105px;width:105px"
                              class="layui-circle"></div>
                    <div><a href="index.jsp" style="font-size: 20px"><%=user.getNickname()%>
                    </a></div>
                    <div style="font-size: 12px">资源数量:<span><%=user.getResource_amount()%></span></div>
                </div>
                <div style="text-align: center;">
                    <%--<button class="layui-btn" style="margin-top: 5px">关注</button>--%>
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
