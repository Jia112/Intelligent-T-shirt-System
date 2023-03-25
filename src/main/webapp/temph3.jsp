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

            <!-- 需要添加对应的图 -->
            <li><a href="${pageContext.request.contextPath }/DrawPicHumiServlet"> 点击查看</a></li>
            
        </ul>
    </div>

    <div id="picture3">
        <ul>
            <li><a href="#"> 近期体感温度变化曲线图：</a></li>            
        </ul>
    </div>
    
    <div id="container" style="min-width:400px;height:400px"></div>
            <script>
                var chart = Highcharts.chart('container', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: '近50条体感温度数据曲线图'
                    },
                    xAxis: {
                        categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25',
                            '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50']
                    },
                    yAxis: {
                        title: {
                            text: '体感温度（%）'
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
                        name: '体感温度',
                        data: [${userPic.somaTemp[0]}, ${ userPic.somaTemp[1]}, ${userPic.somaTemp[2]}, ${ userPic.somaTemp[3] }, ${ userPic.somaTemp[4] }, ${userPic.somaTemp[5]},
                        	${userPic.somaTemp[6]}, ${userPic.somaTemp[7]}, ${userPic.somaTemp[8]}, ${userPic.somaTemp[9]}, ${userPic.somaTemp[10]},
                        	${userPic.somaTemp[11]}, ${userPic.somaTemp[12]}, ${userPic.somaTemp[13]}, ${userPic.somaTemp[14]}, ${userPic.somaTemp[15]},
                        	${userPic.somaTemp[16]}, ${userPic.somaTemp[17]}, ${userPic.somaTemp[18]}, ${userPic.somaTemp[19]}, ${userPic.somaTemp[20]},
                        	${userPic.somaTemp[21]}, ${userPic.somaTemp[22]}, ${userPic.somaTemp[23]}, ${userPic.somaTemp[24]}, ${userPic.somaTemp[25]},
                        	${userPic.somaTemp[26]}, ${userPic.somaTemp[27]}, ${userPic.somaTemp[28]}, ${userPic.somaTemp[29]}, ${userPic.somaTemp[30]},
                        	${userPic.somaTemp[31]}, ${userPic.somaTemp[32]}, ${userPic.somaTemp[33]}, ${userPic.somaTemp[34]}, ${userPic.somaTemp[35]},
                        	${userPic.somaTemp[36]}, ${userPic.somaTemp[37]}, ${userPic.somaTemp[38]}, ${userPic.somaTemp[39]}, ${userPic.somaTemp[40]},
                            ${userPic.somaTemp[41]}, ${userPic.somaTemp[42]}, ${userPic.somaTemp[43]}, ${userPic.somaTemp[44]}, ${userPic.somaTemp[45]},
                        	${userPic.somaTemp[46]}, ${userPic.somaTemp[47]}, ${userPic.somaTemp[48]}, ${userPic.somaTemp[49]}]
                    }]
                });

            </script>
    
   
</body>
</html>