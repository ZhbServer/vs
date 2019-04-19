<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="PRAGMA" content="NO-CACHE" />

<base target="_self" />
<style type="text/css">
A{text-transform:none; text-decoration:none;}  
</style> 
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/common.css"/>

<!-- ZUI 标准版压缩后的 CSS 文件 -->
<link rel="stylesheet" href="zui-1.5.0-dist/dist/css/zui.min.css" />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/default/easyui.css"  />
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.5/themes/icon.css"  />

<script type="text/javascript" src="js/jq/jquery.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script type="text/javascript" src="js/<ww:property value='#session.local.a00000' />/easyuiLocal.js"></script>
<script type="text/javascript" src="js/constant.js"></script>
<script src="js/jscolor.js"></script> 


<script   src="zui-1.5.0-dist/dist/lib/sortable/zui.sortable.js"></script>

<script type="text/javascript" src="jquery-easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/datagrid-dnd.js"></script>
<script type="text/javascript" src="jquery-easyui-1.5/treegrid-dnd.js"></script>

<script type="text/javascript" src="intro.js-2.4.0/intro.js"></script>
<link rel="stylesheet" href="intro.js-2.4.0/introjs.css" />
<style>
	/* 为可拖动的条目应用可移动光标类型 */
	#sortableList > .list-group-item {cursor: move}
	
	/* 为正在被拖动的条目应用半透明外观 */
	#sortableList > .list-group-item.dragging {
	  visibility: visible;
	  opacity: .3;
	}
	
</style>



<script src="js/fresh.js" type="text/javascript" language="javascript"></script>
<script>




  //初始化数据集
  var currentdiv;
  function initData(){

	  //ajax请求获取数据
	 ajaxGetSucaiData(0,"","scGroupComboboxImg",4,"dgImg");

	 //ajax请求获取数据
	 ajaxGetSucaiData(0,"","scGroupComboboxVideo",3,"dgScVideo");
	 	
	 
     var currentdivJson="<ww:property value='currentdiv' />";

  
	 currentdiv = eval( "(" + currentdivJson + ")" );//转换后的JSON对象
	 
	 //var cycleState=currentdiv.cycleState;
    
	 //if(cycleState==undefined||cycleState==0){

     //}else if(cycleState==1){
    //	 $("[name = cycleState]:checkbox").attr("checked", true);
     //}
     $('#interactGroupNumber').numberspinner('setValue', currentdiv.interactGroupNumber);  


     

	    var initTreeData=window.parent.$("#layerBigDataParameter").val();
	    console.log("initTreeData:"+initTreeData)
		if(initTreeData!=""){

			
			 var data= eval( "(" + initTreeData + ")" );
             
			 
			
			 if(data[0].children==undefined){}else{
				 
				 for(var i=0;i<data[0].children.length;i++)
				 {
					

					 if(data[0].children[i].cycleState==undefined){
						 data[0].children[i].cycleState=1;
					 }
					 
				 } 
				 
			 }
			

			
			 $('#dgTree').treegrid({
	             data: data
	         });

	         //遍历树状表格
             var childrens=$('#dgTree').treegrid("getChildren",currentdiv.id);

			 for(var i=0;i<childrens.length;i++){
				 var node=childrens[i];
				 var mResourcePlaysListJson=node.mResourcePlays;
				 if(mResourcePlaysListJson!=""){

					 //mResourcePlaysListJson= encodeUnicode(mResourcePlaysListJson);
					 
					
					 
					 node.mResourcePlays=mResourcePlaysListJson;
					 $('#dgTree').treegrid('update', node);
				 }

		     }
			 
			
			
	    }else{

	    	 $('#dgTree').treegrid('append',{
	 			parent: 0,
	 			data: [{
	 				ck:currentdiv.id,
	 				id: currentdiv.id,
	 				name: currentdiv.name
	 				
	 			}]
	 	     });

	    }
	    

	


	 var obj = document.getElementById("resourceType"); //selectid

     var index = obj.selectedIndex; // 选中索引

     var text = obj.options[index].text; // 选中文本

     var value = obj.options[index].value; // 选中值
     
     onClickSwitchResource(value);


    


     

     
  }

    

   //事件点击切换  1事件  2播放素材(视频)
   function onClickSwitchResource(resourceType){
           if(resourceType==1){
        	   $('#resourceEvent').show();
        	   $('#resourceSucai').hide();

        	   $('#seltTargetIdText').html("<ww:property value='#session.local.b00072'  />");

        	   $("#clickSwitchResouceText").html("<ww:property value='#session.local.b00078' />");

           }else if(resourceType==2){
        	   $('#resourceEvent').hide();
        	   $('#resourceSucai').show();
        	   $('#seltTargetIdText').html("<ww:property value='#session.local.b00081'  />");
        	   $("#clickSwitchResouceText").html("<ww:property value='#session.local.b00079' />");

           }

    }
    //鼠标悬浮预览绑定
	function onMousePreView(){
		 $(".datagrid-row").mouseover(function(){  
		              
		            var e = event || window.event;       
		  	        var url = $(this).children("td").eq(2).text();

		  	       
		  	       
		  	        if(url.indexOf(".jpg")!=-1||url.indexOf(".png")!=-1||url.indexOf(".gif")!=-1){
		  	        	
		 			       
		 			    
		  	        }else{
			  	      
			  	       if(url==""||url=="1"||url=="2"){
			  	    	   url="";
				  	   }else{

				  		 var ind=url.lastIndexOf(".");
		 				 var ads=url.substring(0,ind);
		 			     url=ads+'_.jpg';
					   }
			  	     
                       
				  	 }   
		  	       
		  	        
		  	        if (url == "") {
		  	        	 $("#preview").hide();   
		  	            //$("#show_img").attr("src", "${ctx}/images/person.jpg");  
		  	        } else {  
		  	            $("#show_img").attr("src", "files/" + url);
		  	            //$("#preview").css("top", ($(this).offset().top+10) + "px").css("left", ($(this).offset().left+e.clientX) + "px").show();
		  	            var clientY=e.clientY+5;
		  	            if(e.clientY+100>520){
		  	            	clientY=e.clientY-100;  
			  	        }
		  	            $("#preview").css("top", (clientY) + "px").css("left", (e.clientX+10) + "px").show();        
		  	        }
		  	          
		  	    });  
		    	$(".datagrid-row").mouseout(function(){  
		  	        $("#preview").hide();  
		  	    });  

	 } 
     //添加播放元素  type 1新增  2编辑 3.播放编辑 4清理播放
     function toSetAdapterEdit(type){

    	 var selRows = $('#dgTree').datagrid('getChecked');
         if(selRows.length==0){
             layer.msg("<ww:property value='#session.local.b00066' />");
             return;
             
         }
         
    	 $("#treeShowInfo").hide();
       
    	 if(type==1){
    		
    		    $("[name = cycleState]:checkbox").attr("checked", false);
	    	
	        	//获取素材列表已选
				  $("#resourceType").removeAttr("disabled");  
	        	   var lv = $('#dgTree').treegrid('getLevel',selRows[0].id);

		    	   if(lv==3){
		    		   
			    	     layer.msg("<ww:property value='#session.local.b00083' />");
			    	     onClickShowTree();
	                     return;
			       }

			       
	        	  $("#editTypeSpan").html("<ww:property value='#session.local.a00021' />");
	              clearResourceInput();
	              
	              $("#resourceType").find("option[value=1]").attr("selected",true);

	             
	              onClickSwitchResource(1);
	              $("#resourceType").attr("disabled","disabled"); 
	        	  $("#touchOnclickDivId").show();
	        	  $("#editType").val(1); 	  
	         
	          
	      }else if(type==2){  

	    	  //获取素材列表已选
	    	  var selRows = $('#dgTree').datagrid('getChecked');
	    	  if(selRows.length==0){
	              layer.msg("<ww:property value='#session.local.b00066' />");
	          }else{
	        	  if(selRows[0].id==currentdiv.id){
	        		   onClickShowTree();
				   	   layer.msg("<ww:property value='#session.local.b00068' />!"); 
	                   return;
				  }
	        	  $("#touchOnclickDivId").show();
	        	  onClickSwitchResource(1);
	        	  $("#editTypeSpan").html("<ww:property value='#session.local.a00017' />");

	        	  //treeId
	        	  $("#editTreeId").val(selRows[0].id);
                  $("#editParentTreeId").val(selRows[0]._parentId);

                  //显示类型
	        	  $("#resourceType").find("option[value=1]").attr("selected",true);
	        	  $("#resourceType").attr("disabled","disabled"); 
                  //显示关联区域
	        	  $("#seltTargetId").find("option[value='"+selRows[0].seltTargetId+"']").attr("selected",true);

	        	  //获取图片默认显示路径
	        	  $("#pathNameInput").val(selRows[0].pathNameInput);
	              $("#pathInput").val(selRows[0].pathInput);
	                 
	              //获取焦点显示图片
	              $("#mBackgroundFocusedNameInput").val(selRows[0].mBackgroundFocusedNameInput);
	              $("#mBackgroundFocusedInput").val(selRows[0].mBackgroundFocusedInput);
	                
	              //获取选中效果显示图片
	              $("#mBackgroundSelectedNameInput").val(selRows[0].mBackgroundSelectedNameInput);
	              $("#mBackgroundSelectedInput").val(selRows[0].mBackgroundSelectedInput);
	                
	                
	              //获取按下效果显示图片
	              $("#mBackgroundPressedNameInput").val(selRows[0].mBackgroundPressedNameInput);
	              $("#mBackgroundPressedInput").val(selRows[0].mBackgroundPressedInput);

	              //循环
	              if(selRows[0].cycleState==1){

	            	    	 $("[name = cycleState]:checkbox").attr("checked", true);
	            	
		           }else{

		        	   $("[name = cycleState]:checkbox").attr("checked", false);
			        }
	              
	              

	              $("#editType").val(2);
	        	    
	        	  
	          }

		  }else if(type==3){

			  //获取素材列表已选
	    	  var selRows = $('#dgTree').datagrid('getChecked');
	    	  if(selRows.length==0){
	              layer.msg("<ww:property value='#session.local.b00066' />");
	              onClickShowTree();
	          }else{
	        	  if(selRows[0].id==currentdiv.id){
				   	   
				   	   layer.msg("<ww:property value='#session.local.b00068' />!"); 
				   	   onClickShowTree();
	                   return;
				  }

	        	  $("#touchOnclickDivId").show();
	        	  onClickSwitchResource(2);
	        	  $("#editTypeSpan").html("<ww:property value='#session.local.a00017' />");
			      

			      //treeId
	        	  $("#editTreeId").val(selRows[0].id);
                  $("#editParentTreeId").val(selRows[0]._parentId);

                  //显示类型
	        	  $("#resourceType").find("option[value=2]").attr("selected",true);
	        	  $("#resourceType").attr("disabled","disabled"); 

	        	  //显示播放管理区域
	        	  $("#selResourceTargetId").find("option[value='"+selRows[0].mResourcePlayTargetId+"']").attr("selected",true);
	        	  

	        	  var mResourcePlays=selRows[0].mResourcePlays;
	              //alert(mResourcePlays)
	        	  mResourcePlays=decodeUnicode(mResourcePlays);
	              //alert(mResourcePlays)
	        	  //mResourcePlays=decodeUnicode(mResourcePlays);
	        	  //mResourcePlays=decodeUnicode(mResourcePlays);
	        	  clearDgList("dgPlaySucai");
	        	  if(mResourcePlays==""){

		          }else{

		              var objs = eval( "(" + mResourcePlays + ")" );//转换后的JSON对象
	  		          for(var i=0;i<objs.length;i++){
	  		    
			  		      //创建tr
			  		      $('#dgPlaySucai').datagrid('appendRow',{
						        	   tScNameVideo:objs[i].tScNameVideo,
						        	   tScFileNameVideo:objs[i].tScFileNameVideo,
						        	   tScVol:+objs[i].tScVol
					       });    
				         
		    	      }
			      }
                         
  		    
	           } 

		  }else if(type==4){
			  var node = $('#dgTree').treegrid('getSelected');
		      if (node){

		    	     node.mResourcePlayTargetId="";
		             node.mResourcePlays="";
		             onClickShowTree();
		    	     $("#touchOnclickDivId").hide();
		             $('#dgTree').treegrid('update', node);
		            
			  }


	      }
     }
     


     //新增节点
     function adTreeNode(){
          
    	  //获取父级节点
		   var selRows = $('#dgTree').datagrid('getChecked');
           
		   if(selRows.length==0){
	            return;
	       }else{
	    	   //获取显示类型  1事件 2播放
             
               var showResourceType=1; // 选中值

               //获取显示关联区域
               var objSeltTargetId = document.getElementById("seltTargetId");
               index = objSeltTargetId.selectedIndex; // 选中索引
               var showSeltTargetId=objSeltTargetId.options[index].value; // 选中值


               //获取图片默认显示路径
               var pathNameInput=$("#pathNameInput").val();
               var pathInput=$("#pathInput").val();

               if(pathNameInput==""||pathInput==""){
                   layer.msg("<ww:property value='#session.local.b00067' />");
                   
                   return;
               }
               //onClickShowTree();
               //获取焦点显示图片
               var mBackgroundFocusedNameInput=$("#mBackgroundFocusedNameInput").val();
               var mBackgroundFocusedInput=$("#mBackgroundFocusedInput").val();
               
               //获取选中效果显示图片
               var mBackgroundSelectedNameInput=$("#mBackgroundSelectedNameInput").val();
               var mBackgroundSelectedInput=$("#mBackgroundSelectedInput").val();
               
               
               //获取按下效果显示图片
               var mBackgroundPressedNameInput=$("#mBackgroundPressedNameInput").val();
               var mBackgroundPressedInput=$("#mBackgroundPressedInput").val();


               var cycleState=0;
               //获取循环播放状态
               if($("#cycleState").is(":checked")){//选中 
            	   cycleState=$("#cycleState").val();
                   
               }  

               

               var editType=$("#editType").val();
               if(editType==1){

            	   var random=creade_random();
            	   $('#dgTree').treegrid('append',{
   		   			parent: selRows[0].id,
   		   			data: [{
   		   				ck:random+selRows[0].id,
   		   				id:random+selRows[0].id,
   		   				name: pathNameInput,
   		   				resourceType:showResourceType,
   		   				seltTargetId:showSeltTargetId,
   		   				pathNameInput:pathNameInput,
   		   				pathInput:pathInput,
   		   				mBackgroundFocusedNameInput:mBackgroundFocusedNameInput,
   		   				mBackgroundFocusedInput:mBackgroundFocusedInput,
   		   				mBackgroundSelectedNameInput:mBackgroundSelectedNameInput,
   		   				mBackgroundSelectedInput:mBackgroundSelectedInput,
   		   				mBackgroundPressedNameInput:mBackgroundPressedNameInput,
   		   				mBackgroundPressedInput:mBackgroundPressedInput,
   		   			    mResourcePlays:"",
   		   			    mResourcePlayTargetId:"",
   		   			    cycleState:cycleState
   		   				
   		   			  }]
   		       	    });
            	
   		    	
   		    	 $("#touchOnclickDivId").hide();
   		    	 onClickShowTree();
     		     clearResourceInput(); 
               }else if(editType==2){
            	   var node = $('#dgTree').treegrid('getSelected');
                   if (node){
                	   node.name=pathNameInput;
                       node.resourceType=showResourceType;
                       node.seltTargetId=showSeltTargetId;
                       node.pathNameInput=pathNameInput;
                       node.pathInput=pathInput;
                       node.mBackgroundFocusedNameInput=mBackgroundFocusedNameInput;
                       node.mBackgroundFocusedInput=mBackgroundFocusedInput;
                       node.mBackgroundSelectedNameInput=mBackgroundSelectedNameInput;
                       node.mBackgroundSelectedInput=mBackgroundSelectedInput;
                       node.mBackgroundPressedNameInput=mBackgroundPressedNameInput;
                       node.mBackgroundPressedInput=mBackgroundPressedInput;
                       node.cycleState=cycleState;
                       
                       
                       $("#touchOnclickDivId").hide();
            		   clearResourceInput();
            		   onClickShowTree();
                       $('#dgTree').treegrid('update', node);
                       

                   }

               }
               
               

		   }
		   


     }


     //添加播放列表
     function addResourcePlays(){
    	 var node = $('#dgTree').treegrid('getSelected');
    	 if (node){

    		 //获取播放列表 
             var rows=$("#dgPlaySucai").datagrid("getRows");
             if(rows.length==0){
                 //layer.msg("<ww:property value='#session.local.b00013'  /><ww:property value='#session.local.a00691'  />"); 
                 //return;

            	 var node = $('#dgTree').treegrid('getSelected');
   		         if (node){

   		    	     node.mResourcePlayTargetId="";
   		             node.mResourcePlays="";
   		    	     $("#touchOnclickDivId").hide();
   		             $('#dgTree').treegrid('update', node);

   			     }
   		         onClickShowTree();
   			  
             }else {

            	 var mResourcePlaysList=new Array();
                 for(var i=0;i<rows.length;i++){
                       var  mPlay=new Object();
                       if(i==0){
                     	  pathNameInput=rows[i].tScNameVideo;
                       }
                       mPlay.tScNameVideo=rows[i].tScNameVideo;
                       mPlay.tScFileNameVideo=rows[i].tScFileNameVideo;
                       mPlay.tScVol=rows[i].tScVol;
                       mResourcePlaysList[i]=mPlay;
    			 }
                 var  mResourcePlaysListJson = JSON.stringify(mResourcePlaysList); 

                 var mResourcePlaysListJsonEu= encodeUnicode(mResourcePlaysListJson);
                 //alert(mResourcePlaysListJsonEu)
                
        		 //获取显示关联区域
                 var objSeltTargetId = document.getElementById("selResourceTargetId");
                 index = objSeltTargetId.selectedIndex; // 选中索引
                 var selResourceTargetId=objSeltTargetId.options[index].value; // 选中值
              
        		 node.mResourcePlayTargetId=selResourceTargetId;
                 node.mResourcePlays=mResourcePlaysListJsonEu;
                 onClickShowTree();
                 $("#touchOnclickDivId").hide();
                 $('#dgTree').treegrid('update', node);

             }
    		
             clearResourceInput();
             
             
         }
    	


     }

    // 转为unicode 编码  
     function encodeUnicode(str) {  
         var res = [];  
         for ( var i=0; i<str.length; i++ ) {  
         res[i] = ( "00" + str.charCodeAt(i).toString(16) ).slice(-4);  
         }  
         return "\\u" + res.join("\\u");  
     }  
       
     // 解码  
     function decodeUnicode(str) {  
         str = str.replace(/\\/g, "%");  
         
         return unescape(str);  
     } 

     var GB2312UnicodeConverter = {
    		    ToUnicode: function (str) {
    		        return escape(str).toLocaleLowerCase().replace(/%u/gi, '\\u');
    		    }
    		    , ToGB2312: function (str) {
    		        return unescape(str.replace(/\\u/gi, '%u'));
    		    }
     };

		
	  function removeIt(){


		  layer.confirm("<ww:property value='#session.local.a00092' />?", {icon: 3, title:"<ww:property value='#session.local.a00093' />",btn: ["<ww:property value='#session.local.a00080' />", "<ww:property value='#session.local.a00014' />"]}, function(index){

			  var node = $('#dgTree').treegrid('getSelected');
			  if (node){
				  if(node.id==currentdiv.id){
				   	   
				   	   layer.msg("<ww:property value='#session.local.b00052' />!"); 
	                   return;
				  }
				  
				  $('#dgTree').treegrid('remove', node.id);

				  
				  layer.close(index);
				  onClickShowTree();
			  }	  
					
		  });	
	 }

	  //清理输入框值
     function clearResourceInput(){

          $("#editTreeId").val("");

   	    
   	      $("#editParentTreeId").val("");
   	    

  	      //获取图片默认显示路径
          $("#pathNameInput").val("");
          $("#pathInput").val("");
           
          //获取焦点显示图片
          $("#mBackgroundFocusedNameInput").val("");
          $("#mBackgroundFocusedInput").val("");
          
          //获取选中效果显示图片
          $("#mBackgroundSelectedNameInput").val("");
          $("#mBackgroundSelectedInput").val("");
          
          
          //获取按下效果显示图片
          $("#mBackgroundPressedNameInput").val("");
          $("#mBackgroundPressedInput").val("");


          $("#cycleStateShow").val("");


          clearDgList("dgPlaySucai");

     }		

	 //确定
	 function adInteractGroup(){
         
         
		//获取tree列表
        var treeData=$('#dgTree').treegrid('getData');

        var treeDataJson = JSON.stringify(treeData);
         
        //console.log(treeDataJson)
         
        var childrens= treeData[0].children;

        var recycler=combinationIteration(treeData[0]);

        var mTouchList=new Array();
   	    //var touch=new Object();
        //touch.tType=9;
        //touch.tOnclick=9;
        //touch.tTargetId=currentdiv.id;
        //mTouchList[0]=touch;
        //recycler.mTouchList=mTouchList;
        recycler.mId=treeData[0].id;

        //获取是否循环状态  cycleState
        //recycler.cycleState=0;
        //if($("#cycleState").is(":checked")){//选中 
        //	recycler.cycleState=$("#cycleState").val();
            
        //}  

        
        
        recycler.interactGroupNumber=$("#interactGroupNumber").val();
        var recyclerJson = JSON.stringify(recycler);
        //alert(recyclerJson);
        console.log(recyclerJson);

        var  treeDataJson=JSON.stringify(treeData);
        
        var index = window.parent.layer.getFrameIndex(window.name); //获取窗口索引
		window.parent.returnValue=recyclerJson+"$"+treeDataJson; 
	    window.parent.layer.close(index);
        //alert(json)
        
         
		   
     } 


     //递归解析组包
     function combinationIterationOld(node){

    	 var mTouchList=new Array();
    	 
         if(node.children==undefined){

         }else{
             var childrens=node.children;
        	 for(var i=0;i<childrens.length;i++){
        		
        		 
        		 mTouchList[i]=combinationIteration(childrens[i]);
        		
        		
             }
         } 
         var programAdapter=new Object();
         if(node.resourceType==1){
        	 
             programAdapter.path=node.pathInput;  //图片默认显示路径
             programAdapter.mBackgroundFocused=node.mBackgroundFocusedInput; //获取焦点显示图片
             programAdapter.mBackgroundSelected =node.mBackgroundSelectedNameInput;//选中效果显示图片
             programAdapter.mBackgroundPressedInput=node.mBackgroundPressedInput;//按下效果显示图片 
             programAdapter.igPid=node._parentId;  //父级id
             programAdapter.igId=node.id;     //当前节点id
            
             programAdapter.tType=9;
             programAdapter.tOnclick=9;
            
             programAdapter.mTouchList=mTouchList;
             
             
         }else if(node.resourceType==2){

             
        	 programAdapter.tType=2;
             programAdapter.tOnclick=9;


             var tResourcesList=new Array();
             var objs = eval( "(" + node.mResourcePlays + ")" );//转换后的JSON对象//获取播放列表

             for(var i=0;i<objs.length;i++){
                  var resource=new Object();
                  resource.path=objs[i].tScFileNameVideo;
                  resource.sname=objs[i].tScNameVideo;
                  resource.mVol=objs[i].tScVol;
                  tResourcesList[i]=resource;
             }       
             
            
             programAdapter.tResourcesList=tResourcesList;

         }else{

        	 programAdapter.mId=node.id;
        	 programAdapter.mAdapter=0;
         }
         programAdapter.resourceType=node.resourceType;
         programAdapter.tTargetId=node.seltTargetId;
       
         
         return programAdapter;
    	


     }



     function combinationIteration(node){

         var recycler=new Object();

         var mAdapterList=new Array();
         
         if(node.children!=undefined){
        	 
        	 var childrens=node.children;
        	 for(var i=0;i<childrens.length;i++){

            	 var programAdapter=new Object();

        		 var children=childrens[i];

        		 programAdapter.path=children.pathInput;  //图片默认显示路径

                 programAdapter.mBackgroundFocused=children.mBackgroundFocusedInput; //获取焦点显示图片

                 programAdapter.mBackgroundSelected =children.mBackgroundSelectedInput;//选中效果显示图片

                 programAdapter.mBackgroundPressedInput=children.mBackgroundPressedInput;//按下效果显示图片 

                 programAdapter.igPid=children._parentId;  //父级id

                 programAdapter.igId=children.id;     //当前节点id

                 programAdapter.cycleState=children.cycleState;
                 
                 mAdapterList[i]=programAdapter;

                 //判断有没有子集节点或者有没有替换资源事件
                 
                 var childrens2=children.children;
                 
                 if(childrens2!=undefined){

                	 var mTouchList=new Array();
                	 var touch=new Object();
                     touch.tType=9;
                     touch.tOnclick=9;
                      
                     var tResourcesList=new Array();
                     
                     var resource=new Object();

                     

                     var mAdapterList2=new Array();

                     
                     var tTargetIdLevel1;
                     for(var j=0;j<childrens2.length;j++){
                    	  
                          
                    	   var programAdapter2=new Object();

                    	   if(j==0){
                              
                    		   tTargetIdLevel1=childrens2[j].seltTargetId;
                        	}
                    	   programAdapter2.path=childrens2[j].pathInput;  //图片默认显示路径

                           programAdapter2.mBackgroundFocused=childrens2[j].mBackgroundFocusedInput; //获取焦点显示图片

                           programAdapter2.mBackgroundSelected =childrens2[j].mBackgroundSelectedInput;//选中效果显示图片

                           programAdapter2.mBackgroundPressedInput=childrens2[j].mBackgroundPressedInput;//按下效果显示图片 

                           programAdapter2.igPid=childrens2[j]._parentId;  //父级id

                           programAdapter2.igId=childrens2[j].id;     //当前节点id
                           
                           mAdapterList2[j]=programAdapter2;


                           var resourceplay=childrens2[j].mResourcePlays;//判断有没有播放

                          
                           if(resourceplay!=""){
                               var mTouchList3=new Array();

                               var touch3=new Object();
                               touch3.tType=2;
                               touch3.tOnclick=9;
                               
                               resourceplay=decodeUnicode(resourceplay);
                               //resourceplay=decodeUnicode(resourceplay);
                               //resourceplay=decodeUnicode(resourceplay);
                               var tResourcesList3=new Array();
                               var objs = eval( "(" + resourceplay + ")" );//转换后的JSON对象//获取播放列表

                               for(var z=0;z<objs.length;z++){
                                    var resource2=new Object();
                                    resource2.path=objs[z].tScFileNameVideo;
                                    resource2.sname=objs[z].tScNameVideo;
                                    resource2.mVol=objs[z].tScVol;
                                    tResourcesList3[z]=resource2;
                               }
                               touch3.tTargetId=childrens2[j].mResourcePlayTargetId;
                               
                            
                               touch3.tResourcesList=tResourcesList3;
                               mTouchList3[0]= touch3;      
                               programAdapter2.mTouchList=mTouchList3;

                         }
                          

                     }

                     resource.mAdapterList=mAdapterList2;

                     var touch4=new Object();
                     touch4.tType=9;
                     touch4.tOnclick=9;
                     var mTouchList4=new Array();
                     mTouchList4[0]=touch4;
                     resource.mTouchList=mTouchList4;    
                     tResourcesList[0]=resource;
                     touch.tTargetId=tTargetIdLevel1;
                     touch.tResourcesList=tResourcesList;
                     mTouchList[0]=touch;
                     programAdapter.mTouchList=mTouchList;

                    
                     

                 }else{
                	 var resourceplayLevel1=children.mResourcePlays;//判断有没有点事件

                     if(resourceplayLevel1!=""){
                         var mTouchList3=new Array();

                         var touch3=new Object();
                         touch3.tType=2;
                         touch3.tOnclick=9;

                         resourceplayLevel1=decodeUnicode(resourceplayLevel1);
                         //resourceplayLevel1=decodeUnicode(resourceplayLevel1);
                         //resourceplayLevel1=decodeUnicode(resourceplayLevel1);
                         var tResourcesList3=new Array();
                         var objs = eval( "(" + resourceplayLevel1 + ")" );//转换后的JSON对象//获取播放列表

                         for(var z=0;z<objs.length;z++){
                              var resource2=new Object();
                              resource2.path=objs[z].tScFileNameVideo;
                              resource2.sname=objs[z].tScNameVideo;
                              resource2.mVol=objs[z].tScVol;
                              tResourcesList3[z]=resource2;
                         }
                         touch3.tTargetId=children.mResourcePlayTargetId;
                         touch3.tResourcesList=tResourcesList3;
                         var mTouchList=new Array();
                         mTouchList[0]= touch3;      
                        
                         programAdapter.mTouchList=mTouchList;
                     }


                 }
                 
                 
                 
        	 }
        	 recycler.mAdapterList=mAdapterList; 	 

         }
         //alert(recycler); 
         
         return recycler;	 
          
        
     }	
	</script>
	
	
</head>
<body onload="initData()">
    
   
    

    <form method="post" name="form1" action="">
       <div class="panel panel-primary" style="margin: 3px 3px;">
           <div class="panel-heading">
                <ww:property value="#session.local.b00053"/> <!-- 互动组 -->
           </div>
          <div class="container clearfix" style="margin: 10px 10px;">
          <div class="main-wrap" style="width:850px;">
		      <div class="result-wrap">
		          <div class="result-content">
		            <input type="hidden" value="<ww:property value='currentdivid'/>" id="currentdivid"/>
		            <table class="insert-tab" width="100%">

			          
			              <tr>
				            
				            <td colspan="2" style="width: 20%;">
				            
				               <div id="dgTreeDiv">
				                  <table id="dgTree" title="<ww:property value='#session.local.a00666'/>" class="easyui-treegrid" style="width:280px;height:500px;"
										data-options="
											rownumbers: true,
											toolbar: '#tb',
											idField: 'id',
											treeField: 'name',
											onClickRow:onClickRow,
											selectOnCheck:true,
                                            checkOnSelect:true,
                                            multiple: true
										">
									<thead>
										<tr>
										    <th data-options="field:'ck',checkbox:true"></th>
											<th data-options="field:'name'" width="220"><ww:property value='#session.local.b00070'/></th><!-- 结构图 -->
											<th data-options="field:'resourceType',hidden:true" width="220">resourceType</th><!-- 显示类型 -->
											<th data-options="field:'seltTargetId',hidden:true" width="220">seltTargetId</th><!-- 关联区域 -->
											
											<th data-options="field:'pathNameInput',hidden:true" width="220">pathNameInput</th><!-- 图片默认显示路径 -->
											<th data-options="field:'pathInput',hidden:true" width="220">pathInput</th><!-- 图片默认显示路径 -->
											
											<th data-options="field:'mBackgroundFocusedNameInput',hidden:true" width="220">mBackgroundFocusedNameInput</th><!-- 获取焦点显示图片 -->
											<th data-options="field:'mBackgroundFocusedInput',hidden:true" width="220">mBackgroundFocusedInput</th><!-- 获取焦点显示图片 -->
											
											<th data-options="field:'mBackgroundSelectedNameInput',hidden:true" width="220">mBackgroundFocusedNameInput</th><!-- 选中效果显示图片 -->
											<th data-options="field:'mBackgroundSelectedInput',hidden:true" width="220">mBackgroundFocusedInput</th><!-- 选中效果显示图片 -->
											
											<th data-options="field:'mBackgroundPressedNameInput',hidden:true" width="220">mBackgroundFocusedNameInput</th><!-- 按下效果显示图片-->
											<th data-options="field:'mBackgroundPressedInput',hidden:true" width="220">mBackgroundFocusedInput</th><!-- 按下效果显示图片 -->
											
											<th data-options="field:'mResourcePlays',hidden:true" width="220">mResourcePlays</th><!-- 播放资源 -->
											
											<th data-options="field:'mResourcePlayTargetId',hidden:true" width="220">mResourcePlayTargetId</th><!-- 播放资源关联区域 -->
											
											<th data-options="field:'cycleState',hidden:true" width="220">cycleState</th><!-- 循环播放 -->
											
										</tr>
									</thead>
								</table>
				              </div>
				            </td>
				            <td style="width:60%;">
				                <!-- 信息显示 -->
				                <div id="treeShowInfo">
				                   <table style="width: 100%;">
				                       <!-- <tr>
			                                  <td width="30%"><ww:property value='#session.local.b00071'/>:</td> 显示类型 
								    		  <td width="70%">
								    		     <span id="showResourceType"></span>
								    		  </td>
				                       </tr>
				                        -->
				                       <tr id="treeShowInfoTr0">
			                                  <td width="30%" style="text-align: right;" ><ww:property value='#session.local.b00054'/>:</td><!-- 显示个数 -->
								    		  <td width="70%">
								    		      <input id="interactGroupNumber" class="easyui-numberspinner"  data-options="increment:1,min:1,max:100" style="width:120px;"></input>
								    		  </td>
				                       </tr>
				                       
				                       
				                    
				                       
				                       
				                       
				                       <tr>
			                                  <td width="30%" style="text-align: right;"><ww:property value='#session.local.b00072'/>:</td><!-- 显示关联区域 -->
								    		  <td width="70%">
								    		     <span id="showSeltTargetId"></span>
								    		  </td>
				                       </tr>
				                       
				                       
				                     
				                       
				                       
				                       
				                       <tr>
				                           <td width="30%" style="text-align: right;"><ww:property value='#session.local.b00073'/>:</td><!-- 图片默认显示路径 -->
								    		  <td width="70%">
								    		     <span id="showPathNameInput"></span>
								    	      </td>
				                       </tr>
				                       
				                       
				                       <tr>
				                           <td width="30%" style="text-align: right;"><ww:property value='#session.local.b00208'/>:</td><!-- 图片默认显示路径 -->
								    		  <td width="70%">
								    		     <span id="cycleStateShow"></span>
								    	      </td>
				                       </tr>
				                       
				                       
				                       
				                        <tr>
				                           <td width="30%" style="text-align: right;"><ww:property value='#session.local.b00074'/>:</td><!-- 获取焦点显示图片 -->
								    		  <td width="70%">
								    		     <span id="showmBackgroundFocusedNameInput"></span>
								    	      </td>
				                        </tr>
				                        
				                        
				                        <tr>
				                           <td width="30%" style="text-align: right;" ><ww:property value='#session.local.b00075'/>:</td><!-- 选中效果显示图片 -->
								    		  <td width="70%">
								    		     <span id="showmBackgroundSelectedNameInput"></span>
								    	      </td>
				                        </tr>
				                        
				                        
				                         <tr>
				                           <td width="30%" style="text-align: right;"><ww:property value='#session.local.b00076'/>:</td><!-- 按下效果显示图片 -->
								    		  <td width="70%">
								    		     <span id="showmBackgroundPressedNameInput"></span>
								    	      </td>
				                        </tr>
				                        
				                        <tr>
				                           <td width="30%" style="text-align: right;"><ww:property value='#session.local.b00081'/>:</td><!-- 播放素材管理区域 -->
								    		  <td width="70%">
								    		     <span id="showmResourcePlayTargetId"></span>
								    	      </td>
				                        </tr>
				                        
				                        
				                        <tr>
				                           <td width="30%" style="text-align: right;"><ww:property value='#session.local.b00077'/>:</td><!-- 播放素材 -->
								    		  <td width="70%">
								    		     <span id="showPlaySucai"></span>
								    	      </td>
				                        </tr>
				                        
				                       
				                   </table>
				                
				                </div>
				                
				                
				                <input type="hidden" id="editTreeId" value=""/>   <!-- 当前节点Id -->
				                <input type="hidden" id="editParentTreeId" value=""/><!-- 父级节点Id -->
				                
				                <div id="touchOnclickDivId" style="display: none;">
				                       
				                      	<table style="width: 100%;height: 460px;">
				                      	       <tr>
									    			<td style="width: 40%"><ww:property value='#session.local.b00080'/>:</td><!-- 操作类型 -->
									    			<td style="width: 60%">
									    			
									    			    <span id="editTypeSpan"></span>
									    			    <input type="hidden" id="editType" value=""/>   <!-- 编辑类型 1新增 2修改 -->
									    			</td>
									    		</tr>
									    		
									    		<tr>
									    			<td><i class="require-red">*</i><ww:property value='#session.local.b00071'/>:</td><!-- 显示类型 -->
									    			<td>
										    		       <span id="clickSwitchResouceText"></span> 
										    			   <select id="resourceType"  onchange="onClickSwitchResource(this.value)"   style="width: 80px;display: none;">
										    			      <option value="1"><ww:property value='#session.local.b00078'/></option><!-- 事件 -->
										    			      <option value="2"><ww:property value='#session.local.b00079'/></option><!-- 播放 -->
										    			   </select>
										    			   
									    			
									    			</td>
									    		</tr>
									    		
									    		
									    		
									    		<tr>
									    		  <td colspan="2">
									    		    <div style="height: 380px;">
									    		     <!-- 事件 -->
									    		     <div  id="resourceEvent" style="display: none;">
											    		     <table style="margin-top:30px;width: 100%;">
											    		     
											    		     
											    		            <tr>
															    			<td><i class="require-red">*</i>
															    			
															    			   <span id="seltTargetIdText"> <ww:property value='#session.local.b00072'/></span>
															    			    
															    			:</td><!-- 显示关联区域 -->
															    			<td>
															    			
															    			   <select  style="width: 80px;" id="seltTargetId">
															    			   
															    			       <ww:iterator value="#request.touchIdList"  id="tId">
																                        <option <ww:if test="#request.editTouchInteractive.tTargetId==#tId">selected="selected"</ww:if>    value="<ww:property value='#tId'/>">
																                           <ww:property value="#tId"/>
																                        </option>   
																                   </ww:iterator>
															    			   </select>
															    			
															    			</td>
									    		                    </tr>
									    		                    
									    		                    <!-- 循环播放 -->
									    		                     <tr>
															    			<td><i class="require-red"></i>
															    			
															    			   <span id="seltTargetIdText"> <ww:property value='#session.local.b00208'/></span>
															    			    
															    			:</td><!-- 循环播放 -->
															    			<td>
															    			
															    			     <input  id="cycleState"  name="cycleState" type="checkbox"  value="1"/>
															    			
															    			</td>
									    		                    </tr>
									    		                    
									    		
														    		<tr>
														    			<td><i class="require-red">*</i><ww:property value='#session.local.b00073'/>:</td><!-- 图片默认显示路径 -->
														    			<td>
														    			
														    			   <input type="text" id="pathNameInput" name="pathNameInput" readonly="readonly" />
														    			   <input type="hidden" id="pathInput" name="pathInput"  />
														    			   
														    			   <i onclick="setPlayAll(1)" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i>   
														    			</td>
														    		</tr>
														    		<tr>
														    			<td><ww:property value='#session.local.b00074'/>:</td><!-- 获取焦点显示图片 -->
														    			<td>
														    			   <input  type="text" id="mBackgroundFocusedNameInput" name="mBackgroundFocusedNameInput" readonly="readonly" />
														    			   <input type="hidden" id="mBackgroundFocusedInput" name="mBackgroundFocusedInput" />
														    			   <i onclick="setPlayAll(2)" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i>
														    			</td>
														    		</tr>
														    		<tr>
														    			<td><ww:property value='#session.local.b00075'/>:</td><!-- 选中效果显示图片 -->
														    			<td>
														    			   <input  type="text" id="mBackgroundSelectedNameInput" name="mBackgroundSelectedNameInput" readonly="readonly" />
														    			   <input type="hidden" id="mBackgroundSelectedInput" name="mBackgroundSelectedInput" />
														    			   <i onclick="setPlayAll(3)" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i>
														    			</td>
														    		</tr>
														    		<tr>
														    			<td><ww:property value='#session.local.b00076'/>:</td><!-- 按下效果显示图片 -->
														    			<td>
														    				<input  type="text" id="mBackgroundPressedNameInput" name="mBackgroundPressedNameInput" readonly="readonly" />
														    			    <input type="hidden" id="mBackgroundPressedInput" name="mBackgroundPressedInput" />
														    				<i onclick="setPlayAll(4)" style="cursor: pointer;" title="<ww:property value='#session.local.a00021' />"  class="icon icon-plus-sign"></i>
														    		    </td>
														    			
														    		</tr>
														    		
														    		<tr style="height: 40px;">
														    			<td>
														    			    
														    			</td>
														    			<td>
														    			   <button  class="btn btn-sm btn-primary " onclick='adTreeNode()' type="button"><ww:property value='#session.local.a00080' /></button>
														    			</td>
														    			
														    		</tr>
														    		
														    		
														    		
											    		     
											    		     </table>
									    		     
									    		     </div>
									    		    <!-- 播放素材 -->
									    		    <div id="resourceSucai" style="padding-top:5px;display: none;">
									    		    
									    		           <table style="width: 530px;">
									    		               <tr>
														    			<td style="width: 39%;"><i class="require-red">*</i>
														    			
														    			<span id="seltTargetIdText"> <ww:property value='#session.local.b00081'/></span>
														    			    
														    			:</td><!-- 播放素材关联区域 -->
														    			<td style="width: 61%;">
														    			
														    			   <select  style="width: 80px;" id="selResourceTargetId">
														    			   
														    			       <ww:iterator value="#request.touchIdList"  id="tId">
															                        <option     value="<ww:property value='#tId'/>">
															                              <ww:property value="#tId"/>
															                        </option>   
															                   </ww:iterator>
														    			   </select>
														    			
														    			</td>
								    		                  </tr>
									    		             <tr>
									    		               <td colspan="2">
									    		               
									    		              
									    		                    <div style="float: left;">
															    		   <table id="dgPlaySucai" class="easyui-datagrid"  title="<ww:property value="#session.local.b00013"  />" style="width:400px;height:200px;margin: 0px;padding: 0px;"
																				data-options="
																				    rownumbers:true,
																					singleSelect: true,
																					method: 'get',
																					onClickCell:onClickCellDgPlaySucai,
																					selectOnCheck:true,
			                                                                        checkOnSelect:true
			                                                                   ">
																                <thead>
																                
																                
																                
																                       
									    		                    
																                
																	                    <tr>
																							<th data-options="field:'tScNameVideo',width:270"><ww:property value='#session.local.a00133'/></th>
																							
																							
																							<th data-options="field:'tScVol',width:80,formatter:unitformatterVol,
																							    
									                                                             editor: 
									                                                               { type: 'combobox', 
									                                                                 options: 
									                                                                        {  data:vols,
									                                                                           valueField:'value',
														                                                       textField:'text',
														                                                       method:'get',
														                                                       required:true
														                                                      
									                                                                        } 
									                                                               }
									                                                        "><ww:property value='#session.local.b00022'/></th>
									                                                        <th data-options="field:'tScFileNameVideo',hidden:true"></th>
																		        	    </tr>
																                 </thead>
											                               </table>
								                                     </div>
								                                 
								                                     <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 30px;width: 50px;">
																		<a id="step4" title="<ww:property value='#session.local.a00652' />" href="javascript:setPlayAll(5);"  style="width: 40px;height:30px;">
																		  <img src="image/item/sc_add.png" alt="" height="30px" width="40px" />
																		</a><!--添加  -->
																		<a title="<ww:property value='#session.local.a00268' />" href="javascript:MoveUp(4);"  style="width: 40px;height:30px;">
																		  <img src="image/item/sc_up.png" alt="" height="30px" width="40px" />
																		</a><!--上移 -->
																		<a title="<ww:property value='#session.local.a00269' />" href="javascript:MoveDown(4);" style="width: 40px;height:30px;">
																		  <img src="image/item/sc_down.png" alt="" height="30px" width="40px" />
																		</a><!--下移 -->
																		<a title="<ww:property value='#session.local.a00025' />" href="javascript:removeDg(4);" style="width: 40px;height:30px;">
																		  <img src="image/item/sc_del.png" alt="" height="30px" width="40px" />
																		</a><!--删除-->
																	</div>
																	
										
										
								                               
					                                            </td>
									    		             </tr>
									    		             <tr style="height: 40px;">
														    			
												    			<td colspan="2">
												    			   <button  class="btn btn-sm btn-primary " onclick='addResourcePlays()' type="button"><ww:property value='#session.local.a00080' /></button>
												    			</td>
														    			
														     </tr>
					  	                                  </table>
									    		     </div> 
									    		     
									    		   </div>
									    		  </td>
									    		  
									    		</tr>
									    		
									    	</table>
	    	
	    	
				                                     
				                </div>   
				            </td>
			           </tr>
			          
			           
			            <tr>
						    <td colspan="3" style="height: 45px;padding-left: 350px;"    >
				                
				                 <button  class="btn btn-primary" onclick='adInteractGroup()' type="button"><ww:property value='#session.local.a00080' /></button>
				                 
				                 <button class="btn btn-primary" onclick='close_win_nov()' type="button"><ww:property value='#session.local.a00014' /></button>
				                 
				                 
				            </td>
			            </tr>
			         </table>
			         
			         <!-- 树状(左)置顶按钮 -->
			         <div id="tb" style="height:auto;line-height: 0px;">
						
						
						
						<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="toSetAdapterEdit(1)">
						<ww:property value='#session.local.a00652'/></a><!-- 添加事件 -->
						<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="toSetAdapterEdit(2)">
						<ww:property value='#session.local.a00024'/></a><!-- 编辑 事件-->
						
						
						<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="toSetAdapterEdit(3)">
						<ww:property value='#session.local.a00652'/><ww:property value='#session.local.b00079'/></a><!-- 添加播放 -->
						
						<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="toSetAdapterEdit(4)">
						<ww:property value='#session.local.a00824'/></a><!-- 取消播放 -->
						
						
						
						
						
						<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="removeIt()">
						<ww:property value='#session.local.a00025'/></a> <!-- 删除 -->
																
					  </div>
									   
									   
									   
                  </div>
		  </div>
		</div>
        </div>
       </div> 	 
       
        
  
	   <script>
	      var pathType=0;
	      var vols = [
		               { "value": "100", "text": "100%"},
		               { "value": "90", "text": "90%" }, 
		   	           { "value": "80", "text": "80%" },
		   	           { "value": "70", "text": "70%" },
		   	           { "value": "60", "text": "60%" },
		   	           { "value": "50", "text": "50%" },
		   	           { "value": "40", "text": "40%" },
		   	           { "value": "30", "text": "30%" },
		   	           { "value": "20", "text": "20%" },
		   	           { "value": "10", "text": "10%" },
		   	           { "value": "0", "text": "0%" }
	                ];
		 //弹出添加素材
		 function setPlayAll(type){
			
			     pathType=type;

			     if(pathType==5){
			    	 clearDgList("dgVideo");
			    	 $('#win-resourcePlay').window('open');

				 }else if(pathType==6){
					 $('#volAll').combobox({
							data:vols,
							valueField:'value',
							textField:'text',
							value:"100"  //默认选中value指定的选项
						});
						
			    	 $('#win-vol').window('open');

			     }else{

					 $('#win-resourceEvent').window('open');
					 clearDgList("dg");
					 var tScName="";
					 var tScFileName="";
			          //创建tr
					 if(pathType==1){//图片默认显示路径
						 tScName=$("#pathNameInput").val();
						 tScFileName=$("#pathInput").val();
					   }else if(pathType==2){//获取焦点显示图片
						 tScName=$("#mBackgroundFocusedNameInput").val();
						 tScFileName=$("#mBackgroundFocusedInput").val();
					   }else if(pathType==3){//选中效果显示图片
						 tScName=$("#mBackgroundSelectedNameInput").val();
						 tScFileName=$("#mBackgroundSelectedInput").val();
					   }else if(pathType==4){//按下效果显示图片
						 tScName=$("#mBackgroundPressedNameInput").val();
						 tScFileName=$("#mBackgroundPressedInput").val();
					   }

					   if(tScName!=""||tScFileName!=""){
						   $('#dg').datagrid('appendRow',{
				        	   tScName:tScName,
				        	   tScFileName:tScFileName
			               });

					   }

			     }
				
			    

		            
			
		 }

		 function unitformatterVol(value, rowData, rowIndex) {
     	    if (value == "10") {
     	        return "100%";
     	    }
     	    for (var i = 0; i < vols.length; i++) {
     	        if (vols[i].value == value) {
     	            return vols[i].text;
     	        }
     	    }
     	 }	


	      $.extend($.fn.datagrid.methods, {
	  			editCell: function(jq,param){
	  				return jq.each(function(){
	  					var opts = $(this).datagrid('options');
	  					var fields = $(this).datagrid('getColumnFields',true).concat($(this).datagrid('getColumnFields'));
	  					for(var i=0; i<fields.length; i++){
	  						var col = $(this).datagrid('getColumnOption', fields[i]);
	  						col.editor1 = col.editor;
	  						if (fields[i] != param.field){
	  							col.editor = null;
	  						}
	  					}
	  					$(this).datagrid('beginEdit', param.index);
	  					for(var i=0; i<fields.length; i++){
	  						var col = $(this).datagrid('getColumnOption', fields[i]);
	  						col.editor = col.editor1;
	  					}
	  				});
	  			}
	  		});
	  		

		 var editIndex = undefined;

        function endEditing(){
             //alert(editIndex)
         	if (editIndex == undefined){return true;}
 			if ($('#dg').datagrid('validateRow', editIndex)){
     			
 				$('#dg').datagrid('endEdit', editIndex);
 				editIndex = undefined;
 				return true;
 			} else {
 				return false;
 			}
 		}

   		
		function onClickCell(index, field){
				
				if (endEditing()){
					$('#dg').datagrid('selectRow', index)
							.datagrid('editCell', {index:index,field:field});
					editIndex = index;
				}
				
		 }

		function onClickRow(index, field){
			
			onClickShowTree();
			
	    }
		 
		



		//ajax请求获取素材数据   urlType 方式  0普通 1搜索 , urlSelValue 搜索关键词, scGroupId分组ID名    ,scType类型 , scTableGridId grid显示id 
		function ajaxGetSucaiData(urlType,urlSelValue,scGroupId,scType,scTableGridId){

		    	  //分组id
			      var myOptValue = $("#"+scGroupId).combobox("getValue") ;

		          //拼接data
		          var aJaxUrlData="";
		          if(urlType==0){
		        	  aJaxUrlData="id=1&checkAjaxState=1"+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+scType;
		          }else if(urlType==1){
		              
		        	  aJaxUrlData="id=1&checkAjaxState=1&sel=1&ser="+urlSelValue+"&gssi.sucaigroupid="+myOptValue+"&sucai.type="+scType;
		          }
		    	 
		 	   
		 	     //ajax请求获取数据
		         $.ajax({
						type:'post',
						url:'ajaxToItemSeeSucaiAction.vs',
						data:aJaxUrlData,
						dataType:'json',
						async:true,
						cache:true,
						success:function(data){
					       
			                //清空列表
			 	    	   //clearDgList(scTableGridId);
			 	    	  //隐藏鼠标悬浮
				    	   $("#preview").hide(); 
	
	
				    	   $('#'+scTableGridId).datagrid({loadFilter:pagerFilter}).datagrid('loadData', getData(4,2,null,data));
				    	   
		 			       onMousePreView();
			    	    	   
				
						}
					});	

		    }

			//清空素材列表数据
		    function clearDgList(gridName){
		  	 
		        var sucais = $('#'+gridName).datagrid('getRows');
		        if (sucais) {
		             for (var i = sucais.length - 1; i >= 0; i--) {
		                 var index = $('#'+gridName).datagrid('getRowIndex', sucais[i]);
		                 $('#'+gridName).datagrid('deleteRow', index);
		                 
		             }
		        }

		    }



			 /*加到列表事件图片*/
			 function addTouchMuti(type){
				var selRows=new Array();
				if(type==1){

					   //获取素材列表已选
			    	  selRows = $('#dgImg').datagrid('getChecked');
			    	 
			    	  $('#dgImg').datagrid('clearSelections');

			    }else if(type==2){
			    	
			    	  selRows = $('#dgScVideo').datagrid('getChecked');
			    	  $('#dgScVideo').datagrid('clearSelections');
			    	
				}
			   

			    for(var i=0;i<selRows.length;i++){
			    {
			 	 
			          if(type==1){
			        	  clearDgList("dg");
			        	  //创建tr
				          $('#dg').datagrid('appendRow',{
				        	   tScName:selRows[i].tScName,
				        	  
				        	   tScFileName:selRows[i].tScFileName
			               });

				      }else if(type==2){

				    	//创建tr
				          $('#dgVideo').datagrid('appendRow',{
				        	   tScNameVideo:selRows[i].tScName,
				        	   tScFileNameVideo:selRows[i].tScFileName,
				        	   tScVol:'100'
			               });
				       
		              }
					  //$('#dg').datagrid('acceptChanges');
			          //$('#dg').datagrid('enableDnd');	          
			      }
			      onMousePreView();
			         
			    }
			 }


			  function removeDg(type){
					if (editIndex == undefined){return;}

					var dg='';
					 if(type==1){
			             dg='dg';
					 }else if(type==2){
						 dg='dgVideo';
				     }else if(type==3){
			             dg='dgHtml';
					 }else if(type==4){
                         dg='dgPlaySucai';
					 }

				     
					var rows=$("#"+dg).datagrid("getRows");
				
					
					$('#'+dg).datagrid('cancelEdit', editIndex)
							.datagrid('deleteRow', editIndex);
					editIndex = undefined;
				}


			  function setPathSubmit(type){

				  if(type==1){
					   //获取选择列表信息
					   var rows=$("#dg").datagrid("getRows");

					   var imgNameInput;
					   var imgFileInput;
					   if(rows.length==0){
					         //layer.msg("<ww:property value='#session.local.a00282'/>");  
				             //return;
						   imgNameInput="";
						   imgFileInput="";
					   }else{
						   imgNameInput=rows[0].tScName;
						   imgFileInput=rows[0].tScFileName;

					   }  

					   
					   if(pathType==1){//图片默认显示路径
	                       $("#pathNameInput").val(imgNameInput);
	                       $("#pathInput").val(imgFileInput);
					   }else if(pathType==2){//获取焦点显示图片
						   $("#mBackgroundFocusedNameInput").val(imgNameInput);
	                       $("#mBackgroundFocusedInput").val(imgFileInput);
					   }else if(pathType==3){//选中效果显示图片
						   $("#mBackgroundSelectedNameInput").val(imgNameInput);
	                       $("#mBackgroundSelectedInput").val(imgFileInput);
					   }else if(pathType==4){//按下效果显示图片
						   $("#mBackgroundPressedNameInput").val(imgNameInput);
	                       $("#mBackgroundPressedInput").val(imgFileInput);
					   }
					   pathType=0;

					   clearDgList("dg");
			        	  
					   
					   $('#win-resourceEvent').window('close', true); 

				  }else if(type==2){
					   var rows=$("#dgVideo").datagrid("getRows");

					   if(rows.length==0){
						     //layer.msg("<ww:property value='#session.local.a00282'/>");  
				             //return;
						   clearDgList("dgPlaySucai");
					   }else{

						   for(var i=0;i<rows.length;i++){
							      //创建tr
						          $('#dgPlaySucai').datagrid('appendRow',{
						        	   tScNameVideo:rows[i].tScNameVideo,
						        	   tScFileNameVideo:rows[i].tScFileNameVideo,
						        	   tScVol:'100'
					               });
						   }
						  clearDgList("dgVideo");

					   }  

					  
					  $('#win-resourcePlay').window('close', true); 
				  }

				  

                  

			  }	

			  function endEditingVideo(){
	                //alert(editIndex)
              	if (editIndex == undefined){return true;}
      			if ($('#dgVideo').datagrid('validateRow', editIndex)){
	        			
      				$('#dgVideo').datagrid('endEdit', editIndex);
      				editIndex = undefined;
      				return true;
      			} else {
      				return false;
      			}
      		}


            function onClickCellVideo(index, field){
					
					if (endEditingVideo()){
						
						$('#dgVideo').datagrid('selectRow', index)
								.datagrid('editCell', {index:index,field:field});
						editIndex = index;
					}
					
			}


            function endEditingDgPlaySucai(){
                //alert(editIndex)
          	if (editIndex == undefined){return true;}
  			if ($('#dgPlaySucai').datagrid('validateRow', editIndex)){
        			
  				$('#dgPlaySucai').datagrid('endEdit', editIndex);
  				editIndex = undefined;
  				return true;
  			} else {
  				return false;
  			}
  		  }

      		

         function onClickCellDgPlaySucai(index, field){
				
				if (endEditingDgPlaySucai()){
					
					$('#dgPlaySucai').datagrid('selectRow', index)
							.datagrid('editCell', {index:index,field:field});
					editIndex = index;
				}
				
		  }


        

		  

         function onClickShowTree(){
        	    
        	   
        	    $("#touchOnclickDivId").hide();
        	    $("#treeShowInfo").show();
        	    var selRows = $('#dgTree').datagrid('getChecked');
               
        	  
                if(selRows[0].id==currentdiv.id){
                	
                	$("#showResourceType").html("");
                	$("#showSeltTargetId").html("");
                	$("#showPathNameInput").html("");
                	$("#showmBackgroundFocusedNameInput").html("");
                	$("#showmBackgroundSelectedNameInput").html("");
                	$("#showmBackgroundPressedNameInput").html("");
                	$("#showmResourcePlayTargetId").html("");
                	$("#showPlaySucai").html("");
                	$("#cycleStateShow").html("");
                	
                	$("#treeShowInfoTr0").show();  
                }else{
                	 $("#treeShowInfoTr0").hide();  
                	 //显示类型
            	    //var showResourceType=selRows[0].resourceType;
            	    //if(showResourceType==1){
                    //   $("#showResourceType").html("<ww:property value='#session.local.a00943' />");//事件
                    //获取图片默认显示路径
                	  var showPathNameInput=selRows[0].pathNameInput;
                	  $("#showPathNameInput").html(showPathNameInput);
                	    
                	//}else if(showResourceType==2){
                	//	$("#showResourceType").html("<ww:property value='#session.local.b00079' />");//播放
                		 //获取图片默认显示路径
                	    
                	 //   $("#showPathNameInput").html("");
                    //}

                    //显示关联区域
            	    var showSeltTargetId=selRows[0].seltTargetId;
            	    $("#showSeltTargetId").html(showSeltTargetId);

            	   

            	    //获取焦点显示图片
            	    var showmBackgroundFocusedNameInput=selRows[0].mBackgroundFocusedNameInput;
            	    $("#showmBackgroundFocusedNameInput").html(showmBackgroundFocusedNameInput);
            	    //获取选中效果显示图片
            	    var showmBackgroundSelectedNameInput=selRows[0].mBackgroundSelectedNameInput;
            	    $("#showmBackgroundSelectedNameInput").html(showmBackgroundSelectedNameInput);
            	    //获取按下效果显示图片
            	    var showmBackgroundPressedNameInput=selRows[0].mBackgroundPressedNameInput;
            	    $("#showmBackgroundPressedNameInput").html(showmBackgroundPressedNameInput);

            	    //获取播放列表显示区域
            	    var mResourcePlayTargetId=selRows[0].mResourcePlayTargetId;
            	    $("#showmResourcePlayTargetId").html(mResourcePlayTargetId);

            	    //获取循环播放
            	    var cycleState=selRows[0].cycleState;

            	    if(cycleState==1){
                	    
            	    	 $("#cycleStateShow").html("<ww:property value='#session.local.a00232' />");  //是
            	    	 
                	}else{

                		 $("#cycleStateShow").html("<ww:property value='#session.local.a00233' />");  //是

                    }
            	   

            	    //alert("cycleState:"+cycleState);
            	    
            	     
            	     
            	    
            	   
            	    //获取播放列表
            	    var  resourceplayUe=  selRows[0].mResourcePlays;
            	    var showPlaySucai="";
            	    if(resourceplayUe==""){

                	}else{
                		resourceplayUe=decodeUnicode(resourceplayUe);
                		
                		 //resourceplayUe=GB2312UnicodeConverter.ToGB2312(resourceplayUe);
                		 //alert(resourceplayUe)
                		//console.log(resourceplayUe);
                		var objs = eval( "(" + resourceplayUe + ")" );//转换后的JSON对象
                       
            		    
            		    for(var i=0;i<objs.length;i++){

            		    	  if(showPlaySucai==""){
            		    		  showPlaySucai=objs[i].tScNameVideo;
                		      }else{
                		    	  showPlaySucai=showPlaySucai+","+objs[i].tScNameVideo;
                    		  }
            		    }
            		   

                    }
            	 
            	 
        		    $("#showPlaySucai").html(showPlaySucai);

                }
               
	    		
        	    
		  }

		  

    		


            //修改视频全部音量
       	 function setPlayVolSubmit(){  
       	        
       			 var rows=$("#dgVideo").datagrid("getRows");
       			 for(var i=0;i<rows.length;i++)
       			 {
       				   $('#dgVideo').datagrid('updateRow',{
       			        index: i,
       			        row: {
       			            'tScVol':$('#volAll').combobox('getValue')
       			        }
       			      });

       			 }		 
       		   $('#win-vol').window('close', true); 
       	  }


			
       	function removeit(type){
			if (editIndex == undefined){return;}

			var dg='';
			 if(type==1){
	             dg='dg';
			 }else if(type==2){
				 dg='dgVideo';
		     }else if(type==3){
	             dg='dgHtml';
			 }

		     
			var rows=$("#"+dg).datagrid("getRows");
		
			
			$('#'+dg).datagrid('cancelEdit', editIndex)
					.datagrid('deleteRow', editIndex);
			editIndex = undefined;
		}
					
	      		
	   </script>								  
									         

</form>

 
  <!-- 弹出框 事件 选择素材-->
  <div id="win-resourceEvent" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00330' />" style="width:850px;height:400px;"  data-options="left:'10px',top:'60px',collapsible:false,
			minimizable:false,
			maximizable:false" >
     
                <div id="targetDivContentImg" style="padding-top: 10px;padding-left: 20px;">
			                        <div id="targetDivContentImgLeft" class="am_right scrollbar-hover" style="height: 280px;width:350px;float: left;">
                                          <table id="dgImg" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:280px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												toolbar: '#tb0',
												method: 'get',
												nowrap:true	,
												selectOnCheck:true,
												checkOnSelect:true,
												multiple: true,
												pagination: true,
												fit:true
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true"></th>
														<th data-options="field:'tScName',width:280"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>
									        	    </tr>
							                 </thead>
			                              </table>
			                              
			                              <div id="tb0" style="height:auto;line-height: 0px;">
												
												<div>
													<ww:property value='#session.local.b00014'  />:<!-- 分组 --> 
													<select  id="scGroupComboboxImg"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
														<option <ww:if test="gssi.sucaigroupid==0">selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00815'  /></option> <!-- 全部 -->
														<option <ww:if test="gssi.sucaigroupid==-1">selected="selected" </ww:if>  value="-1"><ww:property value='#session.local.b00015'  /></option><!-- 共享 -->
														<ww:iterator value="listsfgpimg">
														       <option  <ww:if test="gssi.sucaigroupid==id">selected="selected" </ww:if>  value="<ww:property value='id'  />"><ww:property value="name"  /></option>
														</ww:iterator>
													</select>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00071'  />',searcher:doSearchImg" style="width:100px;height: 20px;"></input>
													
<!--													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('upimg.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>-->
	
													<script>
													    //分组combobox事件
													    $("#scGroupComboboxImg").combobox({
													    	onChange : function(){
													    	    
													    		  //ajax请求获取数据
													              ajaxGetSucaiData(0,"","scGroupComboboxImg",4,"dgImg");												    	   
													    	}
														}); 

													    //搜索
														function doSearchImg(value,name){

															    ajaxGetSucaiData(1,value,"scGroupComboboxImg",4,"dgImg");
															 
														}
														
													</script>
												</div>
										   </div>
                                          
                                          
                                          

                                    </div>
			                       
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
										
											
											<a title="<ww:property value='#session.local.a00270' />" href="javascript:addTouchMuti(1);"  style="width: 40px;height:30px;">
											  <img src="image/item/sc_right.png" alt="" height="30px" width="40px" />
											</a>  <!-- 添加到已选列表 -->
											
											<a title="<ww:property value='#session.local.a00025' />" href="javascript:removeit(1);" style="width: 40px;height:30px;">
											     <img src="image/item/sc_del.png" alt="" height="30px" width="40px" />
											</a>  <!-- 删除 -->
											
											
								    </div>
								    
								    
								    
                                    <!-- 已选图片 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table id="dg" class="easyui-datagrid"  title="<ww:property value="#session.local.a00267"  />" style="width:400px;height:280px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												method: 'get',
												onClickCell: onClickCell,
												nowrap:true	
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true,hidden:true"></th>
														<th data-options="field:'tScName',width:350"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>												
                                                    </tr>
							                 </thead>
					                  </table>	           
							         
								   
						           </div>
			                 </div>
			                 <div style="padding:20px 20px 10px 380px;">
		                           <p>		                           
		                                <button  class="btn btn-sm btn-primary " onclick='setPathSubmit(1)' type="button"><ww:property value='#session.local.a00080' /></button>
		                           </p>
			
		                     </div>  
			                 
        </div>
    
    
    
       <!-- 弹出框 播放 选择素材-->
      <div id="win-resourcePlay" class="easyui-window"  closed="true" title="<ww:property value='#session.local.a00330' />" style="width:850px;height:400px;"  data-options="left:'10px',top:'60px',collapsible:false,
			minimizable:false,
			maximizable:false" >
			
			               <div id="targetDivContentVideo" style="padding-top: 10px;padding-left: 20px;">
			                        <div id="targetDivContentVideoLeft" class="am_right scrollbar-hover" style="height:280px;width:350px;float:left;">
                                    
                                            <table id="dgScVideo" class="easyui-datagrid"  title="<ww:property value='#session.local.b00017'/>" style="width:350px;height:280px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: false,
												toolbar: '#tbdgScVideo',
												method: 'get',
												nowrap:true	,
												selectOnCheck:true,
												checkOnSelect:true,
												multiple: true,
												pagination: true,
												fit:true
											">
							                <thead>
								                    <tr>
								                        <th data-options="field:'ck',checkbox:true"></th>
														<th data-options="field:'tScName',width:280"><ww:property value='#session.local.a00133'/></th><!-- 名称 -->
														<th data-options="field:'tScFileName',hidden:true"></th>
									        	    </tr>
							                 </thead>
			                              </table>
			                              
			                              <div id="tbdgScVideo" style="height:auto;line-height: 0px;">
												
												<div>
													<ww:property value='#session.local.b00014'  />:<!-- 分组 --> 
													<select  id="scGroupComboboxVideo"  class="easyui-combobox" panelHeight="auto" style="width:100px;height: 20px;">
														<option <ww:if test="gssi.sucaigroupid==0">selected="selected" </ww:if>  value="0"><ww:property value='#session.local.a00815'  /></option> <!-- 全部 -->
														<option <ww:if test="gssi.sucaigroupid==-1">selected="selected" </ww:if>  value="-1"><ww:property value='#session.local.b00015'  /></option><!-- 共享 -->
														<ww:iterator value="listsfgp">
														       <option  <ww:if test="gssi.sucaigroupid==id">selected="selected" </ww:if>  value="<ww:property value='id'  />"><ww:property value="name"  /></option>
														</ww:iterator>
													</select>
													<input id="ser" class="easyui-searchbox" data-options="prompt:'<ww:property value='#session.local.a00071'  />',searcher:doSearch" style="width:100px;height: 20px;"></input>
													
<!--													<a style="height: 20px;" title="<ww:property value='#session.local.a00063' />" href="javascript:open_item_sucai_onload('upimg.jsp')" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick=""></a>-->
	
													<script>
													    //分组combobox事件
													    $("#scGroupComboboxVideo").combobox({
													    	onChange : function(){
													    		  //ajax请求获取数据
													              ajaxGetSucaiData(0,"","scGroupComboboxVideo",3,"dgScVideo");												    	   
													    	}
														}); 

													    //搜索
														function doSearch(value,name){
															     ajaxGetSucaiData(1,value,"scGroupComboboxVideo",3,"dgScVideo");
														}
														
													</script>
												</div>
										   </div>
                                    
                                    
                                    </div>
			                       
								    <div class="part2_2 part2_2_3" style="float: left;margin-right: 0px; margin-top: 80px;width: 50px;">
											
											<a title="<ww:property value='#session.local.a00270' />" href="javascript:addTouchMuti(2);"  style="width: 40px;height:30px;">
											     <img src="image/item/sc_right.png" alt="" height="30px" width="40px" />
											</a>  <!-- 添加到已选列表 -->
											<a title="<ww:property value='#session.local.a00268' />" href="javascript:MoveUp(2);"  style="width: 40px;height:30px;">
											     <img src="image/item/sc_up.png" alt="" height="30px" width="40px" />
											</a>  <!-- 上移 -->
											<a title="<ww:property value='#session.local.a00269' />" href="javascript:MoveDown(2);" style="width: 40px;height:30px;">
											   
											     <img src="image/item/sc_down.png" alt="" height="30px" width="40px" />
											   
											</a>  <!-- 下移-->
											<a title="<ww:property value='#session.local.a00025' />" href="javascript:removeDg(2);" style="width: 40px;height:30px;">
											    <img src="image/item/sc_del.png" alt="" height="30px" width="40px" />
											</a>  <!-- 删除 -->
											
											
								    </div>
								    
								    
								    
                                    <!-- 已选视频 -->
						            <div style="float: left;margin: 0px 0px; padding: 0px 0px;" >
						                 <table id="dgVideo" class="easyui-datagrid"  title="<ww:property value="#session.local.a00267"  />" style="width:400px;height:280px;margin: 0px;padding: 0px;"
											data-options="
											    rownumbers:true,
												singleSelect: true,
												toolbar: '#tbVideo',
												method: 'get',
												onClickCell: onClickCellVideo,
												nowrap:true	
												
											">
							                <thead>
								                    <tr>
														<th data-options="field:'tScNameVideo',width:270"><ww:property value='#session.local.a00133'/></th>
														
														
														<th data-options="field:'tScVol',width:80,formatter:unitformatterVol,
														    
                                                             editor: 
                                                               { type: 'combobox', 
                                                                 options: 
                                                                        {  data:vols,
                                                                           valueField:'value',
					                                                       textField:'text',
					                                                       method:'get',
					                                                       required:true
					                                                      
                                                                        } 
                                                               }
                                                        "><ww:property value='#session.local.b00022'/></th>
                                                        <th data-options="field:'tScFileNameVideo',hidden:true"></th>
									        	    </tr>
							                 </thead>
					                  </table>	               
							         
								      <div id="tbVideo" style="height:auto;line-height: 0px;">
							          	    <a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton" data-options="iconCls:'icon-edit'" onclick="setPlayAll(6)">
											<ww:property value='#session.local.b00023'/></a><!-- 设置视频音量 -->
											
											<a href="javascript:void(0)" style="height: 20px;"  class="easyui-linkbutton"  onclick="endEditingVideo()">
                                                  <ww:property value='#session.local.b00050'/>
                                            </a><!-- 保存更改 -->
														
									  </div>
									   
									    
						           </div>
			                 </div>
			                 
			                 <div style="padding:20px 20px 10px 380px;">
		                           <p>		                           
		                                <button  class="btn btn-sm btn-primary " onclick='setPathSubmit(2)' type="button"><ww:property value='#session.local.a00080' /></button>
		                           </p>
			
		                     </div>   
			
			
			
	   </div>
        
    
       <!-- 弹出框 设置音量大小-->
    <div id="win-vol" class="easyui-window"  closed="true" title="<ww:property value='#session.local.b00018'/>" style="width:260px;height:120px;"  data-options="left:'500px',top:'160px',collapsible:false,
		minimizable:false,
		maximizable:false" >
		<div style="padding:20px 20px 10px 30px;">
			<p><input class="easyui-combobox"   id="volAll" type="text" style="float: left;width: 150px;"   /><a style="float: right;" href="javascript:setPlayVolSubmit();" class="easyui-linkbutton"><ww:property value="#session.local.a00080"/></a></p>
			
		</div>  
    </div>
    
    
    
	  <!-- 预览显示 -->           
	   <div   id="preview"  style="position: absolute;display: none;z-index: 9999;">
	           <img  id="show_img" src=""  height="100px"  width="150px" />   
       </div>
        
        
        
</body>
</html>
