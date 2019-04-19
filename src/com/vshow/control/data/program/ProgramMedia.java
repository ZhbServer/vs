package com.vshow.control.data.program;

/**
 * 
 * @author w
 * 视频、音频、图片播放列表
 *
 */
public class ProgramMedia extends TouchBasis {
	
	public static final String FILTER_VIDEO = "mp4,avi,rmvb,mpg,flv,wmv";
    public static final String FILTER_IMAGE = "png,jpg,jpeg";
    public static final String FILTER_AUDIO = "mp3";

    public static final int TYPE_VIDEO = 0x1;
    public static final int TYPE_IMAGE = 0x2;
    public static final int TYPE_AUDIO = 0x3;
    
    public ProgramMedia(String path, int type) {
        this.path = path;
        this.type = type;
    }

    public ProgramMedia() {
    }
    
    
    //播放路径
    private String path;
    
    //文件夹名称
    private String filesName;
    
    


	//显示名称
    private String sname;
 
	//播放类型 (0视频 1图片 2音频  3流媒体 4AV数据源 5实时显示  )
    private int type;
    
    //图片显示时长
    private int timeoutMillis;
    
    //切换特效
    private int inAnim;
    private int outAnim;

    //流媒体地址
    private String surl;
    
    //声音大小(0-100) 只针对于视频,音频,流媒体,AV数据源,实时显示(摄像头)
    private float mVol = 0;
    
    
    private String relationKey;  //柜员插件图片显示绑定的编号
    
    
   
    
    
    public String getRelationKey() {
		return relationKey;
	}

	public void setRelationKey(String relationKey) {
		this.relationKey = relationKey;
	}

	public String getFilesName() {
		return filesName;
	}

	public void setFilesName(String filesName) {
		this.filesName = filesName;
	}
	
    
    public float getmVol() {
		return mVol;
	}

	public void setmVol(float mVol) {
		this.mVol = mVol;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
	
	
	public String getSurl() {
		return surl;
	}

	public void setSurl(String surl) {
		this.surl = surl;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getTimeoutMillis() {
		return timeoutMillis;
	}

	public void setTimeoutMillis(int timeoutMillis) {
		this.timeoutMillis = timeoutMillis;
	}

	public int getInAnim() {
		return inAnim;
	}

	public void setInAnim(int inAnim) {
		this.inAnim = inAnim;
	}

	public int getOutAnim() {
		return outAnim;
	}

	public void setOutAnim(int outAnim) {
		this.outAnim = outAnim;
	}


	 
    
}
