<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>

<style>
    #showroom {
        width: 1200px;
        margin: 0 auto;
        height: 44px;
        background: red;
        line-height: 44px;
        border-radius: 3px;
    }

        #showroom ul {
            list-style: none;
            display: flex; /*伸缩布局*/
            height: 44px;
        }

            #showroom ul li {
                flex: 1; /*平分*/
                text-align: center; /*文字居中*/
            }

                #showroom ul li a {
                    color: white;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    #showroom ul li a:hover {
                        font-size: 16px;
                    }

    #showroom2 {
        width: 1200px;
        margin: 0 auto;
        height: 44px;
        //background: red;
        line-height: 44px;
        border-radius: 3px;
    }

        #showroom2 ul {
            list-style: none;
            //display: flex; /*伸缩布局*/
            height: 44px;
        }

            #showroom2 ul li {
                //flex: 1; /*平分*/
                text-align: left; /*文字居中*/
            }

                #showroom2 ul li a {
                    color: black;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    #showroom2 ul li a:hover {
                        font-size: 16px;
                    }
</style>

<body>
    <%@ include file="/header1.jsp"%>
    <div id="showroom">
        <ul>
            <li><a href="myroom.jsp"> 首页</a></li>
            <li><a href="myroom2.jsp"> 我的信息</a></li>
        </ul>
    </div>
    <div id="showroom2">
        <ul>
            <li><a href="#"> 用户名：${ user.username }</a></li>
            <li>
                密码：******
                
                 <a href="${pageContext.request.contextPath }/myroom1.jsp"><i class="fa fa-eye-slash"></i></a>
                
                <a href="ChangePasswd.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改密码</a>
            </li>
            <li>身高：${ userheight.height }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ChangeHeight.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改身高</a></li>
            <li>体重：${ userweight.weight }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="ChangeWeight.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改体重</a></li>
            <li><a href="#"> 健康状况：${ userenergy.healthKind }</a></li>
            <li><a href="#"> 能量消耗：${ userenergy.energy }</a></li>
            <li><a href="#"> 常做运动：${ userenergy.favoriteKind }</a></li>
            <li><a href="#"> 推荐运动：${ userenergy.suggestSport }</a></li>
        </ul>
    </div>
</body>
</html>