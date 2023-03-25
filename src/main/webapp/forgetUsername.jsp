<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>
<style>
#getname
{
	width: 600px;
    height: 200px;
    margin: 50px auto;
    overflow: hidden;
     border-style: inset;
     margin-top:160px;
}

 #getname form div
 {
      width: 600px;
      margin: 0 auto;
      height: 60px;
      border-radius: 3px;
      text-indent: 2em;
      text-align: left; /*文字居中*/
  }
  #getname. submit_button
  {
      width: 600px;
      margin: 0 auto;
      height: 60px;
      border-radius: 3px;
      text-indent: 2em;
      text-align: right; /*文字居中*/
  }
            
            


</style>
<body>
    <div id = getname>
        <form action="${pageContext.request.contextPath }/forgetUsernameServlet" id="forgetUsername" method="post">
            <div >
                <label for="userPhone">电话号码</label>
                <input id="userPhone" name="userPhone" type="text" onBlur="checkPhone()" oninput="checkPhone()" placeholder="请输入电话号码">
                <span class="default" id="phoneErr">请输入(11位)正确的电话</span>
                <!--需要添加验证亲密号的步骤-->
               </div>
               <div>
                <label for="userRelativePhone">亲密号码</label>
                <input id="userRelativePhone" name="userRelativePhone" type="text" onBlur="checkRelativePhone()" oninput="checkRelativePhone()" placeholder="请输入亲密号码">
                <span class="default" id="RelativePhoneErr">请输入(11位)正确的亲密电话</span>
            </div>
            <div class="submit_button">
                <input type="submit" value="点击查询">
            </div>
        </form>
        
    </div>
    <script type="text/javascript">
        function change(obj) {
            obj.src = "${ctx}/Code?time=" + new Date().getTime();
        }
        function checkForm() {
            var userphone = checkPhone();
            var userRelativePhone = checkRelativePhone();
            return userphone && userRelativePhone;
        }
        function checkPhone() {
            var userphone = document.getElementById('userPhone');
            var phonrErr = document.getElementById('phoneErr');
            var pattern = /^1[34578]\d{9}$/; //验证手机号正则表达式 
            if (!pattern.test(userphone.value)) {
                phonrErr.innerHTML = "手机号码不合规范"
                phonrErr.className = "error"
                return false;
            } else {
                phonrErr.innerHTML = "OK"
                phonrErr.className = "success";
                return true;
            }
        }
        function checkRelativePhone() {
            var userphone = document.getElementById('userRelativePhone');
            var phonrErr = document.getElementById('RelativePhoneErr');
            var pattern = /^1[34578]\d{9}$/; //验证手机号正则表达式 
            if (!pattern.test(userRelativephone.value)) {
                phonrErr.innerHTML = "手机号码不合规范"
                phonrErr.className = "error"
                return false;
            } else {
                phonrErr.innerHTML = "OK"
                phonrErr.className = "success";
                return true;
            }
    </script>
</body>
</html>