

/**验证是否为数字 **/
function checkValNumber(val) {
       //var re = /^[0-9]+.?[0-9]*$/;   //判断字符串是否为数字     //判断正整数 /^[1-9]+[0-9]*]*$/  
       //if (!re.test(val)) {
        //   return false;
       //}else{
    //	   return true;
     //  }
       
       
       if (isNaN(val)) { 
    	    return false;
       }else{
    	   
    	   return true;
       } 
}