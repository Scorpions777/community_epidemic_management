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
<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <c:forEach items="${news}" var="item">
            <div class="layui-col-md6">
                <div class="layui-card">
                    <div class="layui-card-header">${item.title}</div>
                    <div class="layui-card-body">${item.content}</div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
