<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>

<style>
#weightshow
{
	width: 600px;
    height: 300px;
    margin: 50px auto;
    overflow: hidden;
     border-style: inset;
}

#weightshow .weight
{
	height: 100px;
	float: center;
    overflow: hidden;
    font-size: 32px;
    font-family:fantasy;
    text-align:center;
}


 #weightshow form div
 {
      width: 600px;
      margin: 0 auto;
      height: 60px;
      border-radius: 3px;
      text-indent: 2em;
      font-size: 20px;
      text-align: left; /*文字居中*/
  }
  #weightshow. submit_button
  {
      width: 600px;
      margin: 0 auto;
      height: 60px;
      border-radius: 3px;
      text-indent: 2em;
      font-size: 20px;
      text-align: right; /*文字居中*/
  }
            


</style>

<body>
    <div id = weightshow>
    <div class = "weight">
    修改体重
    </div>
        <form action="${pageContext.request.contextPath }/changeWeightServlet" id="changeWeight" method="post">
            <div id="newWeight">
                <label for="newWeight">体重</label>
                <input id="newWeight" name="newWeight" type="text" onBlur="checkWeight()" oninput="checkWeight()" placeholder="请输入新的体重">
                <span class="default" id="passwordErr">请输入正确的新的体重（单位kg）</span>
            </div>
            <div id="submit_button">
                <input type="submit" value="确认">
            </div>
        </form>
    </div>
    <script type="text/javascript">
        function change(obj) {
            obj.src = "${ctx}/Code?time=" + new Date().getTime();
        }
        function checkForm() {
            var weight = checkWeight();
            return weight;
        }
        function checkWeight() {
            var weight = document.getElementById('newWeight');
            var errPasswd = document.getElementById('passwordErr');
            var pattern = /^\w{4,5}$/; //体重要在4-5位
            if (!pattern.test(weight.value)) {
                errPasswd.innerHTML = "体重不合规范"
                errPasswd.className = "error"
                return false;
            } else {
                errPasswd.innerHTML = "OK"
                errPasswd.className = "success";
                return true;
            }
        }
    </script>
</body>
</html>