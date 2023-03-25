<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>
<style>
#information
{
	width: 600px;
    height: 200px;
    margin: 50px auto;
    overflow: hidden;
     border-style: inset;
}
#information .height
{
	height: 100px;
	float: center;
    overflow: hidden;
    font-size: 32px;
    font-family:fantasy;
    text-align:center;

}
#information .weight1
{
	height: 100px;
	float: center;
    overflow: hidden;
    font-size: 32px;
    font-family:fantasy;
    text-align:center;

}
 #information form div
 {
      width: 600px;
      margin: 0 auto;
      height: 60px;
      border-radius: 3px;
      text-indent: 2em;
      text-align: left; /*文字居中*/
  }
  #information. submit_button
  {
      width: 600px;
      margin: 0 auto;
      height: 60px;
      border-radius: 3px;
      text-indent: 2em;
      button-align: center; /*文字居中*/
  }
            
</style>


<body>
    <div id = information>
        <form action="${pageContext.request.contextPath }/makeInformationServlet" id="changePassword" method="post">
            <div id="height">
                <label for="height">身高</label>
                <input id="height" name="height" type="text" onBlur="checkHeight()" oninput="checkHeight()" placeholder="请输入身高">
                <span class="default" id="heightErr">请输入正确的身高（单位是cm）</span>
            </div>
            <div id="weight1">
                <label for="weight1">体重</label>
                <input type="text" id="weight1" name="weight1" onBlur="checkWeight()" oninput="checkWeight()" placeholder="请输入体重">
                <span class="default" id="weightErr">请输入正确的体重（单位是kg）</span>
            </div>
            <div class="submit_button">
                <input type="submit" value="确认">
            </div>
        </form>
    </div>
    <script type="text/javascript">
        function change(obj) {
            obj.src = "${ctx}/Code?time=" + new Date().getTime();
        }
        function checkForm() {
            var height = checkHeight();
            var weight1 = checkWeight();
            return height && weight1;
        }
        function checkHeight() {
            var height = document.getElementById('height');
            var errPasswd = document.getElementById('heightErr');
            var pattern = /^\w{5,6}$/; //身高要在5-6位
            if (!pattern.test(height.value)) {
                errPasswd.innerHTML = "身高不合规范"
                errPasswd.className = "error"
                return false;
            } else {
                errPasswd.innerHTML = "OK"
                errPasswd.className = "success";
                return true;
            }
        }
        //确认体重
        function checkWeight() {
            var weight = document.getElementById('weight1');
            var errConPasswd = document.getElementById('weightErr');
            var pattern = /^\w{4,5}$/; //身高要在5-6位
            if (!pattern.test(weight.value)) {
                errConPasswd.innerHTML = "体重不合规范"
                errConPasswd.className = "error"
                return false;
            } else {
                errConPasswd.innerHTML = "OK"
                errConPasswd.className = "success";
                return true;
            }
        }
    </script>
</body>
</html>