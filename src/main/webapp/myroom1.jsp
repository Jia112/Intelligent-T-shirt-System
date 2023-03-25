<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
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

    #showroom1 {
        width: 1200px;
        margin: 0 auto;
        height: 44px;
        //background: red;
        line-height: 44px;
        border-radius: 3px;
    }

        #showroom1 ul {
            list-style: none;
            //display: flex; /*伸缩布局*/
            height: 44px;
        }

            #showroom1 ul li {
                //flex: 1; /*平分*/
                text-align: left; /*文字居中*/
            }

                #showroom1 ul li a {
                    color: black;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    #showroom1 ul li a:hover {
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
                text-align: right; /*文字居中*/
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
    <div id="showroom1">
        <ul>
            <li><a href="#">用户名：${ user.username }</a></li>
            <li>
               <a href="#" >密码:${user.password}</a>
               
               <a href="${pageContext.request.contextPath }/myroom.jsp"><i class="fa fa-eye"></i></a>
           
            </li>
        </ul>
    </div>
    <div id="showroom2">
        <ul>
            <li><a href="ChangePasswd.jsp">修改密码</a></li>
        </ul>
    </div>

</body>
</html>