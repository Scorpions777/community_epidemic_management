<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>增加</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>

</head>
<body>

<form class="layui-form" id="form" style="width: 100%;margin: 20px auto">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">小区名称</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="communityName"
                       placeholder=""
                       autocomplete="off"
                       required
                       lay-verify="required"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">楼号</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="buildingNumber"
                       placeholder=""
                       autocomplete="off"
                       required
                       lay-verify="required"
                       lay-verType="tips"
                       class="layui-input">
            </div>
        </div>



    </div>


    <div class="layui-form-item">


        <div class="layui-inline">
            <label class="layui-form-label">门牌号</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="roomNumber"
                       placeholder=""
                       autocomplete="off"
                       required
                       lay-verify="required"
                       lay-verType="tips"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">住户人数</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="count"
                       placeholder=""
                       autocomplete="off"
                       required
                       lay-verify="required"
                       lay-verType="tips"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">户主</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="houser"
                       placeholder=""
                       autocomplete="off"
                       required
                       lay-verify="required"
                       lay-verType="tips"
                       class="layui-input">
            </div>
        </div>

    </div>
    
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="*">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script>

    //JavaScript代码区域
    layui.use(['form', 'layer', 'upload', 'layedit'], function () {

        var layer = layui.layer;

        var $ = layui.jquery;

        var form = layui.form;


        // 监听提交
        form.on('submit(*)', function (data) {  // *是提交按钮的lay-filter="*"

            console.log(JSON.stringify(data.field))

            $.ajax({
                type: 'POST',
                dataType: 'json',
                data: data.field,
                url: "/address/add",
                success: function (data) {
                    layer.msg(
                        data.message,
                        {
                            icon: 1,
                            time: 3000
                        },
                        function () {
                            // 下面就是提交成功后关闭自己
                            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            parent.layer.close(index); // 再执行关闭

                            // 新增数据之后，刷新父页面的表格数据
                            parent.layui.table.reload('test', {
                                // url可以不指定，会使用table.render中指定的
                                url: '${pageContext.request.contextPath}/address/list',
                                // ,methods:"post"
                                where: {  //设定异步数据接口的额外参数
                                    // query: inputVal
                                },
                                page: {
                                    curr: 1  // 重新从第 1 页开始
                                }
                            });
                        }
                    )

                },
                error: function (data) {
                    layer.msg(
                        data.message,
                        {
                            icon: 1,
                            time: 2000  //2秒关闭（如果不配置，默认是3秒）
                        },
                        function () {
                            // 下面就是提交成功后关闭自己
                            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                            parent.layer.close(index); // 再执行关闭
                        }
                    )
                }
            });
            return false; // 返回false阻止form的默认提交事件
        })
        ;
        // 自定义验证规则
        form.verify({});
    })
    ;
</script>


</body>
</html>