<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">

    <script>
        // 如果该页面不是iframe的父页面，则把该页面变成父页面
        if (window != top)
            top.location.href = location.href;
    </script>

    <style>
        body{
            background: url("/images/loginbg.jpg");
        }
        .window{
            width: 500px;
            position: absolute;
            margin-left: -300px;
            margin-top: -80px;
            top: 30%;
            left: 50%;
            display: block;
            z-index: 100;
            background-color: rgba(0);
            padding: 20;
        }

    </style>
</head>


</head>
<body >


<section >
    <div class="window">
        <form class="layui-form" action="" method="post" onsubmit="return false;" >


            <div class="layui-form-item" style="text-align: center">
                <h3 id="logoid">小区疫情防控</h3>
            </div>


            <div class="layui-form-item"  style="margin-top: 20px;margin-right: 100px">
                <label class="layui-form-label">手机</label>
                <div class="layui-input-block">
                    <input type="text"
                           name="phone"
                           required
                           lay-verify="required"
                           placeholder="请输入手机号"
                           autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-right: 100px">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password"
                           name="password"
                           required
                           lay-verify="required|password"
                           placeholder="请输入密码"
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>


            <div class="layui-form-item">
                <div style="text-align: center">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">登陆</button>
                </div>
            </div>


        </form>
    </div>

    </div>
</section>



<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>

<script>

    layui.use(['jquery', 'form', 'layer', 'layedit', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;


        // 自定义验证规则
        form.verify({
            password: [
                /^[a-zA-Z0-9]{6,16}$/
                , '密码必须6到16位，且不能出现空格'
            ]

        });

        // 监听提交
        form.on('submit(formDemo)', function (data) {

            $.ajax({
                type: "post",
                url: "/admin/login",
                data: data.field,
                dataType: "json",
                success: function (data) {
                    if (data.status === 20000) {

                        layer.msg(
                            data.message,

                            {
                                icon: 1,
                                time: 3000
                            },

                            function () {
                                window.location.href = "${pageContext.request.contextPath}/index";
                            });
                    }
                    else {
                        layer.msg(data.message)
                    }
                }
            })
            return false;
        })
        ;

    })
    ;
</script>
</body>
</html>
