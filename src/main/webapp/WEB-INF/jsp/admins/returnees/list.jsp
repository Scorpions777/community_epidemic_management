<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <title>列表</title>

    <meta name="renderer" content="webkit">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.js"></script>

    <script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>

    <style type="text/css">
        .layui-table-cell, .layui-table-tool-panel li {
            overflow: hidden !important;
            text-overflow: ellipsis !important;
            white-space: nowrap !important
        }
    </style>

</head>
<body>

<%--表格--%>
<table class="layui-hide" id="test" lay-filter="test"></table>

<%--表格右侧 修改 删除按钮--%>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script type="text/html" id="toolbar">
    <div class="layui-table-tool-temp" style="float: left;padding-right: 20px;">

        <%--添加按钮--%>
        <div id="add_btn" class="layui-inline" lay-event="add">
            <i class="layui-icon layui-icon-add-1"></i>
        </div>

        <%--刷新按钮--%>
        <div id="refresh_btn" class="layui-inline" lay-event="refresh">
            <i class="layui-icon layui-icon-refresh-3"></i>
        </div>

        <%--搜索按钮--%>
        <div class="layui-inline" style="float:right;height:29px;" title="搜索"
             lay-event="search">
            <i id="search_btn" class="layui-icon layui-icon-search"></i>
        </div>

        <%--搜索框--%>
        <input type="text" id="search_input" style="width:320px;float:right;height:30px;"
               placeholder="输入 住户姓名/小区名称/楼号/门牌号 模糊查询" autocomplete="off" class="layui-input">
    </div>
</script>

<script>

    layui.use(['layer', 'table'], function () {
        var table = layui.table;
        var layer = layui.layer;
        table.render({
            elem: '#test',    // 指定原始 table 容器的选择器或 DOM，方法渲染方式必填
            url: '${pageContext.request.contextPath}/returnees/list', // 请求地址
            toolbar: "#toolbar", // 表头按钮，
            title: '表格',   // 定义 table 的大标题（在文件导出等地方会用到）layui 2.4.0 新增
            // totalRow: true,  //是否开启合计行区域。layui 2.4.0 新增
            limit: 5,    // 每页显示的条数（默认：10）。值务必对应 limits 参数的选项。注意：优先级低于 page 参数中的 limit 参数
            limits: [5, 10, 20, 30, 40, 50, 60],  // 每页条数的选择项，默认：[10,20,30,40,50,60,70,80,90]。注意：优先级低于 page 参数中的 limits 参数

            defaultToolbar: ['filter', 'print', 'exports'], //  头部工具栏右侧图标。

            text: {none: '暂无相关数据'},// （没有查询到任何一条数据时显示）默认：无数据。注：该属性为 layui 2.2.5 开始新增

            cols: [[    // 	设置表头。值是一个二维数组。方法渲染方式必填
                {
                    field: 'returneesId',
                    title: 'ID',
                    width: 80,
                    sort: true
                }
                ,
                {
                    field: 'name',
                    title: '姓名',
                    align: "center",
                    edit: 'text',
                    sort: true
                }
                ,
                {
                    field: 'idCard',
                    title: '身份证号',
                    align: "center",
                    edit: 'text',
                    sort: true
                }
                ,
                {
                    field: '',
                    title: '性别',
                    align: "center",
                    templet: function (d) {
                        var htm = ''
                        switch (d.gender) {
                            case 0:
                                htm = "女"
                                break;
                            case 1:
                                htm = "男"
                                break;
                            default :
                                htm = "未知"
                        }
                        return htm;
                    }
                }
                ,
                {
                    field: 'phone',
                    title: '手机号',
                    align: "center",
                    edit: 'text',
                    sort: true
                }
                ,

                {
                    field: 'returnTime',
                    title: '返乡时间',
                    align: "center",
                    edit: 'text',
                    sort: true
                }
                ,

                {
                    field: 'addressId',
                    title: '地址ID',
                    align: "center",
                    edit: 'text',
                    sort: true
                }
                ,

                {
                    field: 'communityName',
                    title: '小区名称',
                    align: "center",
                    edit: 'text',
                    sort: true
                }
                ,

                {
                    field: 'buildingNumber',
                    title: '楼号',
                    align: "center",
                    edit: 'text',
                    sort: true
                }
                ,

                {
                    field: 'roomNumber',
                    title: '门牌号',
                    align: "center",
                    edit: 'text',
                    sort: true
                },

                {
                    field: 'status',
                    title: '状态',
                    align: "center",
                    templet: function (d) {
                        var htm = ''
                        switch (d.status) {
                            case 1:
                                htm = '<span class="layui-btn layui-btn-sm">正常</span>'
                                break;
                            case 2:
                                htm = '<span class="layui-btn layui-btn-sm layui-btn-normal">低风险</span>'
                                break;
                            case 3:
                                htm = '<span class="layui-btn layui-btn-sm layui-btn-warm">中风险</span>'
                                break;
                            case 4:
                                htm = '<span class="layui-btn layui-btn-sm layui-btn-danger">高风险</span>'
                                break;
                            default :
                                htm = "未知"
                        }
                        return htm;
                    }
                }
                ,
                {
                    field: '',
                    title: '',
                    width: 80,
                    align: "center",
                    toolbar: '#barDemo'
                }
            ]],
            page: true,
            response: {
                statusCode: 20000 // 重新规定成功的状态码为 20000，
            },
            parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.status, //解析接口状态
                    "msg": res.message, //解析提示文本
                    "count": res.total, //解析数据长度
                    "data": res.rows //解析数据列表
                };
            },
            done: function (res, curr, count) {
                //数据渲染完的回调。
                //由于layui 设置了超出隐藏，所以这里改变下，以兼容操作按钮的下拉菜单
                $(".layui-table-body, .layui-table-box, .layui-table-cell").css('overflow', 'visible');
            }

        });

        //  监听工具条(每一行最右边的 查看 修改 删除 等按钮)
        table.on('tool(test)', function (obj) {
            var data = obj.data;

            if (obj.event === 'del') {   // 点击了删除按钮

                layer.confirm('真的删除吗', function (index) {
                    // obj.del();
                    layer.close(index);

                    // 向服务端发送删除指令
                    $.ajax({
                        type: 'DELETE',
                        dataType: 'json',
                        data: data.field,
                        url: "/returnees/delete/" + data.returneesId,
                        success: function (data) {
                            layer.msg(
                                data.message,
                                {
                                    icon: 1,
                                    time: 2000  //2秒关闭（如果不配置，默认是3秒）
                                },
                                function () {
                                    // 新增数据之后，刷新表格数据
                                    table.reload('test', {
                                        // url可以不指定，会使用table.render中指定的
                                        url: '${pageContext.request.contextPath}/returnees/list',  // 因为设置了分页，所以会带上参数发请求 list-data2.json?page=1&limit=5&query= （query是下面where中定义的参数名）
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
                });
            }
        });


        $('#search_input').bind('keypress', function (event) {

            // 获取输入框的值
            var inputVal = $('#search_input').val();

            console.log(inputVal)

            var content = $(this).val();

            if (event.keyCode == '13') {
                // 点击查询后，让表格重载
                // 第一个参数：test是表格的id（可以直接在table标签上写上id属性，也可以通过 table 模块参数id指定
                table.reload('test', {
                    // url可以不指定，会使用table.render中指定的
                    url: '${pageContext.request.contextPath}/returnees/list'  // 因为设置了分页，所以会带上参数发请求 ?page=1&limit=5&query= （query是下面where中定义的参数名）
                    ,
                    // ,methods:"post"
                    where: {  // 设定异步数据接口的额外参数
                        query: inputVal
                    }
                    ,
                    page: {
                        curr: 1  // 重新从第 1 页开始
                    }
                });
            }
        });


        // 监听头工具栏事件（表头左边的 增加 刷新 搜索等按钮）
        table.on('toolbar(test)', function (obj) {

            // 获取输入框的值
            var inputVal = $('#search_input').val();

            switch (obj.event) {
                case 'add':  // 如果是点击了增加按钮
                    layer.open({
                        type: 2,
                        title: "添加",
                        area: ['80%', '80%'], //  宽、高
                        fix: false,
                        maxmin: true,
                        shadeClose: true,
                        scrollbar: true,
                        shade: 0.4,
                        skin: 'layui-layer-rim',
                        content: ["/admins/returnees/add"],
                        yes: function (index, layero) {
                            //do something
                            layer.close(index); //如果设定了yes回调，需进行手工关闭
                            console.log("确认")
                        }
                    });
                    break;

                case "refresh":  // 如果是点击了刷新按钮

                    // 点击刷新后，让表格重载
                    // 第一个参数：test是表格的id（可以直接在table标签上写上id属性，也可以通过 table 模块参数id指定
                    table.reload('test', {
                        // url可以不指定，会使用table.render中指定的
                        url: '${pageContext.request.contextPath}/returnees/list',  // 因为设置了分页，所以会带上参数发请求 list-data2.json?page=1&limit=5&query= （query是下面where中定义的参数名）
                        // ,methods:"post"
                        where: {  //设定异步数据接口的额外参数
                            query: inputVal
                        },
                        page: {
                            curr: 1  // 重新从第 1 页开始
                        }
                    });
                    break;

                case "search": // 如果是点击了搜索按钮

                    // 点击查询后，让表格重载
                    // 第一个参数：test是表格的id（可以直接在table标签上写上id属性，也可以通过 table 模块参数id指定
                    table.reload('test', {
                        // url可以不指定，会使用table.render中指定的
                        url: '${pageContext.request.contextPath}/returnees/list'  // 因为设置了分页，所以会带上参数发请求 ?page=1&limit=5&query= （query是下面where中定义的参数名）
                        ,
                        // ,methods:"post"
                        where: {  // 设定异步数据接口的额外参数
                            query: inputVal
                        }
                        ,
                        page: {
                            curr: 1  // 重新从第 1 页开始
                        }
                    });
                    break;
            }
        });


        // 监听单元格编辑。单元格被编辑，且值发生改变时触发
        table.on('edit(test)', function (obj) {
            //注：edit是固定事件名，test是table原始容器的属性 lay-filter="对应的值"

            console.log(obj.value); // 得到修改后的值

            console.log(obj.field); // 当前编辑的字段名

            console.log(obj.data); // 所在行的所有相关数据

            if (obj.data.communityName === '' || obj.data.communityName == null) {
                layer.msg("小区名称不能为空")
                // 修改失败，重新赋予原值
                var old = $(this).prev().text();// 旧值
                $(this).val(old); // 重新掰回来
                return
            }

            if (obj.data.buildingNumber === '' || obj.data.buildingNumber == null) {
                layer.msg("楼号不能为空")
                // 修改失败，重新赋予原值
                var old = $(this).prev().text();// 旧值
                $(this).val(old); // 重新掰回来
                return
            }

            if (obj.data.roomNumber === '' || obj.data.roomNumber == null) {
                layer.msg("门牌号不能为空")
                // 修改失败，重新赋予原值
                var old = $(this).prev().text();// 旧值
                $(this).val(old); // 重新掰回来
                return
            }


            // 发送修改指令
            $.ajax({
                type: 'POST',      // 请求方式
                dataType: 'json', // 预期服务器返回的数据类型。
                data: obj.data,    // 请求参数
                // data: {          // 提交部分参数时
                //     name: obj.data.name,
                // },
                url: "/returnees/update",   // 请求地址
                success: function (data) {  // 成功回调函数
                    layer.msg(
                        data.message,
                        {
                            icon: 1,
                            time: 3000
                        },
                        function () {
                            // 刷新表格数据
                            table.reload('test', {
                                // url可以不指定，会使用table.render中指定的
                                <%--url: '${pageContext.request.contextPath}/returnees/list',--%>
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
                error: function (data) {  // 失败回调函数
                    layer.msg(
                        data.message,
                        {
                            icon: 1,
                            time: 3000
                        },
                        function () {
                            // 下面就是提交成功后关闭自己
                            var index = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(index);
                        }
                    )
                }
            });
        });
    });


</script>

</body>
</html>