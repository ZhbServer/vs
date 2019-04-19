package com.vshow.control.interfaces;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.util.DataUtil;
import com.opensymphony.xwork.ActionSupport;

import com.vshow.control.data.AllMark;
import com.vshow.control.data.Client;
import com.vshow.control.data.ClientGroupRelation;
import com.vshow.control.data.User;

import com.vshow.control.data.Result;

import com.vshow.control.log.LogHandle;
import com.vshow.control.log.LogType;
import com.vshow.control.protocol.Protocol;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.DateUtil;
import com.vshow.control.tool.HttpRequest;
import com.vshow.control.tool.JsonHelper;
import com.vshow.control.tool.Mlt;
import com.vshow.control.tool.MyMsg;
import com.vshow.control.tool.SqlConnect;

import com.vshow.control.tool.VSNettyChannelMap;
import com.vshow.control.tool.VVersion;

public class SendInteractDllAction extends ActionSupport {

    private String account;   //登录名
	
	private String password;  //密码
	
	private String clientMarks; // 终端标识多个用,隔开
	
	private int type; // (播放类型 0清理  1文本 2图片 )
	private int showType; // (显示类型 0局部 q全屏)

	// 文本

	private String titleContent; // 标题内容 ,标题默认 居中显示
	private int titleFs; // 标题字体大小
	private String titleFcolor;// 标题字体颜色

	private String bcolor;// 背景颜色
	private String txtcontent; // 文本内容
	private int fs; // 字体大小
	private String fcolor;// 字体颜色

	// 图片
	private String fileFileName; // 文件名称
	
	private File file; // 文件

	private String content; // 返回内容

	Log logger = LogFactory.getLog(SendInteractDllAction.class);

	// 终端标识多个用,隔开
	public boolean checkClientMarks(String clientMarks) {

		if (clientMarks == null || clientMarks.length() == 0) {
			return false;
		} else {
			return true;
		}

	}

	// 0播放 1清理
	public boolean checkSendType(int sendType) {

		if (sendType == 0 || sendType == 1) {
			return true;
		} else {
			return false;
		}
	}

	// 类型0 清理 1文本 2图片
	public boolean checkType(int type) {

		if (type == 1 || type == 2||type==0) {
			return true;
		} else {
			return false;
		}
	}

	// 显示类型 0局部1全屏
	public boolean checkShowType(int showType) {

		if (showType == 0 || showType == 1) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public String execute() throws Exception {

		logger.info("插件接口请求:标识" + clientMarks + " 类型:"
				+ type + " 显示类型:" + showType + " 标题内容:" + titleContent
				+ " 标题字体大小:" + titleFs + " 标题字体颜色:" + titleFcolor + " 背景颜色:"
				+ bcolor + " 文本内容:" + txtcontent + " 字体大小:" + fs + " 字体颜色:"
				+ fcolor + " 文件名称:" + fileFileName);

		String info = "";
		String code = "00000"; // 00000发送成功 00001 标识码不能为空 00002终端不存在 00003参数不合法 00004 终端未认证 00005终端未接受00006账户或者密码错误 00007文件不合法
		boolean flag = false;
		
		//验证用户
		User usparam = new User();
		account = account.trim();
		password = password.trim();
		usparam.setAccount(account);
		usparam.setPassword(password);
		User user = (User) SqlConnect.getSqlMapInstance().queryForObject("sel_check_user_login", usparam);
		
		if (user == null) {
			code = "00006";
			info = "账户或者密码错误";
		}else{
			
			if (!checkClientMarks(clientMarks)) {
				code = "00003";
				info = "终端标识不合法";
				flag = false;
			} else if (!checkType(type)) {
				code = "00003";
				info = "播放类型不合法";
				flag = false;
			} else if (!checkShowType(showType)) {
				code = "00003";
				info = "播放类型不合法";
				flag = false;
			} else {
				flag = true;
			}

			if (!flag) {

			} else {
				
				Protocol protocol=new Protocol();
				
				if(type==1){
					
					DllTxt dt=new DllTxt();
					
					dt.setBcolor(bcolor);
					dt.setTxtcontent(txtcontent);
					dt.setFcolor(fcolor);
					dt.setFs(fs);
					dt.setTitleContent(titleContent);
					dt.setTitleFcolor(titleFcolor);
					dt.setTitleFs(titleFs);
					dt.setType(2);
					dt.setmDirection(2);
					protocol=DllTool.crarteSendDll(type, showType, dt);
					
				}else if(type==2){
					
					if(file==null||fileFileName==null){
						code = "00007";
						info = "文件不合法";
						
					}else{
						
						String fileType = fileFileName.substring(fileFileName.lastIndexOf('.') + 1,	fileFileName.length()).trim().toLowerCase();
						//gif,jpg,jpeg,bmp,png
						if(fileType.equals("jpg")||fileType.equals("jpeg")||fileType.equals("png")){
							
							String tempname = Long.toString(System.currentTimeMillis())+ (int) (Math.random() * 100);
							
							String tempf = tempname + "." + fileType;
							
							File temfs = new File(Constant.FILES + File.separator + tempf);
							
							file.renameTo(temfs);
							
							DllMedia dm=new DllMedia();
							
							dm.setSname(fileFileName);
							
							dm.setFilesName(tempf);
							
							dm.setPath(tempf);
							
							dm.setType(1);
							  
							dm.setTimeoutMillis(5);
							  
							dm.setInAnim(6);
							
							protocol=DllTool.crarteSendDll(type, showType, dm);
						}else{
							code = "00007";
							info = "文件不合法";
						}
						
						
						
						
					}
					
					
					
				}else if(type==0){
					
					protocol=DllTool.crarteSendDll(type, showType, null);
					
				}
				

				String clientMarksArray[] = clientMarks.split("\\,");

				String clientMark = "";

				String sendkey = "";

				String msg0818 = "";

				MyMsg mymsg;
				
				JSONObject jsonObject;
				

				for (int i = 0; i < clientMarksArray.length; i++) {

					sendkey=Constant.createSendkey(1,DateUtil.getTime());
					
					clientMark=clientMarksArray[i];
					
					// 查询标识存在不存在
					Client client = (Client) SqlConnect.getSqlMapInstance()
							.queryForObject("sel_make_all_client", clientMark);

					if (client == null) {

						code = "00002";
						info = "终端不存在";
						break;

					} else {
						
						protocol.setSendkey(sendkey);
						
						jsonObject = JSONObject.fromObject(protocol);
						
						msg0818=Constant.sendDownString(jsonObject.toString(),sendkey,null);
						
						// 发送终端
						Mlt mt = Constant.messageMap.get(client.getMark());
						if (mt != null) {

							mymsg = new MyMsg();
							mymsg.msg = msg0818;
							mymsg.sendkey = sendkey;
							mt.allmsg.add(mymsg);

							Integer getMapSendkeyVal;

							int count = 0;
							// 等待终端请求回复
							while (true) {

								// 60秒超时退出
								if (count == 60) {
									info="终端未接收[发送不成功,超时]";
									code = "00005";
									break;
								}
								// 查看终端有没有消息返回
								getMapSendkeyVal = Constant.dllMapCheck.get(mymsg.sendkey);

								if (getMapSendkeyVal != null
										&& !getMapSendkeyVal.equals("")) {

									if (getMapSendkeyVal == 1) {
										//发布成功
										code = "00000";
										info ="发布成功";

									} 
									break;

								}

								count++;
                                Thread.sleep(1000);

							}

						} else {
							code = "00004";
							info = "终端未认证";
						}

					}

				}

			}
		
		}

		
        Map map=new HashMap<String, String>();
		
		map.put("code", code);
		
		map.put("info", info);
		
        JSONArray jsons1 = JSONArray.fromObject(map);
        
		content = jsons1.toString();
		
		return SUCCESS;
		
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
	public String getClientMarks() {
		return clientMarks;
	}

	public void setClientMarks(String clientMarks) {
		this.clientMarks = clientMarks;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getShowType() {
		return showType;
	}

	public void setShowType(int showType) {
		this.showType = showType;
	}

	public String getTitleContent() {
		return titleContent;
	}

	public void setTitleContent(String titleContent) {
		this.titleContent = titleContent;
	}

	public int getTitleFs() {
		return titleFs;
	}

	public void setTitleFs(int titleFs) {
		this.titleFs = titleFs;
	}

	public String getTitleFcolor() {
		return titleFcolor;
	}

	public void setTitleFcolor(String titleFcolor) {
		this.titleFcolor = titleFcolor;
	}

	public String getBcolor() {
		return bcolor;
	}

	public void setBcolor(String bcolor) {
		this.bcolor = bcolor;
	}

	public String getTxtcontent() {
		return txtcontent;
	}

	public void setTxtcontent(String txtcontent) {
		this.txtcontent = txtcontent;
	}

	public int getFs() {
		return fs;
	}

	public void setFs(int fs) {
		this.fs = fs;
	}

	public String getFcolor() {
		return fcolor;
	}

	public void setFcolor(String fcolor) {
		this.fcolor = fcolor;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public Log getLogger() {
		return logger;
	}

	public void setLogger(Log logger) {
		this.logger = logger;
	}

	public String getContent() {
		return content;
	}

}
