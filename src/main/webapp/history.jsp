<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>

<style>
    #showhistory {
        width: 1200px;
        margin: 0 auto;
        height: 44px;
        background: red;
        line-height: 44px;
        border-radius: 3px;
    }

        #showhistory ul {
            list-style: none;
            display: flex; /*伸缩布局*/
            height: 44px;
        }

            #showhistory ul li {
                flex: 1; /*平分*/
                text-align: center; /*文字居中*/
            }

                #showhistory ul li a {
                    color: white;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    #showhistory ul li a:hover {
                        font-size: 24px;
                    }
</style>

<body>
    <%@ include file="/header1.jsp"%>

    <div id="showhistory">
        <ul>
            <li><a href="#"> 将您近期的50条数据绘制成表，如下：</a></li>
            <li><a href="${pageContext.request.contextPath }/DrawPicHistoryServlet">点击查看</a></li>
            <!-- 需要添加对应的表 -->
        </ul>
    </div>
    
</body>
</html>