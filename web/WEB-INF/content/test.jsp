
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css"  media="all" charset="UTF-8">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
    <style>
        li {
            width: 1200px;
            background-color: #1E9FFF;
        }
    </style>
</head>
<body class="layui-body">

<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">--%>
    <%--<legend>信息流 - 滚动加载</legend>--%>
<%--</fieldset>--%>

<%--<ul class="flow-default" id="LAY_demo1"></ul>--%>

<table class="dynamic-add">

</table>
<button class="layui-btn"></button>

<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">--%>
    <%--<legend>信息流 - 手工加载</legend>--%>
<%--</fieldset>--%>

<%--<ul class="flow-default" style="height: 300px;" id="LAY_demo2"></ul>--%>

<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">--%>
    <%--<legend>图片懒加载</legend>--%>
<%--</fieldset>--%>
<%--<div class="site-demo-flow" id="LAY_demo3">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i2/701696736/TB2PNl5ahQa61Bjy0FhXXaalFXa_!!701696736.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i2/162734861/TB2V5rsX_gc61BjSZFkXXcTkFXa_!!162734861.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i4/69476562/TB2htq4XTka61BjSszfXXXN8pXa_!!69476562.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i1/180558071/TB2sy6jXMQc61BjSZFGXXa1DFXa_!!180558071.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i2/701696736/TB2PNl5ahQa61Bjy0FhXXaalFXa_!!701696736.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i3/285892163/TB2qu2HX9Zb61BjSZPfXXaU.pXa_!!285892163.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i2/704998060/TB2S.gAXTgc61BjSZFkXXcTkFXa_!!704998060.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i3/117202952/TB25lckX_AX61Bjy0FcXXaSlFXa_!!117202952.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i2/162734861/TB2qijoX9Zb61BjSZPfXXaU.pXa_!!162734861.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i3/96216586/TB2S7EfXHMc61BjSZFFXXaDLFXa_!!96216586.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i8/TB1jSSFNFXXXXcoXFXXYXGcGpXX_M2.SS2_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i2/162734861/TB2ylbsX37c61BjSZFKXXb6hFXa_!!162734861.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i2/117202952/TB2FdyZajUd61BjSZPcXXc6hXXa_!!117202952.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i4/777105914/TB2t.qbXZwb61Bjy0FfXXXvlpXa_!!777105914.jpg_400x400q90.jpg?t=1524738618936">--%>
    <%--<img lay-src="https://gw.alicdn.com/bao/uploaded/i4/TB1XzupNFXXXXcpXXXXXXXXXXXX_!!0-item_pic.jpg_400x400q90.jpg?t=1524738618936">--%>
<%--</div>--%>

<%--<p style="margin-top: 20px;">--%>
    <%--无论滚动条上滑还是下滑，都只始终加载当前屏的图片（你可以快速拉动滚动条到中间区域，然后再往上滑动试试）--%>
    <%--<br>Layui的图片懒加载，除了对滚动条的性能进行了美好的优化，也对图片的“当前屏”进行了高效计算，无惧于任何规模庞大的图片数量！--%>
<%--</p>--%>
<script src="/bootstrap/jquery.js" charset="UTF-8"></script>
<script src="/layui/layui.js" charset="UTF-8"></script>
<script>
    layui.use('flow', function(){
        var flow = layui.flow;

        flow.load({
            elem: '#LAY_demo1' //流加载容器
            ,isAuto: false
            ,isLazyimg: true
            ,scrollElem: '#LAY_demo1' //滚动条所在元素，一般不用填，此处只是演示需要。
            ,done: function(page, next){ //执行下一页的回调
                alert(page)
                //模拟数据插入
                setTimeout(function(){
                    var lis = [];
                    for(var i = 0; i < 8; i++){
                        lis.push('<li>'+ '<img src="/img/img5.jpg">'+'<hr class="layui-bg-black">'+'</li>')
                    }

                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < 10); //假设总页数为 10
                }, 500);
            }
        });

        flow.load({
            elem: '#LAY_demo2' //流加载容器
            ,scrollElem: '#LAY_demo2' //滚动条所在元素，一般不用填，此处只是演示需要。
            ,isAuto: false
            ,isLazyimg: true
            ,done: function(page, next){ //加载下一页
                //模拟插入
                setTimeout(function(){
                    var lis = [];
                    for(var i = 0; i < 6; i++){
                        lis.push('<li><img lay-src="http://s17.mogucdn.com/p2/161011/upload_279h87jbc9l0hkl54djjjh42dc7i1_800x480.jpg?v='+ ( (page-1)*6 + i + 1 ) +'"></li>')
                    }
                    next(lis.join(''), page < 6); //假设总页数为 6
                }, 500);
            }
        });

        //按屏加载图片
        flow.lazyimg({
            elem: '#LAY_demo3 img'
            ,scrollElem: '#LAY_demo3' //一般不用设置，此处只是演示需要。
        });

    });

    $(function(){
        var a=1;
        $("#btn1").click(function() {
            $("#test tbody").prepend('<tr><td></td><td></td><td></td></tr>');
        });
        $(".layui-btn").click(function() {
            $(".dynamic-add").append('<tr><td>ssssss'+a+'</td></tr>'+'<tr><td>ssssss'+a+'</td></tr>');
            a++
        });
    });
</script>
</body>
</html>