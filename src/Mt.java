import com.vshow.control.tool.Constant;



public class Mt extends java.util.TimerTask {

	public void run() {
		
		if (NT141JNI.ta()) {
		
			Constant.MTFLAG=false;
			
		}
	}

}
