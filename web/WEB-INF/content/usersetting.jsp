<%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2018/4/15
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>come on baby</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../css/all.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <%@include file="part/header.jsp" %>
    <div class="layui-row">
        <div class="layui-col-lg3">&nbsp;</div>
        <div class="layui-col-lg6">
            <div style="background-color: #FFFFFF;height: 320px">

                <%
                    if (request.getAttribute("changepass")==null){
                %>
                <div class="layui-tab">
                    <ul class="layui-tab-title">
                        <li class="layui-this">密码设置</li>
                        <li>资料设置</li>
                    </ul>
                    <div class="layui-tab-content" style="padding: 15px">
                        <div class="layui-tab-item layui-show">
                            <form:form modelAttribute="changePassword" cssClass="layui-form" action="/changepass" method="post"
                                       cssStyle="width: 450px; ">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">旧密码</label>
                                    <div class="layui-input-block">
                                        <form:password path="oldPass" placeholder="请输入旧密码" cssClass="layui-input"
                                                       autocomplete="false"/>
                                        <div><form:errors path="oldPass" cssStyle="color: red"/>&nbsp;</div>
                                    </div>
                                </div>
                                <div class="layui-form-item" >
                                    <label class="layui-form-label">新密码</label>
                                    <div class="layui-input-block">
                                        <form:password path="newPass" placeholder="请输入新密码" cssClass="layui-input"
                                                       autocomplete="false"/>
                                        <div><form:errors path="newPass" cssStyle="color: red"/>&nbsp;</div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">确认密码</label>
                                    <div class="layui-input-block">
                                        <form:password path="confirmPass" placeholder="请输入确认密码" cssClass="layui-input"
                                                       autocomplete="false"/>
                                        <div><form:errors path="confirmPass" cssStyle="color: red"/>&nbsp;</div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" type="submit" style="width: 140px">修改</button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                        <div class="layui-tab-item" >
                            <form class="layui-form" style="width: 450px;" action="changeinfo" method="post" enctype="multipart/form-data">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">选择图片</label>
                                    <div class="layui-input-block">
                                        <input type="file" name="multipartFile">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">昵称</label>
                                    <div class="layui-input-block">
                                        <input type="text" value="<%=user.getNickname()%>" name="name" autocomplete="off" placeholder="请输入昵称"class="layui-input">
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
                </div>
                <%
                    }else if ((boolean)request.getAttribute("changepass")){
                %>
                <h1 style="margin-left: 275px;padding: 55px">修改成功</h1>
                <%
                    }else if (!(boolean)request.getAttribute("changepass")){
                %>
                <h1 style="margin-left: 275px;padding: 55px">修改失败</h1>
                <%
                    }
                %>
            </div>
        </div>
        <div class="layui-col-lg3">&nbsp;</div>
    </div>


</div>
<script src="../../layui/layui.js" charset="UTF-8"></script>
<script>
    layui.use(['element', 'carousel', 'upload'], function () {
        var element = layui.element;
        var carousel = layui.carousel;
        var upload = layui.upload;
        var $ = layui.jquery;
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '/upload/'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('error');
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

//        carousel.render({
//            elem: '#test1'
//            , arrow: 'hover'
//            , width: '295px'
//            , height: '150px'
//        });
    });
</script>
</body>
</html>
