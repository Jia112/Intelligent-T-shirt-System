<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>
<style>
#getpwd
{
	width: 600px;
    height: 200px;
    margin: 50px auto;
    overflow: hidden;
     border-style: inset;
     margin-top: 160px;
}

 #getpwd form div
 {
      width: 600px;
      margin: 0 auto;
      height: 60px;
      border-radius: 3px;
      text-indent: 2em;
      text-align: left; /*文字居中*/
  }
  #getpwd. submit_button
  {
      width: 600px;
      margin: 0 auto;
      height: 60px;
      border-radius: 3px;
      text-indent: 2em;
      text-align: right; /*文字居中*/
  }
  #getpwd div ul li
  {
   	  width: 600px;
      margin: 0 auto;
      height: 60px;
      border-radius: 3px;
      text-indent: 2em;
      text-align: left; /*文字居中*/
  }
</style>
<body>
    <div id = getpwd>
        <form action="${pageContext.request.contextPath }/forgetPasswordServlet" id="forgetPassword" method="post">
            <div id="username">
                <label for="username">用户名</label>
                <input id="username" name="username" type="text" onBlur="checkUsername()" oninput="checkUsername()" placeholder="请输入用户名">
                <span class="default" id="nameErr">请输入(5-20位)正确的用户名</span>
            </div>
            <div class="submit_button">
                <input type="submit" value="点击查询">
            </div>
        </form>
        <div>
            <ul>
                <li><a href="forgetUsername.jsp">忘记用户名</a></li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
        function change(obj) {
            obj.src = "${ctx}/Code?time=" + new Date().getTime();
        }
        function checkForm() {
            var username = checkUsername();
            return username;
        }
        function checkUsername() {
            var username2 = document.getElementById('username');
            var errname = document.getElementById('nameErr');
            var pattern = /^\w{5,20}$/; //用户名格式正则表达式：用户名要求5-20位
            if (username2.value.length == 0) {
                errname.innerHTML = "用户名不能为空"
                errname.className = "error"
                return false;
            }
            if (!pattern.test(username2.value)) {
                errname.innerHTML = "用户名不合规范"
                errname.className = "error"
                return false;
            } else {
                errname.innerHTML = "OK"
                errname.className = "success";
                return true;
            }
        }
    </script>
</body>
</html>