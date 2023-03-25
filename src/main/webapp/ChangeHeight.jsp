<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>

<style>
#heightshow
{
	width: 600px;
    height: 200px;
    margin: 50px auto;
    overflow: hidden;
     border-style: inset;
}
#heightshow .height
{
	height: 100px;
	float: center;
    overflow: hidden;
    font-size: 32px;
    font-family:fantasy;
    text-align:center;

}
 #heightshow form div
 {
      width: 600px;
      margin: 0 auto;
      height: 60px;
      border-radius: 3px;
      text-indent: 2em;
      text-align: left; /*文字居中*/
  }
  #heightshow. submit_button
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
    <div id = heightshow>
    <div class = "height">
    修改身高
    </div>
        <form action="${pageContext.request.contextPath }/changeHeightServlet" id="changeHeight" method="post">
            <div id="newHeight">
                <label for="newHeight">身高</label>
                <input id="newHeight" name="newHeight" type="text" onBlur="checkHeight()"  oninput="checkHeight()" placeholder="请输入新的身高">
                <span class="default" id="passwordErr">请输入正确的新的身高（单位cm）</span>
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
            var height = checkHeight();
            return height;
        }
        function checkHeight() {
            var height = document.getElementById('newHeight');
            var errPasswd = document.getElementById('passwordErr');
            var pattern = ^[0-9]+(.[0-9]{2})?$  ; //身高要在5-6位
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
    </script>
    
    
    
</body>
</html>