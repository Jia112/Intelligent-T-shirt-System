<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="${ctx}style/index.css">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>
<body>
    <%@ include file="/header.jsp"%>
    <!--宣传页-->
    <div>
        <c:if test="${empty userweight.weight}">
            </c:if>
            <c:if test="${empty userheight.height}">
            </c:if>
    </div>
    <script type="text/javascript">
    if(${userweight.weight} == 0.0 || ${userheight.height} == 0.0)
    	{
    	  	alert('身高体重数据未补全，请跳转补全数据');
    		window.location.href="${pageContext.request.contextPath }/makeInformation.jsp";
    	}
   
</script>



    <div id="ad">
        <img src="images/ad.jpg" alt="">
    </div>
    <div id="ms">

        <div class="ms_title">
            <span>信息汇总</span>
        </div>

        <div class="ms_body">
            <ul>
                <li>
                    <a href="detail.jsp">
                        <p>温度：${userInformation.temp}</p>
                        <p>湿度：${userInformation.humi}</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <p>体感温度：${userInformation.somatempa}</p>
                        <p>体表感觉：${userInformation.somaKind}</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <p>当前三轴加速度</p>
                        <p>x轴：${userenergy.xale}</p>
                        <p>y轴：${userenergy.yale}</p>
                        <p>z轴：${userenergy.zale}</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <p>能量消耗：${userenergy.energy}J</p>
                        <p>所处运动状态：${userenergy.sportKind}</p>
                    </a>
                </li>
                <li>
                    <a href="">
                        <p>目前健康状况：${userenergy.healthKind}</p>
                    </a>
                </li>
            </ul>
        </div>

    </div>
    
</body>
</html>