<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户修改密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.js"></script>
    <script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>
</head>
<body>
<form class="layui-form" style="width: 80%;margin: 120px auto">

    <div class="layui-form-item">
        <label class="layui-form-label">登录名</label>
        <div class="layui-input-block">
            <input type="text"
                   disabled
                   readonly
                   placeholder=""
                   required
                   value="${sessionScope.user.loginname}"
                   lay-verify="required"
                   autocomplete="off" class="layui-input layui-disabled">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="text"
                   name="phone"
                   required
                   value="${sessionScope.user.phone}"
                   lay-verify="required|phone"
                   placeholder=""
                   autocomplete="off" class="layui-input">
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
    layui.use(['form', 'layer'], function () {

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
                url: "/user/update",
                success: function (data) {
                    if (data.status === 20000) {
                        layer.msg(
                            data.message,

                            {
                                icon: 1,
                                time: 3000
                            },

                            function () {
                                window.location.href = "${pageContext.request.contextPath}/users/profile";
                            });

                    } else {
                        layer.msg(data.message)
                    }
                },
                error: function (data) {
                    layer.msg(data.message);
                }
            });
            return false; // 返回false阻止form的默认提交事件

        });

        // 自定义验证规则
        form.verify({});
    })
    ;
</script>

</body>
</html>
