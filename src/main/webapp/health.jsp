<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>

<style>
    #showhealth {
        width: 1200px;
        margin: 0 auto;
        height: 44px;
        background: red;
        line-height: 44px;
        border-radius: 3px;
    }

        #showhealth ul {
            list-style: none;
            display: flex; /*伸缩布局*/
            height: 44px;
        }

            #showhealth ul li {
                flex: 1; /*平分*/
                text-align: center; /*文字居中*/
            }

                #showhealth ul li a {
                    color: white;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    #showhealth ul li a:hover {
                        font-size: 24px;
                    }

    #picture {
        width: 1200px;
        margin: 0 auto;
        height: 44px;
        //background: red;
        line-height: 44px;
        border-radius: 3px;
    }

        #picture ul {
            list-style: none;
            display: flex; /*伸缩布局*/
            height: 44px;
        }

            #picture ul li {
                flex: 1; /*平分*/
                text-align: center; /*文字居中*/
            }

                #picture ul li a {
                    color: black;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    #picture ul li a:hover {
                        font-size: 24px;
                    }
</style>

<body>
    <%@ include file="/header1.jsp"%>

    <div id="showhealth">
        <ul>
            <li><a herf="#"> 当前健康状况：${userenergy.healthKind}</a></li>

            <!-- 如果当前健康状况是差的，则弹窗提醒：alert("当前健康状况较差，请及时注意"); -->

        </ul>
    </div>
    <div id="picture">
        <ul>
            <li><a href="#"> 近几天内健康状况表：</a></li>
            <li><a href="${pageContext.request.contextPath }/DrawPicHealthKindServlet">查看详情</a></li>

            <!-- 给出表 -->

        </ul>
    </div>
    

</body>
</html>