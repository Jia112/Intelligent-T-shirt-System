<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
    <!--链接外部样式-->
    <link rel="stylesheet" href="style/headerStyle.css">
    <!--设置标签图标-->
    <link href="favicon.ico" rel="shortcut icon">
</head>
<body>
<!--头部-->
<div id="header">
<!--头部登录-->
<div class="header_top">
        <!--中部-->
        <div class="header_top_center">
            <!--中部左侧-->
            <div class="h_top_left">
                爱生活，爱健康
            </div>
            <!--中部右侧-->
            <div class="h_top_right">
            <!-- 做一个判断  判断是否有用户 -->
            <c:if test="${empty user}">
            	<a href="login.jsp">登录</a>
                <a href="regist.jsp">免费注册</a>
            </c:if>
            <c:if test="${!empty user}">
            <!-- 判断用户是否为空 然后取反 -->
            	欢迎：${user.username}
                <a href="${pageContext.request.contextPath }/SignOutServlet">退出</a>
            </c:if>
                <a href="myroom.jsp">我的空间</a>
            </div>
        </div>
</div>

<!--中部搜索-->
<div class="header_center">
    <!--版心-->
    <div class="h_c_center">

        <!--左侧logo-->
        <div class="h_c_logo">
            <img src="images/log.png" alt="">
        </div>

        <!--中部搜索-->
        <div class="h_c_search">
        健康生活每一天！
        </div>
    </div>
</div>
 

</div>
    