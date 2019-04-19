<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>测试提交</title>

<script type="text/javascript">

	function checkPwd() {
		var str =document.getElementById("pwdV").value;
	    //var str = obj.value;
	    var regUpper = /[A-Z]/;
	    var regLower = /[a-z]/;
	    var regStr = /[^A-Za-z0-9]/;
	    var regNum=/[0-9]/;
	    var complex = 0;
	    if (regLower.test(str)) {
	        ++complex;
	    }
	    if (regUpper.test(str)) {
	        ++complex;
	    }
	    if (regStr.test(str)) {
	        ++complex;
	    }
	    if (regNum.test(str)) {
	        ++complex;
	    }
	    if (complex < 4 || str.length < 6) {
	        alert("包含大小写字母，数字,特殊字符,长度至少6位");
	    } else {
	        alert("成功");
	    }
	}

</script>
</head>
<body>
 <form   action="warningInterface.vs" name="form1" method="post" >
   
      <span>
     
      </span>
      <br/>
      <span>
        
      </span>
     
                  账号:<input  type="text"  name="account"  value="admin"/><br/><br/><br/>
                  密码:<input  type="text"  name="password" value="admin"/><br/><br/><br/>
       macs: <input type="text" name="macs" />
       ["AD:XC:AW:DD:AS:AS","08:EA:40:24:52:B4"] 
       <br/><br/><br/>
       opt: <input type="text" name="opt" /> 0撤销  , 1 显示 
       <br/><br/><br/>
       <input type="submit" value="提交">
       
       <hr>
       
       <input type="text"    id="pwdV"  />
       
       <input type="button" value="测试"  id="t" onclick="checkPwd()" >

</form>
 
</body>
</html>