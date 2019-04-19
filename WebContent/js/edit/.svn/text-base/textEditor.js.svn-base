(function ($) {
	//作者:DJJ
	//插件名称:textEditor
	//本插件依赖jQuery、document.execcommand
	var text_editor_tool = null;
    var text_editor_methods = {
		command:function(e, commandName, commandValue, callback){
	        if(!text_editor_methods.currentRange()){
	            alert($.i18n.prop("progForm.unselectEditNoOperate"));
	        }else{
	        	if(commandName!="delete"){
	        		//恢复选中区
	        		text_editor_methods.restoreSelection();
	        	}
	            //判断对象是否存在
	            if(text_editor_tool && text_editor_tool.curTarget){
	            	//创建遮罩
	            	$("<div class='text-editor-shade'></div>").css({
	    				position:'absolute', 
	    				top:0, 
	    				left:0, 
	    				backgroundColor:"#83d65c", 
	    				opacity:1, 
	    				zIndex:30000 
	    			}).height(text_editor_tool.curTarget.height()+10).width(text_editor_tool.curTarget.width()).appendTo(text_editor_tool.curTarget); 
		         
	            	//执行
		            document.execCommand(commandName, false, commandValue);
		            
		            //确保字体大小
	            	text_editor_tool.curTarget.find("span").css('font-size','1em');
	            	//删除遮罩
	            	$(".text-editor-shade").remove();
	            }

	            //重新保存，否则chrome，360，safari，opera中会清空currentRange
	            text_editor_methods.saveSelection();
	            
	            //执行回调函数
	            if(callback && typeof callback === 'function'){
	                callback(this);
	            }

	            //更新菜单样式
	            text_editor_methods.updateMenuStyle();
	            console.log("text_editor_tool:");
	            console.log(text_editor_tool);
	            //变化监控
	            //text_editor_tool.change();
	        }

	        if(e){
	        	console.log("是不是打印了这句:"+e);
	            e.preventDefault();
	        }
    	},
    	alreadyInit:function(){
    		if(text_editor_tool){
    			return true;
    		}else{
    			return false;
    		}
    	},
        isContenteditable:function(){
        	console.log("询问是否可编辑:");
        	/**询问是否可编辑 **/
        	if(text_editor_tool && text_editor_tool.curTarget != null){
        		return text_editor_tool.contenteditable;
        	}
        },
        contenteditable:function(contenteditable){
        	console.log("设置是否可编辑:"+contenteditable);
        	/**设置是否可编辑 true、false**/
        	if(text_editor_tool && text_editor_tool.curTarget != null){
        		text_editor_tool.contenteditable = contenteditable;				
        		text_editor_tool.curTarget.attr("contenteditable",contenteditable);//.trigger("refresh");
        		text_editor_methods.updateMenuStyle();
        	}
        },
        fontColor:function(color){
        	/**设置字体颜色**/ 
        	document.execCommand("foreColor",false,color);
        },
        fontSize:function(size,e){
        	console.log("fontSize size:"+size);
        	/**设置字体大小**/
        	text_editor_methods.command(e,"fontSize",size);
        	//document.execCommand("fontSize",false,size);
        },
        fontStyle:function(style,flag,e){
        	/**设置字体样式 bold、italic、underline、striketthrough**/
        //	alert("style:"+style);
        	text_editor_methods.command(e,style,flag);
        	//document.execCommand(style,false,flag);
        },
        fontFamily:function(family){
        	/**设置字体**/
        	document.execCommand("fontName",false,family);
        },
        fontJustify:function(justify,e){
        	text_editor_methods.command(e,justify,null);
        	/**设置对齐样式 justifyCenter、justifyFull、justifyLeft、justifyRight**/
        	//alert("justify:"+justify);
        	//document.execCommand(justify,false,null);
        },        
        fontDelete:function(e){
        	text_editor_methods.command(e,"delete",null);
        	/**设置对齐样式 justifyCenter、justifyFull、justifyLeft、justifyRight**/
        	alert("justify:"+justify);
        	//document.execCommand(justify,false,null);
        },
        select:function(selectState){
        	/**设置选中状态 unselect、selectAll、selectCur**/
        	if(selectState === "selectCur"){
        		//
        	}else{
        		document.execCommand(selectState,false,null);
        	}
        },
        removeFormat:function(){
        	/**格式化**/
        	document.execCommand("removeFormat",false,null);
        },
        currentRange:function(cr){
        	/**设置或读取当前选中的range**/
			console.log("设置或读取当前选中的range");
            if(text_editor_tool && cr){
            	
            	text_editor_tool.currentRangeData = cr;
            	var txtedid = text_editor_tool.curTarget.attr("txtedid");
            	if(txtedid){
            		text_editor_tool.targets[txtedid]["currentRangeData"] = cr;
            	}
            }else{
            	//可能需要完善目标改变了的情况
                return text_editor_tool.currentRangeData;
            }
        },
        parentElemForCurrentRange:function(pe){
        	/**设置或读取当前选中range的父元素**/
            if(pe){
            	text_editor_tool.parentElem = pe;
            	var txtedid = text_editor_tool.curTarget.attr("txtedid");
            	if(txtedid){
            		text_editor_tool.targets[txtedid]["parentElem"] = pe;
            	}
            }else{
                return text_editor_tool.parentElem;
            }
        },
        saveSelection:function(range){
        	/**获取并保存选择区域**/
            //'initSelection'方法会传range参数过来
        	console.log("range:");
        	console.log(range);
        	console.log("saveSelection:");
        	//console.log(text_editor_tool.curTarget);
        	//console.log(text_editor_tool.curTarget.get(0));
            //页面加载时，初始化selection
            var methods = text_editor_methods,
                selection,
                _parentElem,
                txt = text_editor_tool.curTarget.get(0);
            //获取选中区域
            if(text_editor_tool.supportRange){
                //w3c
                if(range){
                    _parentElem = range.commonAncestorContainer;
                }else{
                    selection = document.getSelection();
                    if (selection.getRangeAt && selection.rangeCount) {
                        range = document.getSelection().getRangeAt(0);
                        _parentElem = range.commonAncestorContainer;
                    }
                }
            }else{
                //IE8-
                range = document.selection.createRange();
                if(typeof range.parentElement === 'undefined'){
                    //IE6、7中，insertImage后会执行此处
                    //由于找不到range.parentElement，所以干脆将_parentElem赋值为null
                    _parentElem = null;
                }else{
                    _parentElem = range.parentElement();
                }
            }
            console.log("准备确认选中区域");
            //确定选中区域在$txt之内
            if(_parentElem && ($.contains(txt, _parentElem) || txt === _parentElem)){
            	console.log("确定选中区域在$txt之内:");
            	//将父元素保存一下
            	methods.parentElemForCurrentRange(_parentElem);

                //保存已经选中的range
            	methods.currentRange(range);
            }
        },
        restoreSelection:function(pe){
        	/**恢复当前选中区域**/
            var methods = text_editor_methods,
            currentRange = methods.currentRange(),
            selection,
            range;

	        if(!currentRange){
	            return;
	        }
	        if(text_editor_tool.supportRange){
	            //w3c
	            selection = document.getSelection();
	            selection.removeAllRanges();
	            selection.addRange(currentRange);
	        }else{
	            //IE8-
	            range = document.selection.createRange();
	            range.setEndPoint('EndToEnd', currentRange);
	            if(currentRange.text.length === 0){
	                range.collapse(false);
	            }else{
	                range.setEndPoint('StartToStart', currentRange);
	            }
	            range.select();
	        }
        },
        initSelection:function(){
        	/**初始化选中区域**/
        	//currentRange为空时，初始化为$txt的最后一个子元素
            var methods = text_editor_methods,
            range,
            txt = text_editor_tool.curTarget.get(0);
            console.log("initSelection methods:");
            console.log(methods);
	        if(methods.currentRange()){
	            //如果currentRange有值，则不用再初始化
	            return;
	        }
	
	        if(text_editor_tool.supportRange){ 
	            //W3C方式
	            range = document.createRange();
	            range.setStart(txt, 0);
	            range.setEnd(txt, 0);
	        }
	
	        //将range保存
	        if(range){
	        	methods.saveSelection(range);
	        }
        },
		updateMenuStyle:function(menuKeys){
			//更新菜单样式(按钮是否选中之类,参数为需要判断是否激活的关键字数组)
			if(!menuKeys){
				menuKeys = text_editor_tool.menuKeys;
			}
			//获取激活状态的key(按钮之类)
			if(menuKeys && menuKeys.length > 0){
				text_editor_tool.activeKeys = {};
				for(var i=0,size=menuKeys.length;i<size;i++){
					var obj = document.queryCommandState(menuKeys[i]);
					if(obj){
						text_editor_tool.activeKeys[menuKeys[i]] = obj;
					}
				}
			}
			//自定义处理
			text_editor_tool.updateMenuStyleCustomHandle(text_editor_tool.activeKeys);
		}
    };
	
    $.fn.textEditor = function (method) {
        // 方法调用
        if (text_editor_methods[method]) {
            return text_editor_methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
    		var defval = {
    				//以下为该插件的属性及其默认值
    				target:".ql-editor", //目标元素选择关键字 比如 ID为a 是 #a ,class为b 是 .b ，默认值为.ql-editor
    				curTarget:null,//当前目标(JQ元素对象)
    				targets:{},//目标集合(内部对象集合,key和元素对象的txtedid属性对应)
    				eventTarget:null,//事件触发元素对象
    				event:null,//触发的事件
    				beforeToEventHandle:function(editor){},//事件处理前
    				afterToEventHandle:function(editor){},//事件处理后之后
    				contenteditable:false,//是否可编辑
    				supportRange:null,//是否支持w3c方法获取选取区域
    				currentRangeData:null,//选取区域内容
    				parentElem:null,//当前选中区域的父元素
    				choosing:false,//是否正在拖选内容
    				activeKeys:{},//当前处于激活状态的功能集合
    				menuKeys:["justifyLeft","justifyCenter","justifyRight","justifyFull","underline","italic","bold","fontSize"],//菜单键
    				updateMenuStyleCustomHandle:function(activeKeys){
    					$(".text_wrap .fonttype").removeClass("active");
    					
    					for(var key in activeKeys){
    						$(".text_wrap .fonttype[type='"+key+"']").addClass("active");
        					console.log("activeKeys["+key+"]:");
        					console.log(activeKeys[key]);
    					}
    					//for(var i=0,size=activeKeys.length;i<size;i++){
    					//	$(".text_wrap .fonttype[type='"+activeKeys[i]+"']").addClass("active");
    					//}
    				},//自定义菜单样式更新处理(传入参数为 激活状态的menuKey数组)
    				mousedownEventHandle:function(e){
    					
    				},//鼠标点击事件处理
    				keydownEventHandle:function(e){
    					
    				},//输入事件处理
    				keydownStopHandle:function(){
    					
    				},//停止输入处理(keyup后一定时间内，不进行下次keydown，则会触发该方法)
    				lastKeydownIndex:0,//上次按键输入索引
    				
    		};
    		//工具对象
    		text_editor_tool = $.extend(defval,method);
    		//目标元素集合
    		var targetSum = 0;
    		text_editor_tool.curTarget = $(text_editor_tool.target);
    		text_editor_tool.curTarget.each(function(){
    			targetSum++;
    			var obj = $(this);
    			var txtedid = "txtedid"+targetSum;
    			obj.attr("txtedid",txtedid);
    			text_editor_tool.targets[txtedid] = {"txtedid":txtedid,"ele":this};
    		});
    		//text_editor_tool.targets = $(ops.target);

    		//目标元素存在才进行处理，否则直接返回
    		if(targetSum == 0){
    			text_editor_tool = null;
    			return null;
    		}/*else if(targetSum == 1){
    			text_editor_tool.curTarget = text_editor_tool.targets[text_editor_tool.curTarget.attr("txtedid")];
    		}*/

    		/**绑定函数**/
    		//刷新
    		var refreshInfo = function(){
    			//得到焦点要把选择文本的样式反馈到工具栏,如果焦点不在文本中，则把工具栏样式置默认状态
    		}
    		
    		//监听
            function txtListener(e){
            	var e = e||event;
            	text_editor_methods.saveSelection();   //保存选中范围
                text_editor_methods.updateMenuStyle();  //更新菜单样式

                if(e && e.type === 'focus'){
                    //focus只能执行一次监听——页面一加载时$txt被强制执行focus()，而剩下的监听都会由click和keyup代替
                	text_editor_tool.curTarget.off('focus', txtListener);
                }
            }
    		
    		/**初始化设置**/
    		var initSet = function(){
    			var tabindex = 0;
    			for(var v in text_editor_tool.targets){
    				tabindex++;
    				var target = $(text_editor_tool.targets[v].ele);
    				target.attr("tabindex",tabindex).attr("contenteditable",text_editor_tool.contenteditable);
    				/**解绑**/
    				target.off(".init");
    				/**绑定选中事件**/
    				target.on({
    	    		    "blur.init":function(e){
    	    		    	console.log("b1");
    	    		    	if(!text_editor_tool.choosing){
    	    		    		console.log("b2");
        	    		    	text_editor_tool.event = e||event;
        	    		    	text_editor_tool.eventTarget = $(this);
        	    		    	//元素失去焦点
        	    		    	//text_editor_tool.curTarget = null;
        	    		    	
        	    		    	text_editor_tool.beforeToEventHandle(text_editor_tool);

        	    		    	refreshInfo();
        	    		    	
        	    		    	text_editor_tool.afterToEventHandle(text_editor_tool);
    	    		    	}
    	    		    },
/*    	    		    "focus.init click.init refresh.init":function(e){
    	    		    	console.log("z1");
    	    		    	if(text_editor_tool.curTarget){
	    	    		    	var e = e||event;
	    	    		    	//选中元素
	    	    		    	setTimeout(function(){
	    	    		    		text_editor_tool.event = e; 
	    	    		    		text_editor_tool.eventTarget = $(this);
	    	        		    	if(text_editor_tool.curTarget != text_editor_tool.eventTarget){
	    	        		    		text_editor_tool.curTarget = text_editor_tool.eventTarget;
	    	        		    	}
	    	    		    		
	    	        		    	text_editor_tool.beforeToEventHandle(text_editor_tool);
	    	        		    	
	    	        		    	refreshInfo();
	    	        		    	
	    	        		    	text_editor_tool.afterToEventHandle(text_editor_tool);
	    	    		    	},10);
    	    		    	}
    	    		    },*/
    	    		    "mousedown.init":function(e){
    	    		    	if(text_editor_tool.curTarget){
	    	    		    	var e = e||event;
	    	    		    	text_editor_tool.choosing = true;
	    	    		    	//当鼠标按下时，可能会拖拽选择，这就有可能拖拽到$txt外面再松开，需要监控
	    	    		    	text_editor_tool.curTarget.on('mouseleave', function(){
		    		                //鼠标拖拽到外面再松开的
	    	    		    		$(this).off('mouseleave'); 
		    		                //console.log("xxxx");
		    		                //setTimeout(function(){
		    		                //	text_editor_methods.restoreSelection();
		    		                //}, 100);
		    		            	setTimeout(txtListener, 100);  //缓0.1s，否则鼠标移动太快的话，选不全
		    		            	setTimeout(function(){
		    		            		text_editor_tool.choosing = false;
		    		            	},100);
	    	    		    	});
	    	    		    	text_editor_tool.mousedownEventHandle(e);
    	    		    	}
    	    		    },
    	    		    'click.init keyup.init':function(e){
    	    		    	console.log("y1");
    	    		    	console.log("y2:"+text_editor_tool.curTarget == null);
    	    		    	//if(text_editor_tool.curTarget){
    	    		    	text_editor_tool.curTarget = $(this);
    	    		    	console.log("y3:"+text_editor_tool.curTarget == null);
        	    		    	var e = e||event;
        	    	            var keyForMoveCursor = false,
        	    	                //上、下、左、右、home、end、pageup、pagedown、ctrl + a
        	    	                kCodes = [33, 34, 35, 36, 37, 38, 39, 40, 13, 8, 46, 9, 65]; 
        	    	            keyForMoveCursor = ( e.type === 'click' || (e.type === 'keyup' && (kCodes.indexOf(e.keyCode) !== -1) || e.ctrlKey || e.shiftKey || e.metaKey) );
        	    	            if (!keyForMoveCursor) {
        	    	                return;  //只监听click, 和 kCodes 中的这几个键，其他的不监听
        	    	            }

        	    	            console.log("yyyy");
        	    	            txtListener();

        	    	            if(e.type === 'click'){
        	    	                //鼠标未被按住拖拽到外面再松开，而是在$txt里面就松开了
        	    	            	text_editor_tool.curTarget.off('mouseleave');
        	    	            	text_editor_tool.choosing = false;
        	    	            }
        	    	            
    	    		    	//}
    	    	        },
    	    	        "keydown.init":function(e){
    	    	            if(e.keyCode === 9){
    	    	                //按tab键，增加缩进
    	    	            	text_editor_methods.command(e, 'insertHTML', '&nbsp;&nbsp;&nbsp;&nbsp;');
    	    	            }/*else if(e.keyCode === 8){
    	    	            	text_editor_methods.fontDelete();
    	    	            }*/
    	    	            text_editor_tool.keydownEventHandle(e);
    	    	            text_editor_tool.lastKeydownIndex++;
    	    	        },
    	    	        "keyup.init":function(e){
    	    	        	var index = text_editor_tool.lastKeydownIndex;
    	    	        	setTimeout(function(){
    	    	        		if(text_editor_tool.lastKeydownIndex === index){
    	    	        			text_editor_tool.keydownStopHandle(e);
    	    	        			text_editor_tool.lastKeydownIndex = 0; 
    	    	        		}
    	    	        	},500);
    	    	        }
    	    		});
    			}
    			//判断是否支持w3c获取选取区域方法
    			text_editor_tool.supportRange = typeof document.createRange === 'function';
    		}
    		initSet();
        	//return text_editor_methods.init.apply(this, arguments);
        } else {
            $.error('Method' + method + 'does not exist on jQuery.tooltip');
        }
    };

})(jQuery);