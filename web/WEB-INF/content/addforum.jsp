<%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/22
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>写博客
    </title>
    <link rel="stylesheet" href="../../layui/css/layui.css" charset="UTF-8">
    <link rel="stylesheet" href="../../css/all.css" charset="UTF-8">
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
    <div class="layui-row">
        <div class="layui-col-xs1">&nbsp;</div>
        <div class="layui-col-xs8">
            <form:form cssClass="layui-form" action="addforum" modelAttribute="blog" cssStyle="width: 1000px;margin-top: 15px" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">输入标题</label>
                    <div class="layui-input-block">
                        <form:input type="text" path="title" lay-verify="required" placeholder="请输入标题" autocomplete="off" cssClass="layui-input"/>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">文章类型</label>
                    <div class="layui-input-block">
                        <form:select path="kind">
                            <option value="">请选择</option>
                            <option value="1">人工智能</option>
                            <option value="2">大数据</option>
                            <option value="3">区块链</option>
                            <option value="4">数据库</option>
                            <option value="5">前端</option>
                            <option value="6">移动开发</option>
                            <option value="7">物联网</option>
                            <option value="8">运维</option>
                            <option value="9">编程语言</option>
                            <option value="10">架构</option>
                            <option value="11">安全</option>
                            <option value="12">游戏开发</option>
                        </form:select>
                    </div>
                </div>


                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block">
                        <form:textarea path="content" placeholder="请输入内容" cssClass="layui-textarea" cssStyle="height: 465px"></form:textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form:form>
        </div>
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
<script src="/layui/layui.js" charset="UTF-8"></script>
<script>
    layui.use(['form', 'element'], function () {
        var form = layui.form;
        var element = layui.element;

        //监听提交
//        form.on('submit(formDemo)', function (data) {
//            layer.msg(JSON.stringify(data.field));
//            return false;
//        });
    });
</script>
</body>
</html>
