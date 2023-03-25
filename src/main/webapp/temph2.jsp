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
            <li><a href="${pageContext.request.contextPath }/DrawPicTempServlet"> 点击查看</a></li>
        </ul>
    </div>

    <div id="picture2">
        <ul>
            <li><a href="#"> 近期湿度变化曲线图：</a></li>
        </ul>
    </div>

<div id="container" style="min-width:400px;height:400px"></div>
            <script>
                var chart = Highcharts.chart('container', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: '近50条体表湿度数据曲线图'
                    },
                    xAxis: {
                        categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25',
                            '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50']
                    },
                    yAxis: {
                        title: {
                            text: '湿度（%）'
                        }
                    },
                    plotOptions: {
                        line: {
                            dataLabels: {
                                // 开启数据标签
                                enabled: true
                            },
                            // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                            enableMouseTracking: false
                        }
                    },
                    series: [{
                        name: '湿度',
                        data: [${userPic.humi[0]}, ${ userPic.humi[1]}, ${userPic.humi[2]}, ${ userPic.humi[3] }, ${ userPic.humi[4] }, ${userPic.humi[5]},
                        	${userPic.humi[6]}, ${userPic.humi[7]}, ${userPic.humi[8]}, ${userPic.humi[9]}, ${userPic.humi[10]},
                        	${userPic.humi[11]}, ${userPic.humi[12]}, ${userPic.humi[13]}, ${userPic.humi[14]}, ${userPic.humi[15]},
                        	${userPic.humi[16]}, ${userPic.humi[17]}, ${userPic.humi[18]}, ${userPic.humi[19]}, ${userPic.humi[20]},
                        	${userPic.humi[21]}, ${userPic.humi[22]}, ${userPic.humi[23]}, ${userPic.humi[24]}, ${userPic.humi[25]},
                        	${userPic.humi[26]}, ${userPic.humi[27]}, ${userPic.humi[28]}, ${userPic.humi[29]}, ${userPic.humi[30]},
                        	${userPic.humi[31]}, ${userPic.humi[32]}, ${userPic.humi[33]}, ${userPic.humi[34]}, ${userPic.humi[35]},
                        	${userPic.humi[36]}, ${userPic.humi[37]}, ${userPic.humi[38]}, ${userPic.humi[39]}, ${userPic.humi[40]},
                            ${userPic.humi[41]}, ${userPic.humi[42]}, ${userPic.humi[43]}, ${userPic.humi[44]}, ${userPic.humi[45]},
                        	${userPic.humi[46]}, ${userPic.humi[47]}, ${userPic.humi[48]}, ${userPic.humi[49]}]
                    }]
                });

            </script>

    <div id="picture3">
        <ul>
            <li><a href="#"> 近期体感温度变化曲线图：</a></li>

            <!-- 需要添加对应的图 -->
            <li><a href="${pageContext.request.contextPath }/DrawPicSomaTempServlet"> 点击查看</a></li>
        </ul>
    </div>

</body>
</html>