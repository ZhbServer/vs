<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="PRAGMA" content="NO-CACHE">
    
    

    <title><ww:property value='#session.local.public_title'/></title>
    <base target="_self"> 
    <link href="css/default.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="js/swfupload.js"></script>
   	<script type="text/javascript" src="js/swfupload.queue.js"></script>
    <script type="text/javascript" src="js/fileprogress.js"></script>
    <script type="text/javascript" src="js/handlers.js"></script>
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/fresh.js"></script>
    <script type="text/javascript">
        
		var upload1;
		
		
		window.onload = function() {
			var igid=document.getElementById("igid").value;
			upload1 = new SWFUpload({
				// Backend Settings
				upload_url: "daoitemin.vs?igid="+igid,
				post_params: {"picSESSID" : "songhao"},
				file_post_name: "file",
				// File Upload Settings
				file_size_limit : "8196000",	
				file_types : "*.*",
				file_types_description : "All Files",
				file_upload_limit : "100",
				file_queue_limit : "0",

				// Event Handler Settings (all my handlers are in the Handler.js file)
				file_dialog_start_handler : fileDialogStart,
				file_queued_handler : fileQueued,
				file_queue_error_handler : fileQueueError,
				file_dialog_complete_handler : fileDialogComplete,
				upload_start_handler : uploadStart,
				upload_progress_handler : uploadProgress,
				upload_error_handler : uploadError,
				upload_success_handler : uploadSuccess,
				upload_complete_handler : uploadComplete,

				// Button Settings
				button_image_url : "image/XPButtonUploadText_61x22.png",
				button_placeholder_id : "spanButtonPlaceholder1",
				button_width: 61,
				button_height: 22,
				
				// Flash Settings
				flash_url : "js/swfupload.swf",
				

				custom_settings : {
					progressTarget : "fsUploadProgress1",
					cancelButtonId : "btnCancel1"
				},
				
				// Debug Settings
				debug: false
			});
	     };

	     function savereturn(){
	    	 var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
    		 //var outname=document.getElementById("info").value; 
    		 window.parent.layer.close(index);

		 }


	      

	    
	      function CloseEvent()
	      {
	    	     var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
	    		 //var outname=document.getElementById("info").value; 
	    		 window.parent.layer.close(index);
	      }
	      
	     
	  	      
		    


		 
	   
	</script>
  </head>
  
  <body  style="overflow: auto;" onbeforeunload="return CloseEvent();"  >
  <form>
  <table>
    <tr >
      <td><div>
          <div class="fieldset flash" id="fsUploadProgress1"> <span class="legend"><ww:property value="#session.local.in_item" /></span> </div>
        <div style="padding-left: 5px;">
	<span id="spanButtonPlaceholder1"></span>
              &nbsp;&nbsp;
                <input style="color: #495764;font-family:Microsoft YaHei;" class="button1" name="button" type="button" disabled="disabled" id="btnCancel1"  onClick="cancelQueue(upload1);" value="<ww:property value="#session.local.a00056" />" />
	           
	            <input type="button" value="<ww:property value="#session.local.a00028" />" style="color: #495764;font-family:Microsoft YaHei;" onclick='savereturn()' class="button1" /> 
	          <br />
          </div>
         
      </div></td>
    </tr>
  </table>
  <input type="hidden" value="<ww:property value='igid'/>"  name="igid" id="igid" /> 
  </form>
  </body>
</html>
