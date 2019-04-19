package com.vshow.control.tool;

public class VVersion {
	
   /**
    * V 6.0.02        添加互动模块 (主线)    
    *************************************************************
    * V 6.0.02.01     1.二次开发  切纸机 (重要更新 发布下载节目修改 )
    *                 2.发布下载节目 节目场景过多 终端播放场景有概率出现未找到文件问题
    * V 6.02.04       切纸机优化         
    **************************************************************                 
    * V 6.0.03        1.添加网络摄像头(主线)
    *                 2.制作节目/互动节目  状态显示和功能列表互换位置
    *                 3.修复bug发布节目后 通过节目去查看已发终端当终端删除后报错问题
    *                 4.录入在线终端问题
    *                 5.修复轮播计划时间控件问题
    **************************************************************
    * V 6.0.04        1.修复在 IE11上 制作节目  添加文本样式 左对齐 居中 右对齐 显示乱码问题
    *                 2.优化上传 背景/图片 尺寸大于2000 按比例缩放显示 
    *                 3.添加排队叫号插件
    *                 4.修改新增计划360浏览器白屏问题 
    **************************************************************
    *V 6.1.0          1.节目协议重新定义  新增互动 触摸功能
    *V 6.1.1          1.修改制作节目天气bug,发布互动bug
    *V 6.1.2          1.兼容浏览器(google,IE11,360兼容模式 360极速模式 )
    *V 6.1.3          1.修改页面样式 统一按钮风格
    *V 6.1.3_LE       1.乐视定制开发
    *V 6.1.5_LE
    **************************************************************
    *V 6.1.6          1.二次开发泰国公交站对接
    *V 6.1.7          1.制作节目新增网格吸附功能 
    *                 2.修改节目发布计划bug 
    *                 3.新增撤销节目
    *V 6.1.8.170306   1.触摸互动发布版本 版本以6.1.8为准 日期为当天改动bug
    *V 6.1.9.170306   1.二次开发发布节目，导出节目添加播放次数可添加到主线                 
    *V 6.1.9.170414   1.添加感应发布  新增表t_induction_send               
    *V 6.1.9.170418   1.修改文本bug 2.修改互动节目关系节目的总大小计算bug 
    *            
    *V 6.1.9.170527   1.制作节目添加插件充电桩
    *                 2.发布节目重构协议
    *                 3.发布节目视频下载 新增资源下载方式 乐视云 t_sucai_cloud
    *                 4.office上传修改为wps
    *                 5.日志导出 
    *                 6.数据接口 t_sjjk.sql
    *                 7.终端绑定 t_client_bind.sql
    *                 8.通讯协议修改
    *                 9.互动节目   添加事件 添加广播跳转节目(按设置的编号)
    *                 10.发送互动节目可排序 排序目的针对于广播跳转     0517
    *                 11.二次开发 语音播报  新增表    t_voice_broadcast  0524
    *                 12.节目制作素材添加分页     0527
    *                 *****************************************************************
    *V 6.1.9.170609   1.人脸识别统计         0602   新增表  t_count_people
    *                 2.api接口
    *                 3.计划发布页面修改(日程)
    *                 4.互动节目添加分组   新增表  t_interact_item_group    t_interact_item_group_relation   
    * V 6.1.9.170619  5.添加拓展权限  新增表 t_power_expand  字段 expandcontent 格式{powername:xxxx,state:0( 0无权限 1有权限 )}
    *                 6.添加控件节目发布(不同的用户发布节目在同一块屏上不同区域显示) 
    * V 6.1.9.170628  6月正式版本
    * 
    * V 6.1.9.170629  1.用户使用存储空间大小    新增表    t_user_space.sql , t_user_space_state
    * V 6.1.9.170722_Test 2.乐视添加文件下载不成功回传错误信息           新增表   t_result_down_fail
    *                 3.优化普通节目导入特殊字符bug@
    *                 4.录入终端(未录入里面可通过终端预设终端名 )   新增表  t_allmark_name  
    *                 5.二次开发工厂计划 新增表   t_factory_plan , t_factory_plan_item , t_item_material 
    *                 6.发布开关机计划可编辑,删除
    *                 7.制作节目添加相册
    *                 8.修改查询节目列表查询数据 (全部分组查看自己,下级,共享;我的节目分组查看自己的)
    *                 9.下级用户录入终端上级可以查看 
    *                 10.新增互动节目导入功能
    *                 11.用户添加删除功能
    *                 12.制作节目添加时钟 倒计时是否显示单位
    * V 6.1.9.170805  13.优化统计素材 统计在线时长 
    *                 工厂计划
    *                 14.用户添加上传存储空间(素材有效)
    *                 15.人脸识别 统计 统计记录 年龄 性别
    *                 16.精准发布 新增表 t_accurate_send  ,t_client_people_code
    *                 1.新增表    t_item_edit_history 添加节目修改记录
    *                 统计素材新增列 mClickCount
    *                 alter table t_sucai_play_count add column mClickCount int(10)  default 0
    * V 6.1.9.171031  1.二次开发添加 台标发布  新增 t_tb 表                
    *                 2.批量监控  新增表   t_jiankong_history
    * V6.1.9.171113   1.优化 密码加密处理    
    * V6.1.9.171209   1.修改jdbc连接
    *                 2.修改apk更新方式 预置更新apk列表        新增表 t_apk
    *                         
    *          1213   1.细分发布权限   
    *          1214   添加下载队列  ,修改分配终端选择用户添加搜索
    *          1220   制作节目 添加层级 兼容老版本   program.txt,program2.txt
    *          1223   修复bug 制作节目 网页 特殊字符 '#' ,文本滚动模式,普通节目列表 添加制作人   
    *          180105 图片组 添加事件 全屏滑动  
    *          180124 李嘉俊 银行开发   新增表 t_edit_pwd_history,t_user_check
    *          180301 添加互动节目复制    
    *          180305 新增表 t_scene_content  场景内容表 
    *          180320 互动节目 触摸显示添加文本  动作添加串口  修改bug 
    *                 协议传输加密
    *                 修复播放文本 无法换行bug
    *                 修复录像bug
    *                 预览节目 添加实时性  天气，时钟，网页 
    *                 添加RSS
    *                 优化部分页面显示问题     
    *          180427 添加投影仪协议功能    新增表   t_projection
    *          180502 添加导出节目导出播放模式
    *          180503 工厂计划添加表       t_factory_plan_item_relation
    *          180507 添加广告位数据表  t_client_advertising  广告位剩余量
    *                 添加广告统计            t_advertising_play
    *                 制作节目添加图片 按比列添加
    *          180522 新增用户状态审核计划  
    *          alter table t_user add column jhocheck int(10)  default 1        
    *          alter table t_jh add column ocheck int(10)  default 1   
    *          新增表 预警节目表
    *          t_client_item_warning
    *          180601 定时待机唤醒
    *          新增表
    *          t_standby_walk
    *          180619 制作节目添加翻书效果
    *          180703 通知 添加左右类型
    *          180707 添加定时背光 
    *          新增表     t_time_backlight
    *          180719 添加跳转节目设置密码
    *          180726 添加GPIO设置感应类型,统计人数方式添加GPIO方式统计,远程设置终端指向服务端IP
    *          添加表  t_data
    *          181015 双屏异显  添加表   t_item_vice,t_scene_sub,t_scene_content_sub
    *          181121 t_data_dish  二次开发 菜市场数据显示手机端
    *          二次开发 条件节目发布 ，接口传入条件 新增表  
    *          t_item_key
    *          添加表字段 t_tq  type   //添加国外天气
    *          alter table t_tq add column type int(10) default 0   
    *          添加节目标签
    *          ALTER TABLE t_item ADD COLUMN lable VARCHAR(100);
               ALTER TABLE t_interact_item ADD COLUMN lable VARCHAR(100);
                                       二次开发添加宝箱功能 
                                       添加表 t_treasure                        
                                       
                                       
                                       
    *          
    *          
    **/       
   //public static String versions="6.1.9.170707_LE";
   //public static String versions="6.1.9.180228_T";
   //public static String versions="6.1.9.1804011_Warning";
   //public static String versions="6.1.9.180403";
   //public static String versions="6.1.9.180515";  广告位统计发布版
   //public static String versions="6.1.9.180524_L"; //终端认证 授权文件
   //public static String versions="6.1.9.180528"; //天气添加城市
   //public static String versions="6.1.9.180608"; //定时待机唤醒,垫片
   //public static String versions="6.1.9.180619"; //制作节目添加翻书效果
   //public static String versions="6.1.9.180622"; //串口接收数据显示	
   //public static String versions="6.1.9.180625_11001"; //改端口11001
   //public static String versions="6.1.9.180628"; //添加日志导出功能
   //public static String versions="6.1.9.180711"; //添加日志导出功能
   //public static String versions="6.1.9.180719"; //添加跳转节目设置密码
   //public static String versions="6.1.9.180727";
   //public static String versions="6.1.9.180727";//特殊版本改Logo
   //public static String versions="6.1.9.180815";//制作节目添加环境控件类型
   //public static String versions="6.1.9.180821";//制作节目添加环境控件类型(中创联合深圳)
   //public static String versions="6.1.9.180827";//修改终端名从终端设置里面 移动到终端控制
   //public static String versions="6.1.9.180904";//修改终端名从终端设置里面 移动到终端控制
   //public static String versions="6.1.9.180912"; //蒲义二次开发接口
   //public static String versions="6.1.9.180929"; //主线
   //public static String versions="6.1.9.181009"; //修改插播计划定时bug
   //public static String versions="6.1.9.181012"; //修改插播计划定时bug
   //public static String versions="6.1.9.181113"; //添加手机端登陆发布节目
   //public static String versions="6.1.9.181113";  //添加双屏节目（普通,互动）
	
   //public static String versions="6.1.9.181119";  //预警节目添加预警时间设置
  
   //public static String versions="6.1.9.181206";       //双屏异显示
   //public static String versions="6.1.9.181211_CALL";  //二次开发叫号 柜员
   //public static String versions="6.1.9.181210_D";     //二次开发菜价
   //                                                    //条件发布
   // public static String versions="6.1.9.181227";       //主线版本,添加国外天气
   
   //制作节目 添加  多颜色 选择 字体颜色，背景颜色 必须使用 1220以后的apk版本
   //public static String versions="6.1.9.190107";  //二次开发接口
	
   
   //public static String versions="6.1.9.190119"; //数据接口 添加滚动方式  ，滚动时间, 用户添加导入导出功能
   
   
   //public static String versions="6.1.9.190124"; 	//二次开发互动节目添加链接终端，新增office转换类型 openoffice
  
   //public static String versions="6.1.9.190218"; //添加节目标签  //制作节目添加人脸识别标签	
  
   //public static String versions="6.1.9.190219";   //制作节目时间控件添加样式
    
   // public static String versions="6.1.9.190309";  //互动节目添加轮播插件
    
   // public static String versions="6.1.9.190320"; //人数统计wife探针 人脸识别
	
   //public static String versions="6.1.9.190401"; //互动节目轮播优化
	
   public static String versions="6.1.9.190417"; //新增表t_client_number 显示终端的页面添加终端编号
	
   public String  psof="0";   //节目播放状态页面显示开关(0 隐藏  1显示)
   
   public String  cutt="0";   //二次开发切纸机显示开关(0 隐藏  1显示)
   
   public String  queue="0";  //叫号插件开关(0隐藏 1显示)
   
   public String  khshow="0"; //客户管理(0隐藏 1显示)
   
   public String  bus="0";    //泰国公交巴士显示开关(0隐藏1显示) 
   
   public static int onfff_60818=1;  //打开发布下载节目协议(0.关闭  1打开)
   
   public String le_entershow="1";   //乐视录入终端页面显示 (0隐藏 录入终端页面  1显示录入终端页面)
   
   public static int le_enter=1;     //乐视终端插入未录入终端表[自动] (0不插入 到未录入终端表  1插入到未录入终端表)
   
   public static int le_fbclientname=0;  //乐视修改终端名后远程发送(0发送  1不发送)
   
   public static int le_clientdisabled=0;     //乐视终端禁用发布(0打开禁用 1关闭禁用 )
   
   public String itemSetPlayNumber="1";        //20170306发布节目 导出节目播放次数(0不设置 1设置)
   
   public String interactGroupShowState="1";    //20170317互动组开关(区域)(0关闭 1打开)
   
   public static int debug_messageMap=0;        //调试模式 打印messageMap 0关闭 1调试
  
   public String  countShow="1";                //统计(0隐藏 1显示)
   
   public String  helpIndexShow="1";            //帮助>首页(0隐藏 1显示)
   
   public String  inductionShow="1";            //感应发布(0隐藏 1显示)
   
   public String  rebootStandbyWakeShow="1";    //待机唤醒重启按钮(0隐藏 1显示)
   
   public String  chargingPilesShow="0";       //充电桩插件显示开关(0隐藏1显示)
   
   public String  dataSourceShow="1";          //数据接口显示(0隐藏 1显示)
   
   public String  voiceBroadcastShow="0";       //语音播报(0隐藏 1显示)
   
   public String  peopleCountShow="1";          //人数统计(0隐藏 1显示)
   
   public String  dllItemSendShow="1";          //控件播放节目(0隐藏 1显示)C:\Users\Administrator\Documents\Tencent Files\351242949\FileRecv\
   
   //public String  clientValidPeriod="1";		//终端有效期
   
   public String  bindClientShow="0";           //终端绑定 (0隐藏 1显示)
   
   public String letvDownFailShow="0";          //乐视 查看未下载成功的文件(0隐藏 1显示)
   
   public String ramSizeShow="1";               //内存空间大小设置  (0隐藏 1显示)
   
   public static int  saveItemMaterial = 1;		//制作节目是否保存素材包(与工厂计划同步修改)
   
   public String  factoryPlanShow="1";			//工厂计划 (0隐藏 1显示)
   
   public String  accurateSendShow="1";			//精准投放 (0隐藏 1显示)
   
   public String  addItemButton="1";            //新方式增节目按钮显示隐藏
   
   public String  environmentalTestingShow="1"; //环境监测显示
   
   public String  tblogoShow="1";               //二次开发台标显示开关(0隐藏 1显示)
   
   ////////////////////////////////////////////////////////////////////////////////////////
   
   public static int  flagJmPwd=0;              //是否加密密码(0不加密  1加密)
   
   public static int  itemDllOnOff=0;           //节目元素添加到统一集合插件开关(0关闭 1打开)/层级元素显示
   
   public  String  editJdbcOnOff="0";           //修改jdbc连接密码     0隐藏    1显示
   
   public  String pwdPloy="0";                  //密码策略开关                0隐藏   1显示 
   
   ////////////////////////////////////////////////////////////////////////////////////////
   
   public String  rssOnOff="0";                 //Rss插件开关 
   
   public String warning="0";                   //预警接口   0隐藏 1显示
   
   public String zclhOnOff="0";                 //中创联合插件显示 
   
   public String projectorOnOff="1";            //投影仪开关
   
   public String vsLicensesOnOff="0";           //授权文件开关
   
   public String advertisingSpaceOnoff="1";     //广告位
   
   public static int advertisingSpaceCount=1;   //广告位统计
   
   public String warningitemOnOff="0";          //预警节目开关
   
   public String dpJhOnOff="0";                 //垫片计划开关
   
   public String timingBacklightOnOff="0";      //定时背光
   
   public String clientLxOnOff="0";      //预警终端提醒 
   
   public String viceItemOnOff="1";     //双屏节目开关
   
   public String envirType="105";       //环境监测类型 102,104 广州,105 中创联合 深圳  
   
   public String portsOnOff="0";       //二次开发 文本图片区域,全屏显示(陈涛)
   
   public String dataInfoOnOff="0";    //接收数据发送 
   
   public String dishOnOff="0";        //二次开发菜市场数据对接
   
   public String cllComponentOnOff="0"; //叫号组件,柜员组件
   
   public String conditionalOnOff="1"; //二次开发 条件发布 条件节目
   
   public String facerecognitionOnOff="1"; //二次开发人脸识别插件
   
   public String carouselOnOff="1";//二次开发轮播插件
   
   public String catalogOnOff="1";
   
   ///////////////////////////////////////////////////////////////////////////////////////////
}
