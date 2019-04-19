package com.vshow.control.api.v1.data;

public class ClientState {
    private String ClientFrontTemperatrueState;//终端屏前温度状态  0正常  1警告 2有故障
    private String ClientAfterTemperatrueState;//终端屏后温度状态  0正常  1警告 2有故障
    private String ClientBrightnessState;//终端亮度状态   0正常  1警告 2有故障
    private String ClientSomkeState;//终端烟感状态   0正常  1警告 2有故障
	public String getClientFrontTemperatrueState() {
		return ClientFrontTemperatrueState;
	}
	public void setClientFrontTemperatrueState(String clientFrontTemperatrueState) {
		ClientFrontTemperatrueState = clientFrontTemperatrueState;
	}
	public String getClientAfterTemperatrueState() {
		return ClientAfterTemperatrueState;
	}
	public void setClientAfterTemperatrueState(String clientAfterTemperatrueState) {
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
