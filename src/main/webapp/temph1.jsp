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
            

        </ul>
        
    </div>
    
    
    <div id="container" style="min-width:400px;height:400px"></div>
            <script>
                var chart = Highcharts.chart('container', {
                    chart: {
                        type: 'line'
                    },
                    title: {
                        text: '近50条体表温度数据曲线图'
                    },
                    
                    xAxis: {
                        categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25',
                        '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50']
                    },
                    yAxis: {
                        title: {
                            text: '温度（℃）'
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
                        name: '温度',
                        data: [${userPic.temp[0]}, ${ userPic.temp[1]}, ${userPic.temp[2]}, ${ userPic.temp[3] }, ${ userPic.temp[4] }, ${userPic.temp[5]},
                        	${userPic.temp[6]}, ${userPic.temp[7]}, ${userPic.temp[8]}, ${userPic.temp[9]}, ${userPic.temp[10]},
                        	${userPic.temp[11]}, ${userPic.temp[12]}, ${userPic.temp[13]}, ${userPic.temp[14]}, ${userPic.temp[15]},
                        	${userPic.temp[16]}, ${userPic.temp[17]}, ${userPic.temp[18]}, ${userPic.temp[19]}, ${userPic.temp[20]},
                        	${userPic.temp[21]}, ${userPic.temp[22]}, ${userPic.temp[23]}, ${userPic.temp[24]}, ${userPic.temp[25]},
                        	${userPic.temp[26]}, ${userPic.temp[27]}, ${userPic.temp[28]}, ${userPic.temp[29]}, ${userPic.temp[30]},
                        	${userPic.temp[31]}, ${userPic.temp[32]}, ${userPic.temp[33]}, ${userPic.temp[34]}, ${userPic.temp[35]},
                        	${userPic.temp[36]}, ${userPic.temp[37]}, ${userPic.temp[38]}, ${userPic.temp[39]}, ${userPic.temp[40]},
                            ${userPic.temp[41]}, ${userPic.temp[42]}, ${userPic.temp[43]}, ${userPic.temp[44]}, ${userPic.temp[45]},
                        	${userPic.temp[46]}, ${userPic.temp[47]}, ${userPic.temp[48]}, ${userPic.temp[49]}]
                    }]
                });

            </script>
   

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