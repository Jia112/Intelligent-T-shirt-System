<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="https://jscdn.com.cn/highcharts/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>爱生活，爱健康</title>
    <script src="https://cdn.highcharts.com.cn/highcharts/highcharts.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/exporting.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/modules/oldie.js"></script>
    <script src="https://code.highcharts.com.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/themes/grid-light.js"></script>
    <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
    <script src="https://cdn.highcharts.com.cn/highcharts/themes/sand-signika.js"></script>
</head>

<style>
    #showxial {
        width: 1200px;
        margin: 0 auto;
        height: 44px;
        background: red;
        line-height: 44px;
        border-radius: 3px;
    }

        #showxial ul {
            list-style: none;
            display: flex; /*伸缩布局*/
            height: 44px;
        }

            #showxial ul li {
                flex: 1; /*平分*/
                text-align: center; /*文字居中*/
            }

                #showxial ul li a {
                    color: white;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    #showxial ul li a:hover {
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
                        font-size: 16px;
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
                text-align: left; /*文字靠左边显示*/
            }

                #picture2 ul li a {
                    color: black;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    #picture2 ul li a:hover {
                        font-size: 16px;
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
                text-align: left; /*文字靠左边显示*/
            }

                #picture3 ul li a {
                    color: black;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    #picture3 ul li a:hover {
                        font-size: 16px;
                    }
</style>

<body>

    <%@ include file="/header1.jsp"%>
    <div id="showxial">
        <ul>
            <li><a href="#">x轴加速度：${userenergy.xale}</a></li>
            <li><a href="#">y轴加速度：${userenergy.yale}</a></li>
            <li><a href="#">z轴加速度：${userenergy.zale}</a></li>
            <li><a href="#">合成加速度：${userenergy.synale}</a></li>
            <li><a href="#">能量消耗：${userenergy.energy}</a></li>
            <li><a href="#">运动类型：${userenergy.sportKind}</a></li>
        </ul>
    </div>

    <div id="picture1">
        <ul>
            <li><a href="#"> 近期三轴加速度变化曲线图：</a></li>

        </ul>
    </div>
    <div id="container" style="min-width:400px;height:400px"></div>
    <script>
        var chart = Highcharts.chart('container', {
            chart: {
                type: 'line'
            },
            title: {
                text: '近50条三轴加速度数据曲线图'
            },
            xAxis: {
                categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25',
                    '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50']
            },
            yAxis: {
                title: {
                    text: '三轴加速度（m/s²）'
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
                name: 'x轴加速度',
                data: [${ userPic.xale[0] }, ${ userPic.xale[1] }, ${ userPic.xale[2] }, ${ userPic.xale[3] }, ${ userPic.xale[4] }, ${ userPic.xale[5] },
                    ${ userPic.xale[6] }, ${ userPic.xale[7] }, ${ userPic.xale[8] }, ${ userPic.xale[9] }, ${ userPic.xale[10] },
                    ${ userPic.xale[11] }, ${ userPic.xale[12] }, ${ userPic.xale[13] }, ${ userPic.xale[14] }, ${ userPic.xale[15] },
                    ${ userPic.xale[16] }, ${ userPic.xale[17] }, ${ userPic.xale[18] }, ${ userPic.xale[19] }, ${ userPic.xale[20] },
                    ${ userPic.xale[21] }, ${ userPic.xale[22] }, ${ userPic.xale[23] }, ${ userPic.xale[24] }, ${ userPic.xale[25] },
                    ${ userPic.xale[26] }, ${ userPic.xale[27] }, ${ userPic.xale[28] }, ${ userPic.xale[29] }, ${ userPic.xale[30] },
                    ${ userPic.xale[31] }, ${ userPic.xale[32] }, ${ userPic.xale[33] }, ${ userPic.xale[34] }, ${ userPic.xale[35] },
                    ${ userPic.xale[36] }, ${ userPic.xale[37] }, ${ userPic.xale[38] }, ${ userPic.xale[39] }, ${ userPic.xale[40] },
                    ${ userPic.xale[41] }, ${ userPic.xale[42] }, ${ userPic.xale[43] }, ${ userPic.xale[44] }, ${ userPic.xale[45] },
                    ${ userPic.xale[46] }, ${ userPic.xale[47] }, ${ userPic.xale[48] }, ${ userPic.xale[49] }]
            }, {
                name: 'y轴加速度',
                data: [${ userPic.yale[0] }, ${ userPic.yale[1] }, ${ userPic.yale[2] }, ${ userPic.yale[3] }, ${ userPic.yale[4] }, ${ userPic.yale[5] },
                    ${ userPic.yale[6] }, ${ userPic.yale[7] }, ${ userPic.yale[8] }, ${ userPic.yale[9] }, ${ userPic.yale[10] },
                    ${ userPic.yale[11] }, ${ userPic.yale[12] }, ${ userPic.yale[13] }, ${ userPic.yale[14] }, ${ userPic.yale[15] },
                    ${ userPic.yale[16] }, ${ userPic.yale[17] }, ${ userPic.yale[18] }, ${ userPic.yale[19] }, ${ userPic.yale[20] },
                    ${ userPic.yale[21] }, ${ userPic.yale[22] }, ${ userPic.yale[23] }, ${ userPic.yale[24] }, ${ userPic.yale[25] },
                    ${ userPic.yale[26] }, ${ userPic.yale[27] }, ${ userPic.yale[28] }, ${ userPic.yale[29] }, ${ userPic.yale[30] },
                    ${ userPic.yale[31] }, ${ userPic.yale[32] }, ${ userPic.yale[33] }, ${ userPic.yale[34] }, ${ userPic.yale[35] },
                    ${ userPic.yale[36] }, ${ userPic.yale[37] }, ${ userPic.yale[38] }, ${ userPic.yale[39] }, ${ userPic.yale[40] },
                    ${ userPic.yale[41] }, ${ userPic.yale[42] }, ${ userPic.yale[43] }, ${ userPic.yale[44] }, ${ userPic.yale[45] },
                    ${ userPic.yale[46] }, ${ userPic.yale[47] }, ${ userPic.yale[48] }, ${ userPic.yale[49] }]
            }, {
                name: 'z轴加速度',
                data: [${ userPic.zale[0] }, ${ userPic.zale[1] }, ${ userPic.zale[2] }, ${ userPic.zale[3] }, ${ userPic.zale[4] }, ${ userPic.zale[5] },
                    ${ userPic.zale[6] }, ${ userPic.zale[7] }, ${ userPic.zale[8] }, ${ userPic.zale[9] }, ${ userPic.zale[10] },
                    ${ userPic.zale[11] }, ${ userPic.zale[12] }, ${ userPic.zale[13] }, ${ userPic.zale[14] }, ${ userPic.zale[15] },
                    ${ userPic.zale[16] }, ${ userPic.zale[17] }, ${ userPic.zale[18] }, ${ userPic.zale[19] }, ${ userPic.zale[20] },
                    ${ userPic.zale[21] }, ${ userPic.zale[22] }, ${ userPic.zale[23] }, ${ userPic.zale[24] }, ${ userPic.zale[25] },
                    ${ userPic.zale[26] }, ${ userPic.zale[27] }, ${ userPic.zale[28] }, ${ userPic.zale[29] }, ${ userPic.zale[30] },
                    ${ userPic.zale[31] }, ${ userPic.zale[32] }, ${ userPic.zale[33] }, ${ userPic.zale[34] }, ${ userPic.zale[35] },
                    ${ userPic.zale[36] }, ${ userPic.zale[37] }, ${ userPic.zale[38] }, ${ userPic.zale[39] }, ${ userPic.zale[40] },
                    ${ userPic.zale[41] }, ${ userPic.zale[42] }, ${ userPic.zale[43] }, ${ userPic.zale[44] }, ${ userPic.zale[45] },
                    ${ userPic.zale[46] }, ${ userPic.zale[47] }, ${ userPic.zale[48] }, ${ userPic.zale[49] }]
            }]
        });

    </script>



    <div id="picture2">
        <ul>
            <li><a href="#"> 近期动能消耗是否达标：${userenergy.weatherArrive}</a></li>
        </ul>
    </div>

    <div id="picture3">
        <ul>
            <li><a href="#"> 近期最爱做的运动：${userenergy.favoriteKind}</a></li>
            <!-- 需要插入图吗 -->
            <li><a href="${pageContext.request.contextPath }/DrawPicTrial1Servlet"> 点击查看</a></li>
        </ul>
    </div>
    
    
</body>
</html>