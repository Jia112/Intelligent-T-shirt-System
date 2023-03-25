<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>

<style>

 #reg_main{
    width: 700px;
    height: 500px;
    margin: 50px auto;
    overflow: hidden;
     border-style: inset;
}

#reg_main .pwd
{
	height: 60px;
	float: center;
    overflow: hidden;
    font-size: 32px;
    font-family:fantasy;
    text-align:center;
}


#reg_main form div{
    width: 600px;
    height: 36px;
    //border: 1px solid #cccccc;
    margin-bottom: 40px;
    padding-left: 20px;
    padding-top: 17px;
}
#reg_main form label{
    letter-spacing: 10px;
    float: left;
    font-size: 20px;
    margin-right: 10px;
}
#reg_main form input{
    float: left;
}
#reg_main form input::-webkit-input-placeholder{
    color: #ccc;
    font-size: 14px;
}


#reg_main .submit_button{
    padding: 0;
}
#reg_main input[type=submit]{
    width: 100px;
    height: 54px;
    color: white;
    font-size: 16px;
    color: white;
    background: red;
    font-weight:bold;
}
#reg_main input[type=submit]:hover{
    cursor: pointer;
}

  #form-itemGroup .error{ 
    color:#F00;
    vertical-align: middle; 
    } 
  #form-itemGroup .success{ 
    color:#096;
    vertical-align: middle;
    }  

</style>

<body>
    <div id = "reg_main">
        <form action="${pageContext.request.contextPath }/changePasswordServlet" id="changePassword" method="post">
        <div class = "pwd">
        修改密码
        </div>
            <div id="form-itemGroup">
                <label for="oldPassword">原密码</label>
                <input type="password" name="oldPassword" id="pwd" placeholder="请输入旧密码...">
                <i class="fa fa-eye" onclick="showhide()" id="eye"></i>
                <script type="text/javascript">
                    var eye = document.getElementById("eye");
                    var pwd = document.getElementById("pwd");
                    function showhide() {
                        if (pwd.type == "password") {
                            pwd.type = "text";
                            eye.className = 'fa fa-eye-slash'
                        } else {
                            pwd.type = "password";
                            eye.className = 'fa fa-eye'
                        }
                    }
                </script>
            </div>
            <div id="form-itemGroup">
                <label for="newPassword">密码</label>
                <input id="newPassword" name="newPassword" type="password" onBlur="checkPassword()" oninput="checkPassword()" placeholder="请输入新密码..">
                <span class="default" id="passwordErr">请输入10到20位的新密码</span>
                <i class="fa fa-eye" onclick="showhide()" id="eye"></i>
                <script type="text/javascript">
                    var eye = document.getElementById("eye");
                    var pwd = document.getElementById("newPassword");
                    function showhide() {
                        if (pwd.type == "password") {
                            pwd.type = "text";
                            eye.className = 'fa fa-eye-slash'
                        } else {
                            pwd.type = "password";
                            eye.className = 'fa fa-eye'
                        }
                    }
                </script>
            </div>
            <div id="form-itemGroup">
                <label for="newPassword1">确认密码</label>
                <input type="password" id="newPassword1" onBlur="ConfirmPassword()" oninput="ConfirmPassword()" placeholder="请再次输入新密码...">
                <span class="default" id="conPasswordErr">请重新输入新密码</span>
                <i class="fa fa-eye" onclick="showhide()" id="eye"></i>
                <script type="text/javascript">
                    var eye = document.getElementById("eye");
                    var pwd = document.getElementById("newPassword1");
                    function showhide() {
                        if (pwd.type == "password") {
                            pwd.type = "text";
                            eye.className = 'fa fa-eye-slash'
                        } else {
                            pwd.type = "password";
                            eye.className = 'fa fa-eye'
                        }
                    }
                </script>
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
            var password = checkPassword();
            var pwd2 = ConfirmPassword();
            return password && pwd2;
        }
        function checkPassword() {
            var userpasswd = document.getElementById('newPassword');
            var errPasswd = document.getElementById('passwordErr');
            var pattern = /^\w{10,20}$/; //密码要在10-20位 
            if (!pattern.test(userpasswd.value)) {
                errPasswd.innerHTML = "密码不合规范"
                errPasswd.className = "error"
                return false;
            } else {
                errPasswd.innerHTML = "OK"
                errPasswd.className = "success";
                return true;
            }
        }
        //确认密码 
        function ConfirmPassword() {
            var userpasswd = document.getElementById('newPassword');
            var userConPassword = document.getElementById('newPassword1');
            var errConPasswd = document.getElementById('conPasswordErr');
            if ((userpasswd.value) != (userConPassword.value)
                || userConPassword.value.length == 0) {
                errConPasswd.innerHTML = "上下密码不一致"
                errConPasswd.className = "error"
                return false;
            } else {
                errConPasswd.innerHTML = "OK"
                errConPasswd.className = "success";
                return true;
            }
        }       
    </script>
</body >
</html >