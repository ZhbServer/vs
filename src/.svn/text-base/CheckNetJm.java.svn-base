import com.vshow.control.tool.Constant;
import com.vshow.control.tool.MainDo;
import java.util.Timer;


public class CheckNetJm extends java.util.TimerTask {

	private Timer timer;

    public CheckNetJm(Timer timer) {
        this.timer = timer;
    }
    
	public void run() {
		
		
		if(Constant.CHECKNETJMSTATE){
			this.timer.cancel();
		}else{
			MainDo ct = new MainDo();
			ct.init(0);
		}
		
		
	}
	
	
	public static void main(String[] args) {
		String umacs=",11,22,44";
		String umacArray [] = umacs.trim().split(",");  //数据库用户mark
		String newMac = umacs.trim();
		String cmarks=",11";
		String macArray [] = cmarks.trim().split(","); //传入的mark
		String delMac="";
		int count=0;
		for (int i = 0; i < umacArray.length; i++) {
			if(cmarks.indexOf(umacArray[i]) != -1){
				if(umacArray[i].length()!=0){
					delMac += umacArray[i]+",";
					count++; //删除的点位
				}
				
				if(newMac.indexOf(umacArray[i]+",") != -1){
					newMac = newMac.replace(umacArray[i]+",", "");
				}else if(newMac.indexOf(umacArray[i]) != -1){
					newMac = newMac.replace(umacArray[i], "");
				}
				
			}
		}

		System.out.println("newMac: "+newMac);
		System.out.println("count: "+count);
		System.out.println("delMac: "+delMac);
	}

}
