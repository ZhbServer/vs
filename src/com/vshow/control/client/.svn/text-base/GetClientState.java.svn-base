package com.vshow.control.client;

import java.util.Hashtable;
import java.util.Properties;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.api.v1.data.ClientState;
import com.vshow.control.api.v1.data.Device;
import com.vshow.control.client.play.GetClientPlayInfoAction;
import com.vshow.control.tool.Constant;

public class GetClientState extends ActionSupport {
	Logger logger = Logger.getLogger(GetClientPlayInfoAction.class);
	private String ClientFrontTemperatrueState;// 终端屏前温度状态 0正常 1警告 2有故障
	private String ClientAfterTemperatrueState;// 终端屏后温度状态 0正常 1警告 2有故障
	private String ClientBrightnessState;// 终端亮度状态 0正常 1警告 2有故障
	private String ClientSomkeState;// 终端烟感状态 0正常 1警告 2有故障
	private String sendkey; // 发送消息的sendkey
	private String reportJson;

	public String execute() throws Exception {
		try {
				System.out.println("开始回传");
			if (reportJson != null && !reportJson.equals("")) {

				// 转换为json
				JSONObject jsonObject = JSONObject.fromObject(reportJson);
				System.out.println(jsonObject);
				// properties.get
				sendkey = jsonObject.getString("sendkey");
				ClientFrontTemperatrueState = jsonObject
						.getString("ClientFrontTemperatrueState") + "";
				ClientAfterTemperatrueState = jsonObject
						.getString("ClientAfterTemperatrueState") + "";
				ClientBrightnessState = jsonObject
						.getString("ClientBrightnessState") + "";
				ClientSomkeState = jsonObject.getString("ClientSomkeState")
						+ "";
			}
			ClientState clientState = new ClientState();
			if (isnull(ClientFrontTemperatrueState)) {

			} else if (ClientFrontTemperatrueState == "1") {
				System.out.println("终端屏前温度警告！");
			} else {
				clientState
						.setClientFrontTemperatrueState(ClientFrontTemperatrueState);
			}
			if (isnull(ClientAfterTemperatrueState)) {

			} else if (ClientAfterTemperatrueState == "1") {
				System.out.println("终端屏后温度警告！");
			} else {
				clientState
						.setClientAfterTemperatrueState(ClientAfterTemperatrueState);
			}
			if (isnull(ClientBrightnessState)) {

			} else if (ClientBrightnessState == "1") {
				System.out.println("终端亮度警告！");
			} else {
				clientState.setClientBrightnessState(ClientBrightnessState);
			}
			if (isnull(ClientSomkeState)) {

			} else if (ClientSomkeState == "1") {
				System.out.println("终端烟感警告！");
			} else {
				clientState.setClientSomkeState(ClientSomkeState);
			}
			Constant.clientPlayMap.put(sendkey, clientState);
		} catch (Exception e) {
			logger.error(e);
			return ERROR;
		}
		return SUCCESS;

	}

	private boolean isnull(String state) {
		boolean flay = false;
		if (state == null || state.equals("") || state.equals("null")) {
			flay = true;
		}
		return flay;
	}

	public String getReportJson() {
		return reportJson;
	}

	public void setReportJson(String reportJson) {
		this.reportJson = reportJson;
	}

	public String getSendkey() {
		return sendkey;
	}

	public void setSendkey(String sendkey) {
		this.sendkey = sendkey;
	}

	public String getClientFrontTemperatrueState() {
		return ClientFrontTemperatrueState;
	}

	public void setClientFrontTemperatrueState(
			String clientFrontTemperatrueState) {
		ClientFrontTemperatrueState = clientFrontTemperatrueState;
	}

	public String getClientAfterTemperatrueState() {
		return ClientAfterTemperatrueState;
	}

	public void setClientAfterTemperatrueState(
			String clientAfterTemperatrueState) {
		ClientAfterTemperatrueState = clientAfterTemperatrueState;
	}

	public String getClientBrightnessState() {
		return ClientBrightnessState;
	}

	public void setClientBrightnessState(String clientBrightnessState) {
		ClientBrightnessState = clientBrightnessState;
	}

	public String getClientSomkeState() {
		return ClientSomkeState;
	}

	public void setClientSomkeState(String clientSomkeState) {
		ClientSomkeState = clientSomkeState;
	}

}
