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
            <label class="layui-form-label">出入类型</label>
            <div class="layui-input-inline">
                <input type="radio" name="accessType" value="1" title="进" checked>
                <input type="radio" name="accessType" value="2" title="出">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">访客姓名</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="name"
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
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="idCard"
                       placeholder=""
                       autocomplete="off"
                       required
                       lay-verify="required|idCard"
                       lay-verType="tips"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-inline">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="phone"
                       placeholder=""
                       autocomplete="off"
                       required
                       lay-verify="required|phone"
                       lay-verType="tips"
                       class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">


        <div class="layui-inline">
            <label class="layui-form-label">出入地点</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="fromPlace"
                       placeholder="从哪里来，或者去哪里"
                       autocomplete="off"
                       required
                       lay-verify="required"
                       lay-verType="tips"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">访问地址</label>
            <div class="layui-input-inline">
                <select id="select1" name="addressId">
                    <option value="">----选择----</option>
                </select>
            </div>
        </div>



    </div>

    <div class="layui-form-item">


        <div class="layui-inline">
            <label class="layui-form-label">体温</label>
            <div class="layui-input-inline">
                <input type="number"
                       name="temperature"
                       placeholder=""
                       autocomplete="off"
                       required
                       lay-verify="required"
                       lay-verType="tips"
                       class="layui-input">
            </div>
        </div>


        <div class="layui-inline">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="remark"
                       placeholder=""
                       autocomplete="off"
                       required
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



        $.ajax({
            // 动态获取下拉选项的接口，返回数据主要是id+name
            url: '/address/all',
            dataType: 'json',
            type: 'get',
            success: function (data) {

                var str = '<option value="">----选择----</option>';

                var list = eval(data)

                console.log(list)

                console.log(typeof list)

                $.each(data, function (index, item) {
                    // console.log(item)
                    console.log(typeof  item)
                    // 组装数据
                    str += "<option value=" + eval(item)["id"] + ">" + eval(item)["name"] + "</option>"
                })

                // console.log(str);

                // jquery赋值方式
                $("#select1").html(str);

                // 重新渲染生效
                form.render();
            }
        });



        // 监听提交
        form.on('submit(*)', function (data) {  // *是提交按钮的lay-filter="*"

            console.log(JSON.stringify(data.field))

            $.ajax({
                type: 'POST',
                dataType: 'json',
                data: data.field,
                url: "/visitorAccessRecord/add",
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
                                url: '${pageContext.request.contextPath}/visitorAccessRecord/list',
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
        form.verify({
            idCard: [
                /^[\S]{18,18}$/
                , '必须是18位，且不能出现空格'
            ]
        });
    })
    ;
</script>


</body>
</html>