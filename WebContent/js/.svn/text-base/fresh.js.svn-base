var xmlhttp;
try {
	xmlhttp = new ActiveXObject('Msxml2.XMLHTTP');
} catch (e) {
	try {
		xmlhttp = new ActiveXObject('Microsoft.XMLHTTP');
	} catch (e) {
		try {
			xmlhttp = new XMLHttpRequest();
		} catch (e) {
		}
	}
}

function getPart(url, id) { 
	var div=document.getElementById(id);
	url=encodeURI(url); 
	url=encodeURI(url); 
	xmlhttp.open("post", url, true); 
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			
			if (xmlhttp.status == 200) {
				if (xmlhttp.responseText != "") {
					div.innerHTML = unescape(xmlhttp.responseText);
				}
			}else if(xmlhttp.status==500){ 
	            alert("error500" +xmlhttp.responseText);
	            div.innerHTML =xmlhttp.responseText;
	        }
	        else
	        { 
	            alert("Error data:\n"+ xmlhttp.statusText);
	            div.innerHTML = "data error";
	        }
		}
	}
	xmlhttp.setRequestHeader("If-Modified-Since","0"); 
	xmlhttp.send(null);
}
function getpartnodiv(url) { 
	xmlhttp.open("post", url, true); 
	xmlhttp.setRequestHeader("If-Modified-Since","0"); 
	xmlhttp.send(null);
}
function getPartFalse(url, id) {
	var div=document.getElementById(id);
	xmlhttp.open("post", url, false);
	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				if (xmlhttp.responseText != "") {
					div.innerHTML = unescape(xmlhttp.responseText);
				}
			} else {
				div.innerHTML = "data error";
			}
		}
	}
	xmlhttp.setRequestHeader("If-Modified-Since","0"); 
	xmlhttp.send(null);
}
function yulan(url){
  
    window.open(url);
   
}
//触发选中事件
function onsel(cid,thissels){

	var cids=document.getElementById("cids").value;
	if(thissels.checked==true){
		
		if(cids==""){
	       cids=cid;    
	    }else{
	       var cidss=cids.split("_"); 
	       for(var i=0;i<cidss.length;i++){
	              var tcid=cidss[i];
	              if(tcid!=cid){
	            	  cids=cids+"_"+cid;
	            	  break;  
	              }
	       }
	      
	    }
		document.getElementById("cids").value=cids;
	}else if(thissels.checked==false) {
        if(cids!=""){
        	  var cidss=cids.split("_");
        	  var tcids="" ;
	   	      for(var i=0;i<cidss.length;i++){
	   	              var tcid=cidss[i];
	   	              if(tcid!=cid){
		   	               if(tcids==""){
	                      	 tcids=tcid; 
	                       }else{
	                      	 tcids=tcids+"_"+tcid;
	                        
	                       }  
	   	              }
	   	      } 
	   	   document.getElementById("cids").value=tcids;
        }
       
    }	
}
function ajaxcheckbox(){
	var qxs=document.getElementsByName("tmids");
    var cids=document.getElementById("cids").value;
 	if(cids!=""){
 	   var cidss=cids.split("_"); 
 	       for(var i=0;i<cidss.length;i++){
 	              var tcid=cidss[i].split("|")[0];
 	                   
 	            	  for(var j=0;j<qxs.length;j++){
 	            		  if(qxs[j].value==tcid){
 	            			  qxs[j].checked=true; 
 	            			  break;  
     	            	   }
     	              }       
 	       }
 	      
 	 }	 
 }

//排序
function orderbyclient(obid){
	document.getElementById("call").checked=false;
 	var uid=document.getElementById("tmuid").value;
 	var id=1;

	var orderby=obid;
    var url="ajaxpageterminallist.vs?id="+id+"&uid="+uid+"&orderby="+orderby;
 	getPart(url, 'terminallist'); 
    setTimeout('ajaxcheckbox()',10);
    document.getElementById("cids").value="";
}

