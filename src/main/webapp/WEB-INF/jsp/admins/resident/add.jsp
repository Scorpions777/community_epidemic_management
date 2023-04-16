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
            <label class="layui-form-label">姓名</label>
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

        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <select name="gender" class="" lay-verify="required" lay-verType="tips">
                    <option value="">选择性别</option>
                    <option value="1">男</option>
                    <option value="0">女</option>
                </select>
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
                       lay-verify="required"
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
            <label class="layui-form-label">入住时间</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="checkInTime"
                       placeholder=""
                       autocomplete="off"
                       required
                       id="date"
                       lay-verify="required"
                       lay-verType="tips"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">详细门牌号</label>
            <div class="layui-input-inline">
                <select id="select1" name="addressId">
                    <option value="">----选择----</option>
                </select>
            </div>
        </div>
    </div>


    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <input type="text"
                       name="remark"
                       placeholder=""
                       autocomplete="off"
                       required
                       lay-verify=""
                       lay-verType="tips"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">风险级别</label>
            <div class="layui-input-inline">
                <select id="" name="status">
                    <option value="1">正常</option>
                    <option value="2">低风险</option>
                    <option value="3">中风险</option>
                    <option value="4">高风险</option>
                </select>
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
    layui.use(['form', 'layer', 'upload', 'laydate'], function () {

        var layer = layui.layer;

        var $ = layui.jquery;

        var form = layui.form;

        var laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date',
            trigger: 'click'
        });


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

        form.render('select');


        // 监听提交
        form.on('submit(*)', function (data) {  // *是提交按钮的lay-filter="*"

            console.log(JSON.stringify(data.field))

            $.ajax({
                type: 'POST',
                dataType: 'json',
                data: data.field,
                url: "/resident/add",
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
                                url: '${pageContext.request.contextPath}/resident/list',
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
            ],

        });
    })
    ;
</script>


</body>
</html>