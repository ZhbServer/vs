package com.vshow.control.tool.translate;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

public class TransApi {
	private static final String TRANS_API_HOST = "http://api.fanyi.baidu.com/api/trans/vip/translate";

	private String appid;
	private String securityKey;

	private static final String APP_ID = "20181225000252081";

	private static final String SECURITY_KEY = "R76y0bagQHBchBOEzbxJ";

	public TransApi(String appid, String securityKey) {
		this.appid = appid;
		this.securityKey = securityKey;
	}

	public String getTransResult(String query, String from, String to) {
		Map<String, String> params = buildParams(query, from, to);
		return HttpGet.get(TRANS_API_HOST, params);
	}

	private Map<String, String> buildParams(String query, String from, String to) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("q", query);
		params.put("from", from);
		params.put("to", to);

		params.put("appid", appid);

		// 随机数
		String salt = String.valueOf(System.currentTimeMillis());
		params.put("salt", salt);

		// 签名
		String src = appid + query + salt + securityKey; // 加密前的原文
		params.put("sign", MD5.md5(src));

		return params;
	}

	public static String getTransResultEn(String query) {

		TransApi api = new TransApi(APP_ID, SECURITY_KEY);

		String result = api.getTransResult(query, "auto", "en");

		JSONObject jsonObject = JSONObject.fromObject(result);

		try {
			String resultStr =JSONObject.fromObject(jsonObject.getJSONArray("trans_result").get(0)).get("dst")
			+ "";
			if(resultStr.equals("Yin")){
				resultStr="Cloudy";
			}else if(resultStr.equals("yin")){
				resultStr="Cloudy";
			}
			return resultStr;
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}

	}

}
