package com.vshow.control.item.jh;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.data.Result;
import com.vshow.control.tool.GsonUtil;
import com.vshow.control.tool.SqlConnect;

public class AjaxFbLbJhAction extends ActionSupport {

	private String clientids; // 终端id多个以"_"分割

	@Override
	public String execute() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		SqlMapClient sm = SqlConnect.getSqlMapInstance();
		int count = 0;

		if (clientids != null && !"".equals(clientids)) {
			/** 获取选中的所有终端 **/
			String[] tids_s = clientids.split("\\_");
			for (int i = 0; i < tids_s.length; i++) {
				Integer r = (Integer) sm.queryForObject("sel_result_clid_type16",
						Integer.parseInt(tids_s[i]));
				if (r > 0) {
					count++;
				}
			}
		}

		JSONArray jsons = JSONArray.fromObject(count);
		map.put("count", jsons.toString());

		return GsonUtil.getGson(map);
	}

	public String getClientids() {
		return clientids;
	}

	public void setClientids(String clientids) {
		this.clientids = clientids;
	}

}
