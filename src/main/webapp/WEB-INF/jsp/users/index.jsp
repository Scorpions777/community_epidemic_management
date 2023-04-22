<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <title>社区疫情防控管理系统（住户端）</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/layui/css/layui.css">

    <script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.js"></script>

    <script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>

</head>

<body class="layui-layout-body">

<!-- 顶部区域 -->
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">社区疫情防控管理系统</div>

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${pageContext.request.contextPath}/images/user3.png" class="layui-nav-img">
                    <c:if test="${sessionScope.user != null}">
                        ${sessionScope.user.loginname}
                    </c:if>
                </a>
                <dl class="layui-nav-child">

                    <dd>
                        <a href="#" data-url="/users/profile" data-title="个人资料" data-id="1901"
                           class="site-demo-active"
                           data-type="tabAdd">
                            修改资料
                        </a>
                    </dd>

                    <dd>
                        <a href="#" data-url="/users/password" data-title="修改密码" data-id="1902"
                           class="site-demo-active" data-type="tabAdd">
                            修改密码
                        </a>
                    </dd>

                </dl>
            </li>
            <li class="layui-nav-item"><a href="/user/logout">退出</a></li>
        </ul>
    </div>


    <!-- 左侧导航栏 -->
    <div class="layui-tab  layui-side layui-tab-card site-demo-button">
        <ul class="layui-nav layui-side layui-nav-tree layui-nav-side">
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">疫情防控</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="#" data-url="/user/news" data-title="公告通知"
                           data-id="1100" class="site-demo-active" data-type="tabAdd">
                            公告通知
                        </a>
                    </dd>
                    <dd>
                        <a href="#" data-url="/users/resident/applyList" data-title="住户出入申请"
                           data-id="1102" class="site-demo-active" data-type="tabAdd">
                            住户出入申请
                        </a>
                    </dd>
                    <dd>
                        <a href="#" data-url="/users/visitor/applyList" data-title="访客出入申请"
                           data-id="1103" class="site-demo-active" data-type="tabAdd">
                            访客出入申请
                        </a>
                    </dd>

                    <dd>
                        <a href="#" data-url="/users/returnees/list" data-title="返乡申请"
                           data-id="1104" class="site-demo-active" data-type="tabAdd">
                            返乡申请
                        </a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">个人管理</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="#" data-url="/users/profile" data-title="修改资料"
                           data-id="1401" class="site-demo-active"
                           data-type="tabAdd">
                            修改资料
                        </a>
                    </dd>

                    <dd>
                        <a href="#" data-url="/users/password" data-title="修改密码"
                           data-id="1402" class="site-demo-active"
                           data-type="tabAdd">
                            修改密码
                        </a>
                    </dd>

                    <dd>
                        <a href="/user/logout">退出登录</a>
                    </dd>

                </dl>
            </li>
        </ul>
    </div>


    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="layui-tab" lay-filter="demo" lay-allowClose="true">
            <!--tab页标题-->
            <ul class="layui-tab-title">
            </ul>

            <!--tab页标题上右键，出现下面的 关闭当前和关闭所有的选项-->
            <ul class="rightMenu" style="display: none;position: absolute;">
                <li data-type="closeThis" class="layui-bg-cyan">关闭当前</li>
                <li data-type="closeAll" class="layui-bg-cyan">关闭所有</li>
            </ul>

            <!--tab页主体内容区域-->
            <div class="layui-tab-content">

            </div>

        </div>


    </div>


    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 社区疫情管理系统
    </div>

</div>
<script src="${pageContext.request.contextPath}/lib/jquery/jquery-3.3.1.js"></script>
<script src="${pageContext.request.contextPath}/lib/layui/layui.js"></script>

<script>

    layui.use(['element', 'layer'], function () {
        var $ = layui.jquery;
        var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="' + id + '" scrolling="auto" frameborder="0" src="' + url + '" style="width:100%;height:99%;"></iframe>',
                    id: id //规定好的id
                })
                CustomRightClick(id); //给tab绑定右击事件
                FrameWH();  //计算ifram层的大小
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            }
            , tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i, item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }

        };


        // 当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on('click', function () {
            var dataid = $(this);

            // 这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                // 如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
            } else {
                // 否则判断该tab项是否已经存在

                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"), dataid.attr("data-title"));
                }
            }
            // 最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });


        function CustomRightClick(id) {

            //取消右键  rightMenu属性开始是隐藏的 ，当右击的时候显示，左击的时候隐藏
            $('.layui-tab-title li').on('contextmenu', function () {
                return false;
            })

            $('.layui-tab-title,.layui-tab-title li').click(function () {
                $('.rightMenu').hide();
            });

            //桌面点击右击
            $('.layui-tab-title li').on('contextmenu', function (e) {
                var popupmenu = $(".rightMenu");
                popupmenu.find("li").attr("data-id", id); //在右键菜单中的标签绑定id属性

                //判断右侧菜单的位置
                l = ($(document).width() - e.clientX) < popupmenu.width() ? (e.clientX - popupmenu.width()) : e.clientX;
                t = ($(document).height() - e.clientY) < popupmenu.height() ? (e.clientY - popupmenu.height()) : e.clientY;
                popupmenu.css({left: l, top: t}).show(); //进行绝对定位
                //alert("右键菜单")
                return false;
            });
        }

        $(".rightMenu li").click(function () {

            //右键菜单中的选项被点击之后，判断type的类型，决定关闭所有还是关闭当前。
            if ($(this).attr("data-type") == "closeThis") {
                //如果关闭当前，即根据显示右键菜单时所绑定的id，执行tabDelete
                active.tabDelete($(this).attr("data-id"))
            } else if ($(this).attr("data-type") == "closeAll") {
                var tabtitle = $(".layui-tab-title li");
                var ids = new Array();
                $.each(tabtitle, function (i) {
                    ids[i] = $(this).attr("lay-id");
                })
                //如果关闭所有 ，即将所有的lay-id放进数组，执行tabDeleteAll
                active.tabDeleteAll(ids);
            }

            $('.rightMenu').hide(); //最后再隐藏右键菜单
        })

        // 计算frame高度
        function FrameWH() {
            var h = $(window).height() - 41 - 10 - 60 - 10 - 44 - 10;
            $("iframe").css("height", h + "px");
        }


        $(window).resize(function () {
            FrameWH();
        })


        var layer = layui.layer;
        layer.ready(function () {
            // layer.msg('您已进入页面了！');
            // 触发点击事件，这样就可以设置默认显示的taba
            $("#101").trigger("click");
        });

    });


</script>


</body>

</html>
