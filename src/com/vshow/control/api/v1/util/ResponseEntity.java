package com.vshow.control.api.v1.util;

import java.util.HashMap;
import java.util.Map;


/**
 * api接口返回值
 * @author w
 * 2018-11-05
 *
 */
public class ResponseEntity {
	
	public static final String ERRORS_KEY = "errors";
	private final String message;
    private final String code;
    private final Map<String, Object> data = new HashMap<String, Object>();
 
   
    /**
     * 登陆成功or发布成功
     * @return ResponseEntity
     */
    public static ResponseEntity err0000() {
        return new ResponseEntity("0000", "success");
    }
    
    
    /**
     * 账户or密码错误or token 认证错误
     * @return ResponseEntity
     */
    public static ResponseEntity err0001() {
        return new ResponseEntity("0001", "账户或者密码错误");
    }
    
    
    /**
     * 用户被禁用
     * @return ResponseEntity
     */
    public static ResponseEntity err0002() {
        return new ResponseEntity("0002", "用户被禁用");
    }
    
    
    /**
     * 未知错误
     * @return ResponseEntity
     */
    public static ResponseEntity err0003() {
        return new ResponseEntity("0003", "未知错误");
    }
    
    
    /**
     * 参数不能为空或者不合法
     * @return ResponseEntity
     */
    public static ResponseEntity err0004() {
        return new ResponseEntity("0004", "参数不能为空或者不合法");
    }
    
    
    /**
     * 条件对应的节目不存在
     * @return ResponseEntity
     */
    public static ResponseEntity err0005() {
        return new ResponseEntity("0005", "条件对应的节目不存在");
    }
    
    
    
    /**
     * 部分终端不存在或未录入
     * @return ResponseEntity
     */
    public static ResponseEntity err0006() {
        return new ResponseEntity("0006", "部分终端不存在或未录入");
    }
    
    
    
    /**
     * 账户or密码错误or token 认证错误
     * @return ResponseEntity
     */
    public static ResponseEntity err0007() {
        return new ResponseEntity("0007", "token认证失败");
    }
    
    
    /**
     * 用户信息获取失败
     * @return ResponseEntity
     */
    public static ResponseEntity err0008() {
        return new ResponseEntity("0008", "用户信息获取失败");
    }
    
    /**
     * 条件查询终端不存在
     * @return ResponseEntity
     */
    public static ResponseEntity err0009() {
        return new ResponseEntity("0009", "条件查询终端不存在");
    }
    
    /**
     * 终端不在线
     * @return ResponseEntity
     */
    public static ResponseEntity err0010() {
        return new ResponseEntity("0010", "终端不在线");
    }
    
    
    /**
     * 终端未录入
     * @return ResponseEntity
     */
    public static ResponseEntity err0011() {
        return new ResponseEntity("0011", "终端未录入");
    }
    
    
    /**
     * 时间格式不正确
     * @return ResponseEntity
     */
    public static ResponseEntity err0012() {
        return new ResponseEntity("0012", "时间格式不正确");
    }
    
    /**
     * 条件查询节目不存在
     * @return ResponseEntity
     */
    public static ResponseEntity err0013() {
        return new ResponseEntity("0013", "条件查询节目不存在");
    }
    
    
    /**
     * 条件查询节目不存在
     * @return ResponseEntity
     */
    public static ResponseEntity err0014() {
        return new ResponseEntity("0014", "截屏失败,请重新截屏");
    }
   
    public static ResponseEntity err0015()
    {
    	return new ResponseEntity("0015", "指定时间内该终端无统计数据");
    }
    
    public String getMessage() {
        return message;
    }
 
    public String getCode() {
        return code;
    }
 
    public Map<String, Object> getData() {
        return data;
    }
 
    public ResponseEntity putDataValue(String key, Object value) {

        data.put(key, value);
        return this;
    }
 
    private ResponseEntity(String code, String message) {
        this.code = code;
        this.message = message;
    }
 
   


}
