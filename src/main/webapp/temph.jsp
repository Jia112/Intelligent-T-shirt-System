<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>爱生活，爱健康</title>
    <style>
        #showtemph {
            width: 1200px;
            margin: 0 auto;
            height: 44px;
            background: red;
            line-height: 44px;
            border-radius: 3px;
        }

            #showtemph ul {
                list-style: none;
                display: flex; /*伸缩布局*/
                height: 44px;
            }

                #showtemph ul li {
                    flex: 1; /*平分*/
                    text-align: center; /*文字居中*/
                }

                    #showtemph ul li a {
                        color: white;
                        font-size: 16px;
                        font-weight: bold;
                        text-decoration: none;
                    }

                        #showtemph ul li a:hover {
                            font-size: 24px;
                        }


        #picture1 {
            width: 1200px;
            margin: 0 auto;
            height: 44px;
            //background: red;
            line-height: 44px;
            border-radius: 3px;
        }

            #picture1 ul {
                list-style: none;
                display: flex; /*伸缩布局*/
                height: 44px;
            }

                #picture1 ul li {
                    flex: 1; /*平分*/
                    text-align: center; /*文字居中*/
                }

                    #picture1 ul li a {
                        color: black;
                        font-size: 16px;
                        font-weight: bold;
                        text-decoration: none;
                    }

                        #picture1 ul li a:hover {
                            font-size: 24px;
                        }

        #picture2 {
            width: 1200px;
            margin: 0 auto;
            height: 44px;
            //background: red;
            line-height: 44px;
            border-radius: 3px;
        }

            #picture2 ul {
                list-style: none;
                display: flex; /*伸缩布局*/
                height: 44px;
            }

                #picture2 ul li {
                    flex: 1; /*平分*/
                    text-align: center; /*文字居中*/
                }

                    #picture2 ul li a {
                        color: black;
                        font-size: 16px;
                        font-weight: bold;
                        text-decoration: none;
                    }

                        #picture2 ul li a:hover {
                            font-size: 24px;
                        }

        #picture3 {
            width: 1200px;
            margin: 0 auto;
            height: 44px;
            //background: red;
            line-height: 44px;
            border-radius: 3px;
        }

            #picture3 ul {
                list-style: none;
                display: flex; /*伸缩布局*/
                height: 44px;
            }

                #picture3 ul li {
                    flex: 1; /*平分*/
                    text-align: center; /*文字居中*/
                }

                    #picture3 ul li a {
                        color: black;
                        font-size: 16px;
                        font-weight: bold;
                        text-decoration: none;
                    }

                        #picture3 ul li a:hover {
                            font-size: 24px;
                        }
    </style>
    <script src="https://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/oldie.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/themes/grid-light.js"></script>
</head>



<body>
    <%@ include file="/header1.jsp"%>


    <div id="showtemph">
        <ul>
            <li><a href="#">当前温度：${userInformation.temp}</a></li>
            <li><a href="#">当前湿度：${userInformation.humi}</a></li>
            <li><a href="#">当前体感温度：${userInformation.somatempa}</a></li>
            <li><a href="#">人体热感觉：${userInformation.somaKind}</a></li>
        </ul>
    </div>

    <div id="picture1">
        <ul>
            <li><a href="#"> 近期温度变化曲线图：</a></li>

            <!-- 需要添加对应的图 -->
            <li><a href="${pageContext.request.contextPath }/DrawPicTempServlet"> 点击查看</a></li>
        </ul>
    </div>

    <div id="picture2">
        <ul>
            <li><a href="#"> 近期湿度变化曲线图：</a></li>

            <!-- 需要添加对应的图 -->
            <li><a href="${pageContext.request.contextPath }/DrawPicHumiServlet"> 点击查看</a></li>
        </ul>
    </div>

    <div id="picture3">
        <ul>
            <li><a href="#"> 近期体感温度变化曲线图：</a></li>

            <!-- 需要添加对应的图 -->
            <li><a href="${pageContext.request.contextPath }/DrawPicSomaTempServlet"> 点击查看</a></li>
        </ul>
    </div>
    
</body>
</html>