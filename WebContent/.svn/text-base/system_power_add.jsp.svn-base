<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="PRAGMA" content="NO-CACHE" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link rel="stylesheet" href="css/power_style.css"/>
<link rel="stylesheet" href="css/common.css"/>
<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>

<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<script type="text/javascript">

function init_self(){
	var openIntro = <%=request.getParameter("openIntro")%>;

	if(openIntro == '1'){
		intro = introJs();  
		intro.setOptions({
		prevLabel:"<ww:property value='#session.local.a00861' />", 
        nextLabel:"<ww:property value='#session.local.a00862' />",
        skipLabel:"<ww:property value='#session.local.a00863' />",
        doneLabel:"<ww:property value='#session.local.a00863' />",
		showStepNumbers: false,
		showBullets: false,
		exitOnOverlayClick: false,
		overlayOpacity: 0.4,  
		steps: [
		    {
			    element: '#pname',
			    intro: "<ww:property value='#session.local.a00949' />"
			},  	
			{  
				element: '#step1',  
				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00019' /></span><ww:property value='#session.local.a00950' /><span style='color:blue'> <ww:property value='#session.local.a00951' /></span><ww:property value='#session.local.a00016' />"
			},
			{
				element: '.step2',  
				intro: "<ww:property value='#session.local.a00952' />"
			},
			{
				element: '#step3',
				intro: "<ww:property value='#session.local.a00874' /><span style='color:blue'> <ww:property value='#session.local.a00021' /></span><ww:property value='#session.local.a00953' />"
			}
		  ]  
		});  

		intro.start().oncomplete(function() {  
			intro.exit();  
	    });

		intro.onexit(function() {
			layer.msg("<ww:property value='#session.local.a00864' />");
			window.parent.returnValue="close";
		});
	}
}

function r1all(r){
    var v = document.getElementsByTagName("input");
	var qxcheck = document.getElementById(r+'s').value;
	if (qxcheck==0)
	{
		for ( var j = 0; j < v.length; j++) {
			if(v.item(j).id==r){

			v.item(j).checked = true;
		    }
		}
		document.getElementById(r+'s').value = 1;
	}else{
		for ( var j = 0; j < v.length; j++) {
			if(v.item(j).id==r){
			   v.item(j).checked = false;
			}
		}
		document.getElementById(r+'s').value = 0;
	}
}
function addpower(){
	   var pname_var=document.getElementById('pname').value;
	  
	   if(pname_var.length==0){
		     layer.msg("<ww:property value='#session.local.a00170' />");
	   }else{
		   document.form1.target = "_self";
		   document.form1.action = 'addpower.vs'; 
		   document.form1.submit();
	   }
	
	   
}
</script>

</head>
<body onload="init_self()">
 <form  name="form1" method="post" >
 <input type="hidden" id="r1s" value="0" />
 <input type="hidden" id="r2s" value="0" />
 <input type="hidden" id="r3s" value="0" />
 <input type="hidden" id="r4s" value="0" />
 <input type="hidden" id="r5s" value="0" />
 <input type="hidden" id="r6s" value="0" />
 <input type="hidden" id="r7s" value="0" />
 <input type="hidden" id="r8s" value="0" />
 
<div class="wrap-content"> 
  <!-- 内容开始 -->
  

  <div class="pre-item">
  
     <div class="form-group-inline">
      <label>&nbsp;&nbsp;<ww:property value='#session.local.a00169' /> ：</label>
      <input  name="power.name" type="text" id="pname" value=""  />
	  
	  <input id="step3" class="btn btn-primary btn6 mr10" value="<ww:property value='#session.local.a00021' />" type="button"  onclick="addpower()"/>
    </div>
  </div>
  <div class="pre-content">
    <div class="pre-container">
      <div class="role-container">
        <table width="100%">
          <tr>
            <td class="tit"><ww:property value='#session.local.a00134' /> </td>
            <td class="ctn"><ul class="list-unstyled list-inline">
                <li>
                  <label class="text-orange "><ww:property value='#session.local.a00019' /></label>
                  <input id="step1" class="select-all" onclick="r1all('r1')" type="checkbox" />
                </li>
                <li>
                  <label><ww:property value='#session.local.a00143' /></label>
                  <input class="step2" id="r1" value="1" type="checkbox"  name="power.seesucai" />
                </li>
                <li>
                  <label><ww:property value='#session.local.a00141' /></label>
                  <input id="r1" value="1"  type="checkbox" name="power.addsucai" />
                </li>
                <li>
                  <label><ww:property value='#session.local.a00142' /></label>
                  <input id="r1" value="1"  type="checkbox" name="power.delsucai" />
                </li>
                <!-- <li>
                  <label><ww:property value='#session.local.a00144' /></label>
                  <input id="r1" value="1"  style="display: none;" type="checkbox" name="power.publicsucai" />
                </li> -->
                <input id="r1" value="1"  style="display: none;" type="checkbox" name="power.publicsucai" />
              </ul></td>
          </tr>
		   <tr>
            <td class="tit"><ww:property value='#session.local.a00135' /></td>
            <td class="ctn">
		        <div class="row">
                <ul class="list-unstyled list-inline">
                  <li>
                    <label class="text-orange"><ww:property value='#session.local.a00019' /></label>
                    <input class="select-all" onclick="r1all('r2')" type="checkbox" />
                  </li>
                  <li>
                    <label><ww:property value='#session.local.a00147' /></label>
                    <input type="checkbox" id="r2"  value="1" name="power.seeitem"   />
                  </li>
                  <li>
                    <label><ww:property value='#session.local.a00145' /></label>
                    <input type="checkbox" id="r2"    value="1" name="power.additem"  />
                  </li>
                  <li>
                    <label><ww:property value='#session.local.a00146' /></label>
                    <input type="checkbox" id="r2"    value="1" name="power.delitem" />
                  </li>
                  <!-- <li>
                    <label><ww:property value='#session.local.a00148' /></label> 
                    
                   </li>-->
                  <input type="checkbox" id="r2"  style="display: none;"   value="1" name="power.publicitem"  />
                  
                  <li style="display: none;">
                    <label><ww:property value='#session.local.a00149' /></label>
                    <input type="checkbox" id="r2"    value="1" name="power.itemsend" />
                  </li>
                  
                   <li>
                    <label><ww:property value='#session.local.b00229' /></label>  <!-- 发布节目(追加) -->
                    <input type="checkbox" id="r2"    value="1" name="power.itemsendAdd" />
                  </li>
                  
                  
                   <li>
                    <label><ww:property value='#session.local.b00230' /></label><!-- 发布节目(替换) -->
                    <input type="checkbox" id="r2"    value="1" name="power.itemsendReplace" />
                  </li>
                  
                  
                  <li style="display: none;" >
                    <label><ww:property value='#session.local.a00150' /></label>
                    <input type="checkbox" id="r2"   value="1" name="power.dpsend"  />
                  </li>
                  
                  <li>
                    <label><ww:property value='#session.local.a00645' /></label>
                    <input type="checkbox" id="r2"   value="1" name="power.jhset"  />
                  </li>
                 
                 
                </ul>
              </div>
              <div class="row">
                <ul class="list-unstyled list-inline">
                  <li>
                    <label class="text-orange"><ww:property value='#session.local.a00019' /></label>
                    <input class="select-all" onclick="r1all('r3')" type="checkbox" />
                  </li>
                 <!-- <li>
                    <label><ww:property value='#session.local.a00153' /></label>
                    <input type="checkbox" id="r3"   value="1" name="power.downmanager"  />
                  </li>-->
                   <input type="checkbox" id="r3" style="display: none;"    value="1" name="power.downmanager"  />
                   
                   
                   
                     
                   <li>
                    <label><ww:property value='#session.local.b00233' /></label>  <!-- 发布互动 -->
                    <input type="checkbox" id="r3"    value="1" name="power.itemsendInteractive" />
                  </li>
                  
                  
                  <li>
                    <label><ww:property value='#session.local.b00231' /></label><!-- 发布感应 -->
                    <input type="checkbox" id="r3"    value="1" name="power.itemsendInduction" />
                  </li>
                  
                  
                  <li>
                    <label><ww:property value='#session.local.b00232' /></label><!-- 发布精准 -->
                    <input type="checkbox" id="r3"    value="1" name="power.itemsendPrecise />
                  </li>
                  
                  <li>
                    <label><ww:property value='#session.local.a00151' /></label>
                    <input type="checkbox"  id="r3"   value="1" name="power.listsend" />
                  </li>
                  
                  <li>
                    <label><ww:property value='#session.local.a00152' /></label>
                    <input type="checkbox"  id="r3"   value="1" name="power.insertsend" />
                  </li>
                  
                  <li>
                    <label><ww:property value='#session.local.b00117' /></label>
                     <input type="checkbox" id="r3"   value="1" name="power.dllItemSend" />
                  </li>
                
                   <li <ww:if test="#session.version_onoff.warning==0"> style="display: none;"  </ww:if> >
                    <label><ww:property value='#session.local.b00275' /></label><!-- 发布节目(预警) -->
                    <input type="checkbox" id="r3"    value="1" name="power.itemsendWarning" />
                  </li>
                  
                
                </ul>
              </div>
			</td>
          </tr>
         
          <tr>

            <td class="tit"><ww:property value='#session.local.a00136' /></td>
            <td class="ctn"><ul class="list-unstyled list-inline">
                <li>
                  <label class="text-orange"><ww:property value='#session.local.a00019' /></label>
                  <input class="select-all" onclick="r1all('r4')" type="checkbox" />
                </li>
                <li>
                  <label><ww:property value='#session.local.a00154' /></label>
                  <input type="checkbox"  id="r4"   value="1" name="power.clientset"/>
                </li>
                <li>
                  <label><ww:property value='#session.local.a00155' /></label>
                  <input type="checkbox" id="r4"   value="1" name="power.groupmanager"/>
                </li>
                <li>
                  <label><ww:property value='#session.local.a00156' /></label>
                  <input type="checkbox" id="r4"   value="1" name="power.parameterset"/>
                </li>
                <li>
                  <label><ww:property value='#session.local.a00157' /></label>
                  <input type="checkbox" id="r4"   value="1" name="power.clearclient"/>
                </li>
                <li>
                  <label><ww:property value='#session.local.a00158' /></label>
                  <input type="checkbox" id="r4"   value="1" name="power.noticesend"/>
                </li>
                <li>
                  <label><ww:property value='#session.local.a00159' /></label>
                  <input type="checkbox" id="r4"   value="1" name="power.onoffset"/>
                </li>
                
                <li>
                  <label><ww:property value='#session.local.a00765' /></label>
                  <input type="checkbox" id="r4"   value="1" name="power.clientdisabled"/>
                </li>
             
                
              </ul></td>
          </tr>

		   <tr>

            <td class="tit"><ww:property value='#session.local.a00137' /></td>
            <td class="ctn"><ul class="list-unstyled list-inline">
                <li>
                  <label class="text-orange"><ww:property value='#session.local.a00019' /></label>
                  <input class="select-all" onclick="r1all('r5')" type="checkbox" />
                </li>
                <li>
                  <label><ww:property value='#session.local.a00160' /></label>
                  <input type="checkbox" id="r5"   value="1" name="power.usermanager"/>
                </li>
                <li>
                  <label><ww:property value='#session.local.a00161' /></label>
                  <input type="checkbox" id="r5"   value="1" name="power.powermanager" />
                </li>
                <li>
                  <label><ww:property value='#session.local.a00665' /></label>
                  <input type="checkbox" id="r5"   value="1" name="power.khmanager" />
                </li>
                
                <!-- <li>
                  <label><ww:property value='#session.local.a00162' /></label>
                  <input type="checkbox" id="r5"   value="1" name="power.serverip" />
                </li> -->
                <input type="checkbox" id="r5" style="display: none;"   value="1" name="power.serverip" />
                 <li>
                  <label><ww:property value='#session.local.a00163' /></label>
                  <input type="checkbox" id="r5"   value="1" name="power.sysset" />
                </li>
              </ul></td>
          </tr>

           <tr>

            <td class="tit"><ww:property value='#session.local.a00138' /></td>
            <td class="ctn"><ul class="list-unstyled list-inline">
                <li>
                  <label class="text-orange"><ww:property value='#session.local.a00019' /></label>
                  <input class="select-all" onclick="r1all('r6')" type="checkbox" />
                </li>
                <li>
                  <label><ww:property value='#session.local.a00164' /></label>
                  <input type="checkbox" id="r6"   value="1" name="power.userlog" />
                </li>
                <li>
                  <label><ww:property value='#session.local.a00165' /></label>
                  <input type="checkbox" id="r6"   value="1" name="power.clientlog" />
                </li>
               
              </ul></td>
          </tr>

		   <tr>

            <td class="tit"><ww:property value='#session.local.a00139' /></td>
            <td class="ctn"><ul class="list-unstyled list-inline">
                <li>
                  <label class="text-orange"><ww:property value='#session.local.a00019' /></label>
                  <input class="select-all" onclick="r1all('r7')" type="checkbox" />
                </li>
                <li>
                  <label><ww:property value='#session.local.a00166' /></label>
                  <input type="checkbox" id="r7"   value="1" name="power.statistical" />
                </li>
              
              </ul></td>
          </tr>

           <tr>

            <td class="tit"><ww:property value='#session.local.a00140' /></td>
            <td class="ctn"><ul class="list-unstyled list-inline">
                <li>
                  <label class="text-orange"><ww:property value='#session.local.a00019' /></label>
                  <input class="select-all" onclick="r1all('r8')" type="checkbox" />
                </li>
                <li>
                  <label><ww:property value='#session.local.a00167' /></label>
                  <input type="checkbox" id="r8"   value="1" name="power.checkitem" />
                </li>
                <!-- 
                <li>
                  <label><ww:property value='#session.local.a00168' /></label>
                  <input type="checkbox" id="r8"   value="1" name="power.checksend"  />
                </li>
                 -->
                
              
                
                <input type="checkbox" id="r8"  style="display: none;"  value="1" name="power.checksend"  />
              </ul></td>
          </tr>

         
        </table>
      </div>
    </div>
   
  </div>
  
  <!-- /内容结束 --> 
  
</div>
</form>
</body>

</html>