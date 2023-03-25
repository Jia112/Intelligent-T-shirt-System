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
                    font-size: 24px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    
    
</style>

<body>
    <%@ include file="/header1.jsp"%>

    <div id="showhealth">
        <ul>
            <li><a href="#"> 当前健康状况：${userenergy.healthKind}</a></li>

            <!-- 如果当前健康状况是差的，则弹窗提醒：alert("当前健康状况较差，请及时注意"); -->

        </ul>
    </div>
    <div id="picture">
        <ul>
            <li><a href="#"> 近几天内健康状况表：如下</a></li>
        </ul>
    </div>

    <div id = "showdetails">
        <table border="1px">
            <tr>
            	<th>序号</th>
                <th>时间点</th>
                <th>体感温度</th>
                <th>体感等级</th>
                <th>运动类型</th>
                <th>健康状态</th>
            </tr>
            <c:forEach items="${userPic.num}" var="num">
                <tr>
                	<td><c:out value="${num+1}"></c:out></td>
                	<td><c:out value="${userPic.time[num]}"></c:out></td>
                    <td><c:out value="${userPic.somaTemp[num]}"></c:out></td>
                    <td><c:out value="${userPic.somaKind[num]}"></c:out></td>
                    <td><c:out value="${userPic.sportKind[num]}"></c:out></td>
                    <td><c:out value="${userPic.healthKind[num]}"></c:out></td>
                </tr>
            </c:forEach>
        </table>
    </div>
   

</body>
</html>