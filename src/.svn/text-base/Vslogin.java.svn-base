import java.io.File;

import com.opensymphony.xwork.ActionSupport;
import com.vshow.control.tool.Constant;

public class Vslogin extends ActionSupport {
	
	
	private String olddian;
	
	private String newdian;
	
	private String shouquan;

	@Override
	public String execute() throws Exception {
		    String cmdd="";
			if(NT141JNI.goupan==0)
			{
				cmdd = "cmd /c " + Constant.EXE + File.separator
				+ "ppg.exe " + olddian.trim() + " " + newdian.trim() + " "
				+ shouquan.trim();
			}
			else if(NT141JNI.goupan==1)
			{
				cmdd = "cmd /c " + Constant.EXE + File.separator
				+ "ppg2.exe " + olddian.trim() + " " + newdian.trim() + " "
				+ shouquan.trim();
			}
			Runtime.getRuntime().exec(cmdd);
		return SUCCESS;
	}



	public void setOlddian(String olddian) {
		this.olddian = olddian;
	}



	public void setNewdian(String newdian) {
		this.newdian = newdian;
	}



	public void setShouquan(String shouquan) {
		this.shouquan = shouquan;
	}
}
