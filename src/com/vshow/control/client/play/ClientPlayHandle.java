package com.vshow.control.client.play;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.vshow.control.data.ClientPlay;
import com.vshow.control.tool.SqlConnect;

/**
 * @author w
 * 终端播放记录工具类
 */
public class ClientPlayHandle {

	/**
	 * 插入最后一次播放计划
	 * @param itemids  节目id多个以','分割
	 * @param itemtype 节目类型 1普通节目 2互动节目
	 * @param sendtype 发布类型
	 * @param content  发布内容
	 * @param uid      发布用户
	 * @param mark     终端标识
	 * @param sendkey  发布标识 
	 * @param state    状态 0未接受 1已接收 2操作成功
	 * @throws SQLException 
	 */
	
	public static void insertClientPlay(String itemids,int itemtype,int sendtype,String content,int uid,String mark,String sendkey,int state) throws SQLException{
		
		ClientPlay cp= new ClientPlay();
		cp.setItemids(itemids);
		cp.setItemtype(itemtype);
		cp.setSendtype(sendtype);
		cp.setContent(content);
		cp.setUid(uid);
		cp.setMark(mark);
		cp.setSendkey(sendkey);
		cp.setState(state);
		
		//查询当前记录是否存在,存在则删除  条件(sendtype 发布类型  ,mark 终端标识)
		SqlConnect.getSqlMapInstance().delete("del_cp_by_stypeAndMark", cp);
		//新增记录
		SqlConnect.getSqlMapInstance().insert("add_cp", cp);
		
	}
	
	/**
	 * 清理最后一次播放计划
	 * @param sendtype 发布类型
	 * @param mark     终端标识
	 * @throws SQLException 
	 * 
	 */
	public static void clearClientPlay(int sendtype,String mark) throws SQLException{
		
		ClientPlay cp=new ClientPlay();
		cp.setMark(mark);
		cp.setSendtype(sendtype);
		SqlConnect.getSqlMapInstance().delete("del_cp_by_stypeAndMark",cp);
		
	}
	
	/**
	 * 清理当前mark的全部播放记录
	 * @param mark 终端标识
	 */
	
	public static void clearClientPlayAll(String mark) throws SQLException{
		
		SqlConnect.getSqlMapInstance().delete("del_cp_by_mark",mark.trim());
		
	}
	
}
