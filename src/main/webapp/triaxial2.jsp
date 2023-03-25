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
                text-align: left; /*文字居中*/
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
            <li><a href="${pageContext.request.contextPath }/DrawPicTrialServlet"> 点击查看</a></li>
        </ul>
</div>


    </div>

    <div id="picture2">
        <ul>
            <li><a href="#"> 近期动能消耗是否达标：${userenergy.weatherArrive}</a></li>
        </ul>
    </div>

    <div id="picture3">
        <ul>
            <li><a href="#"> 近期最爱做的运动：${userenergy.favoriteKind}</a></li>
            <!-- 需要插入图吗 -->

        </ul>
    </div>
    <div id="container" style="min-width:400px;height:400px"></div>
    <script>
        Highcharts.chart('container', {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: '最近最爱做的运动'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                name: 'Brands',
                colorByPoint: true,
                data: [{
                    name: '未知运动',
                    y: ${ userPic.precentKind[0] },
                    sliced: true,
                    selected: true
                }, {
                    name: '平躺',
                    y: ${ userPic.precentKind[1] }
                }, {
                    name: '坐着工作',
                    y: ${ userPic.precentKind[2] }
                }, {
                    name: '站立',
                    y: ${ userPic.precentKind[3] }
                }, {
                    name: '走路',
                    y: ${ userPic.precentKind[4] }
                }, {
                    name: '跑步',
                    y: ${ userPic.precentKind[5] }
                }, {
                    name: '上楼梯',
                    y: ${ userPic.precentKind[6] }
                }]
           //画图时无法显示上下楼梯，经测试应该是被覆盖了
            }]
        });
    </script>
    
</body>
</html>