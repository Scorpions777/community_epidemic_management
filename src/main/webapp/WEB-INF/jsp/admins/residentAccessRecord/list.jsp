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
        <input type="text" id="search_input" style="width:300px;float:right;height:30px;"
               placeholder="输入 住户姓名/身份证号/出入地点 模糊查询" autocomplete="off" class="layui-input">
    </div>
</script>


<script>

    layui.use(['layer', 'table'], function () {
        var table = layui.table;
        var layer = layui.layer;
        table.render({
            elem: '#test',    // 指定原始 table 容器的选择器或 DOM，方法渲染方式必填
            url: '${pageContext.request.contextPath}/residentAccessRecord/list', // 请求地址
            toolbar: "#toolbar", // 表头按钮，
            title: '表格',   // 定义 table 的大标题（在文件导出等地方会用到）layui 2.4.0 新增
            // totalRow: true,  //是否开启合计行区域。layui 2.4.0 新增
            limit: 5,    // 每页显示的条数（默认：10）。值务必对应 limits 参数的选项。注意：优先级低于 page 参数中的 limit 参数

            limits: [5, 10, 20, 30, 40, 50, 60],  // 每页条数的选择项，默认：[10,20,30,40,50,60,70,80,90]。注意：优先级低于 page 参数中的 limits 参数

            defaultToolbar: ['filter', 'print', 'exports'], //  头部工具栏右侧图标。

            text: {none: '暂无相关数据'},// （没有查询到任何一条数据时显示）默认：无数据。注：该属性为 layui 2.2.5 开始新增

            cols: [[    // 	设置表头。值是一个二维数组。方法渲染方式必填
                {
                    field: 'recordId',
                    title: 'ID',
                    width: 80,
                    sort: true
                }
                ,
                {
                    field: 'createTime',
                    title: '出入时间',
                    align: "center",
                    edit: 'text',
                    sort: true
                }
                ,
                {
                    field: '',
                    title: '出入类型',
                    align: "center",
                    templet: function (d) {
                        var htm = ''
                        switch (d.accessType) {
                            case 1:
                                htm = '<span class="layui-badge layui-bg-green">进</span>'
                                break
                            case 2:
                                htm = '<span class="layui-badge layui-bg-blue">出</span>'
                                break
                            default :
                                htm = "未知"
                        }
                        return htm;
                    }
                }
                ,
                {
                    field: 'name',
                    title: '住户姓名',
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
                    title: '体温',
                    align: "center",
                    templet: function (d) {
                        var htm = ''
                        if( parseFloat(d.temperature) > 37){
                            htm = '<span class="layui-badge">'+d.temperature+'</span>'
                        }else {
                            htm = '<span class="layui-badge layui-bg-green">'+d.temperature+'</span>'
                        }
                        return htm;
                    }
                }
                ,
                {
                    field: 'place',
                    title: '出入地点',
                    align: "center",
                    edit: 'text',
                    sort: true
                },
                {
                    field: '',
                    title: '',
                    width: 120,
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
                        url: "/residentAccessRecord/delete/" + data.recordId,
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
                                        url: '${pageContext.request.contextPath}/residentAccessRecord/list',  // 因为设置了分页，所以会带上参数发请求 list-data2.json?page=1&limit=5&query= （query是下面where中定义的参数名）
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
                    url: '${pageContext.request.contextPath}/residentAccessRecord/list'  // 因为设置了分页，所以会带上参数发请求 ?page=1&limit=5&query= （query是下面where中定义的参数名）
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
                        content: ["/admins/residentAccessRecord/add"],
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
                        url: '${pageContext.request.contextPath}/residentAccessRecord/list',  // 因为设置了分页，所以会带上参数发请求 list-data2.json?page=1&limit=5&query= （query是下面where中定义的参数名）
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
                        url: '${pageContext.request.contextPath}/residentAccessRecord/list'  // 因为设置了分页，所以会带上参数发请求 ?page=1&limit=5&query= （query是下面where中定义的参数名）
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


            // 发送修改指令
            $.ajax({
                type: 'POST',      // 请求方式
                dataType: 'json', // 预期服务器返回的数据类型。
                data: obj.data,    // 请求参数
                // data: {          // 提交部分参数时
                //     name: obj.data.name,
                // },
                url: "/residentAccessRecord/update",   // 请求地址
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
                                <%--url: '${pageContext.request.contextPath}/residentAccessRecord/list',--%>
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