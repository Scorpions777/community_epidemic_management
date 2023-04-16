<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <!-- custom-theme -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //custom-theme -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- js -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <!-- //js -->
    <!-- font-awesome icons -->
    <link href="${pageContext.request.contextPath}/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Alfa+Slab+One" rel="stylesheet">
</head>
<body>
<div class="main">
    <canvas id="myCanvas"></canvas>
    <div class="agileinfo_404_main">
        <h1>发生错误</h1>
        <div class="w3_agile_main">
            <span>${msg}</span>
            <p>For some reason the page you requested could not be found on Our server.</p>
            <div class="agile_404 w3layouts">
                <div class="agile_404_pos">
                    <h3>4<span>0</span>4<img src="${pageContext.request.contextPath}/images/1.png" alt=" " /> </h3>
                </div>
                <img src="${pageContext.request.contextPath}/images/3.png" alt=" " class="w3l"/>
            </div>
        </div>
        <div class="agileits_w3layouts_nav">
            <div class="w3_agileits_nav_left w3">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="clear"> </div>
        </div>
        <div class="agileits_copyright">
            <p>Copyright &copy; 2017.Company name All rights reserved.More Templates <a href="" target="_blank" title="">工资管理</a></p>
        </div>
    </div>
</div>

<script>
    window.onload = function() {
        Particles.init({
            selector: '#myCanvas',
            color: '#6b6b6b',
            connectParticles: true,
            minDistance: 100
        });
    };
</script>
</body>
</html>