package com.vshow.control.tool.translate;

import net.sf.json.JSONObject;

public class Main {

	  // 在平台申请的APP_ID 详见 http://api.fanyi.baidu.com/api/trans/product/desktop?req=developer
    private static final String APP_ID = "20181225000252081";
    private static final String SECURITY_KEY = "R76y0bagQHBchBOEzbxJ";

    public static void main(String[] args) {
        TransApi api = new TransApi(APP_ID, SECURITY_KEY);

        String query = "多云";
        System.out.println(api.getTransResult(query, "auto", "en"));
        
        String result=api.getTransResult(query, "auto", "en");
        
        JSONObject jsonObject = JSONObject.fromObject(result);
        
        
        System.out.println(JSONObject.fromObject(jsonObject.getJSONArray("trans_result").get(0)).get("dst"));
    }

}
