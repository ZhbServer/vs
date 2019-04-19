import com.vshow.control.tool.Constant;



public class Mts extends java.util.TimerTask {

	public void run() {
		
		if (NT141JNI.ta2()) {
			Constant.MTFLAG=false;
		}
	}

}
