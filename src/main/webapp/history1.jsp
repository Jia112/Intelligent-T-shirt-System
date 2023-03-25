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
                    
 #showdetails {
        width: 1200px;
        margin: 0 auto;
        //height: 44px;
       // background: red;
        line-height: 44px;
        border-radius: 3px;
    }
    #showdetails.table {
            list-style: none;
            display: flex; /*伸缩布局*/
            //height: 44px;
        }
    #showdetails table tr {
                flex: 1; /*平分*/
                text-align: center; /*文字居中*/
            }
    #showdetails table tr th {
                    color: black;
                    font-size: 13px;
                    font-weight: bold;
                    text-decoration: none;
                }

</style>

<body>
    <%@ include file="/header1.jsp"%>

    <div id="showhistory">
        <ul>
            <li><a href="#"> 将您近期的50条数据绘制成表，如下：</a></li>
            <!-- 需要添加对应的表 -->
        </ul>
    </div>
    <div id = "showdetails">
        <table border="1px">
            <tr>
                <th>序号</th>
                <th>时间点</th>
                <th>温度（℃）</th>
                <th>湿度（%）</th>
                <th>体感温度</th>
                <th>体感等级</th>
                <th>x轴加速度（m/s²）</th>
                <th>y轴加速度（m/s²）</th>
                <th>z轴加速度（m/s²）</th>
                <th>能量损耗</th>
                <th>运动类型</th>
                <th>健康状况</th>
            </tr>
            <c:forEach items="${userPic.num}" var="num">
                <tr>
                    <td><c:out value="${num+1}"></c:out></td>
                    <td><c:out value="${userPic.time[num]}"></c:out></td>
                    <td><c:out value="${userPic.temp[num]}"></c:out></td>
                    <td><c:out value="${userPic.humi[num]}"></c:out></td>
                    <td><c:out value="${userPic.somaTemp[num]}"></c:out></td>
                    <td><c:out value="${userPic.somaKind[num]}"></c:out></td>
                    <td><c:out value="${userPic.xale[num]}"></c:out></td>
                    <td><c:out value="${userPic.yale[num]}"></c:out></td>
                    <td><c:out value="${userPic.zale[num]}"></c:out></td>
                    <td><c:out value="${userPic.energy[num]}"></c:out></td>
                    <td><c:out value="${userPic.sportKind[num]}"></c:out></td>
                    <td><c:out value="${userPic.healthKind[num]}"></c:out></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    
   
   
 
    
</body>
</html>