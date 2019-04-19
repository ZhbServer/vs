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
 <form action="sendDllInterface.vs" name="form1" method="post" enctype="multipart/form-data" >
   
      <span>
     
      </span>
      <br/>
      <span>
        
      </span>
     
                  账号:<input  type="text"  name="account"  value="admin"/><br/><br/><br/>
                  密码:<input  type="text"  name="password" value="admin"/><br/><br/><br/>
       clientMarks: <input type="text" name="clientMarks" value="A0:9D:C1:70:60:D8"/>AD:XC:AW:DD:AS:AS,08:EA:40:24:52:B4 
       <br/><br/>
       type:<input type="text" name="type"  value="1"/>(播放类型0清理 1文本 2图片 )
       <br/><br/>
       showType:<input type="text" name="showType" value="0"/>(显示类型 0局部 1全屏)
       <br/><br/>
       titleContent:<input type="text" name="titleContent"  value="测试标题内容"/>(标题内容 ,标题默认 居中显示)
       <br/><br/>
       titleFs:<input type="text" name="titleFs"  value="30"/> (标题字体大小)
       <br/><br/>
       titleFcolor:<input type="text" name="titleFcolor"  value="-65536"  />(标题字体颜色)
       <br/><br/>
       bcolor:<input type="text" name="bcolor"  value="0"/>(背景颜色)
       <br/><br/>
       txtcontent:<input type="text" name="txtcontent"  value="测试显示内容"/>(文本内容)
       <br/><br/>
       fs:<input type="text" name="fs" value="15"/>(字体大小)
       <br/><br/>
       fcolor:<input type="text" name="fcolor"  value="-16777216"/>(字体颜色)
       <hr/>
       <input type="file"  name="file">
       <br/><br/><br/>
       <input type="submit" value="提交">
      

</form>
 
</body>
</html>