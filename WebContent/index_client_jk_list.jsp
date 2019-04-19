<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ww" uri="/webwork"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="PRAGMA" content="NO-CACHE" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="description" content="Restyling jQuery UI Widgets and Elements" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="assets/css/ace-fonts.css" />
	<link rel="stylesheet" href="assets/css/ace.min.css" id="main-ace-style" />
	
	



	<!--[if lte IE 9]>
		<link rel="stylesheet" href="assets/css/ace-part2.min.css" />
	<![endif]-->
	<!--[if lte IE 9]>
	  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
	<![endif]-->
	<script src="assets/js/ace-extra.min.js"></script>
	<!--[if lte IE 8]>
	<script src="assets/js/html5shiv.min.js"></script>
	<script src="assets/js/respond.min.js"></script>
	<![endif]-->
	<script type="text/javascript" src="js/jq/jquery.js"></script>
	<script type="text/javascript" src="js/layer/layer.js"></script>
	
	<script type="text/javascript">
	    function onload_self(){
	    	 var rotate=$("#rotate").val();  //获取Select选择的Value
	    	 layer.load();
             window.location.href="jklist.vs?rotate="+rotate;

		}


		function return_self(){
			layer.load();
			window.location.href="onclient.vs";
			
	    }

	    //定时
	    var ints=setInterval(onload_self, 10000)


	    //弹出查看
	    function open_sel_img(filename){
		    //获取旋转角度
		    var rotate=$("#rotate").val();  //获取Select选择的Value
	    	clearInterval(ints);
	    	layer.open({
	    		  type: 1,
	    		  area: ['800px', '400px'],
			      offset: '30px',
	    		  title: false,
	    		  closeBtn: 0,
	    		  shadeClose: true,
	    		  skin: 'yourclass',
	    		  content: "<img  id='jkImgShow' src='see/"+filename+"' width='800px' height='400px' style='transform:rotate("+rotate+"deg);' />",
	    		  end: function(){ 
		    		  
	    			  setInterval(onload_self, 10000);

		    	  }
	    		});
		}

		
	
	</script>
</head>

<body class="no-skin">

        
		<!-- #section:basics/navbar.layout -->
		

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">

			

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<!-- #section:basics/content.breadcrumbs -->
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
						   <ww:property value="#session.local.a00568"/>							
						</li>
						<li>
							<ww:property value="#session.local.b00220"/>
						</li>
					</ul><!-- /.breadcrumb -->

					<!-- #section:basics/content.searchbox -->
					<div class="nav-search" id="nav-search" > 
					    <ww:property value="#session.local.a00279"/>
					    :
					    <select  id="rotate" name='rotate' onchange="onload_self()" style="width: 80px;">
					          <option value="0"  <ww:if test='rotate==0'> selected="selected"</ww:if>  > 0</option>
				              <option value="180"  <ww:if test='rotate==180'> selected="selected"</ww:if>  >180</option>
				        </select>
                         &nbsp;&nbsp;
                         <button class="btn btn-xs btn-primary btn-round" onclick="onload_self()">
							  <ww:property  value="#session.local.a00422"/>
							  <!-- 刷新 -->
						 </button>
						 &nbsp;&nbsp;
	                     <button class="btn btn-xs btn-primary btn-round" onclick="return_self()">
	                          <ww:property  value="#session.local.a00014"/>
						      <!-- 返回 -->
						 </button>
					</div><!-- /.nav-search -->
				</div>


				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">

					<!-- /section:settings.box -->
					<div class="page-content-area">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="row-fluid">
									<ul class="ace-thumbnails">
									
									   <ww:iterator value="jkList">
									       <li>
									       
											<a href="javascript:open_sel_img('<ww:property value='filename'/>')" title="<ww:property value='clientName'/>" data-rel="colorbox">
												<img alt="150x150" src="see/<ww:property value='filename'/>" width="200px" height="120px"  style='transform:rotate(<ww:property value='rotate'/>deg);'/>
												
												<div class="tags">
												
													<span class="label-holder">
														<span class="label label-info arrowed">
														   <ww:property value="clientName"/>
														</span>
													</span>

													<span class="label-holder">
														<span class="label label-success arrowed">
														   <ww:property value="cdate"/>
														</span>
													</span>

												</div>
											</a>

										</li>
									   
									   </ww:iterator>
						
										
										
										
									</ul>
								</div><!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content-area -->
				</div><!-- /.page-content -->
			</div><!-- /.main-content -->

			
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
		<script type="text/javascript">
		 window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
		</script>
		<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

	</body>
</html>