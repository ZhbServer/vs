import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.Timer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;


import com.vshow.control.data.SystemInfo;
import com.vshow.control.tool.FileHandle;
import com.vshow.control.tool.GetLocal;
import com.vshow.control.tool.Local;
import com.vshow.control.tool.MainDo;
import com.vshow.control.tool.SetParameterPrint;
import com.vshow.control.tool.SqlConnect;
import com.vshow.control.tool.Constant;
import com.vshow.control.tool.VCommon;
import com.vshow.control.tool.VVersion;

public class NT141JNI extends HttpServlet {

	public static int goupan = 0;
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// ========================以下为引用语JNI动态库==============================
	static {
		System.load("D:\\vs\\server\\webapps\\vs\\exe\\NT141JNI.dll");// 载入dll
	}
	// ========================以下为宏定义=======================================
	public static final int OP_OK = 0; // 操作成功状态字
	public static final int MODE_ERR = 1; // 权限不够
	public static final int EEPROM_ERR = 2; // EEPROM写失败
	public static final int PIN_ERR = 3; // 校验PIN密码失败
	public static final int CHK_ZERO = 4; // 没有校验次数(已烧死)
	public static final int PARA_ERR = 5; // 参数错误
	public static final int CMD_ERR = 6; // 操作失败状态字

	public static final int SEND_ERR = -1; // 为发送数据失败
	public static final int REC_ERR = -2; // 为接收数据失败
	public static final int EN_ERR = -3; // 为加密失败
	public static final int DE_ERR = -4; // 为解密失败
	public static final int READ_ERR = -5; // 读数据出错
	public static final int OPEN_ERR = -6; // 设备已打开
	public static final int OPENNOT_ERR = -7; // 设备未打开
	public static final int PASS_ERR = -8; // 密码不正确

	public static final int TIME_ERR = 7; // 时间错误(超出可使用时间范围)
	public static final int END_TIME_NOINIT = 8; // 结束时间没有设置
	public static final int END_TIME_SETOK = 9; // 起始和结束时间设置完成
	public static final int TIMES_ZERO = 10; // 可用次数为0
	public static final int TDEVICE_NOINIT = 11; // 未进行INIT命令 public static
													// final int AUTOINVALID=-9;
													// //授权失效，时间锁
	public static final int AUTOINVALID = -9; // 授权失效，时间锁
	public static final int AUTOERR = -10; // 授权码校验不正确
	public static final int AUTODATEERR = -11; // 授权日期不正确

	// ========================以下为DLL函数定义==========================================
	/*
	 * ********************************************************************
	 * 函数: 查找指定产品设备 参数: pPidData 16字节产品标识 返回: 查找到设备个数 权限: 匿名 说明:
	 * 打开设备前用来查询，是否是有多个设备
	 * ********************************************************************
	 */
	public native static short NT141FindDev(byte pPidData[]);// 查找设备

	/*
	 * ********************************************************************
	 * 函数: 打开设备 参数: pPidData 16字节产品标识字符串 Index 相应的设备索引 返回: >0正确, 权限: 匿名 说明:
	 * 取得相应的操作句柄
	 * ********************************************************************
	 */
	public native static int NT141OpenDev(byte pPidData[], short Index);// 打开设备

	/*
	 * ********************************************************************
	 * 函数: 写数据 参数: handle 操作设备句柄,StartAdd 开始地址 pWriteBuff 要写的数据,nBuffLen 数据长度
	 * 返回: 0为正确，其它请参考返回值说明 权限: 校验密码正确后 说明: 校验密码正确后进行操作。
	 * ********************************************************************
	 */
	public native static short NT141DevWrite(int handle, short StartAdd,
			byte pWriteBuff[], short nBuffLen); // 写设备

	/*
	 * ********************************************************************
	 * 函数: 读数据 参数: handle 操作设备句柄,StartAdd 开始地址 pReadBuff 要读的数据指针,nBuffLen 数据长度
	 * 返回: 0为正确，其它请参考返回值说明 权限: 校验密码正确后 说明: 校验密码正确后
	 * ********************************************************************
	 */
	public native static short NT141DevRead(int handle, short StartAdd,
			byte pReadBuff[], short nBuffLen); // 读设备

	/*
	 * ********************************************************************
	 * 函数: 打开指示灯 参数: handle 操作设备句柄 返回: 0为正确，其它请参考返回值说明 权限: 匿名 说明:
	 * ********************************************************************
	 */
	public native static short NT141LedOpen(int handle); // LED亮

	/*
	 * ********************************************************************
	 * 函数: 关闭指示灯 参数: handle 操作设备句柄 返回: 0为正确，其它请参考返回值说明 权限: 匿名 说明:
	 * ********************************************************************
	 */
	public native static short NT141LedClose(int handle); // LED灭

	/*
	 * ********************************************************************
	 * 函数: 获取设备编号全球唯一 参数: handle 操作设备句柄,pDidData 12字节取设备编号 返回: 0为正确，其它请参考返回值说明
	 * 权限: 匿名 说明: 任何时候都可以获取
	 * ********************************************************************
	 */
	public native static short NT141GetDID(int handle, byte pDidData[]); // 取DID值

	/*
	 * ********************************************************************
	 * 函数: 验证用户密码 参数: handle 操作设备句柄,UserPassword 16字节密码 返回: 验证次数>0为正确, 权限: 匿名
	 * 说明: 验证后可以进行任何操作
	 * ********************************************************************
	 */
	public native static short NT141VerifyUserPassword(int handle,
			byte pUserPassword[], short nLen); // 验证用户密码

	/*
	 * ********************************************************************
	 * 函数: 设置用户密码 参数: handle 操作设备句柄,UserPassword 16字节密码 返回: 0为正确，其它请参考返回值说明 权限:
	 * 用户 说明: 验证密码后可以进行任何操作
	 * ********************************************************************
	 */
	public native static short NT141SetUserPassword(int handle,
			byte pUserPassword[], short nLen); // 设置用户密码

	/*
	 * ********************************************************************
	 * 函数: 取产品标识ID 参数: handle 操作设备句柄,pPidData 返回的16字节ID 返回: 0为正确，其它请参考返回值说明 权限:
	 * 匿名 说明: 获取当前设备的产品标识
	 * ********************************************************************
	 */
	public native static short NT141GetPID(int handle, byte pPidData[]); // 取PID值

	/*
	 * ********************************************************************
	 * 函数: 设置产品标识ID 参数: handle 操作设备句柄,pProductPassword 1-56字节 nLen 密码长度，
	 * pPidData 返回的产品标识16字节 返回: 0为正确，其它请参考返回值说明 权限: 校验密码正确后 说明: 设置产品标识
	 * ********************************************************************
	 */
	public native static short NT141SetPID(int handle, byte pProductPassword[],
			short nBuffLen, byte pPidData[]); // 设置PID值

	/*
	 * ********************************************************************
	 * 函数: 关闭设备 参数: handle 操作设备句柄, 返回: 0为正确，其它请参考返回值说明 权限: 匿名 说明: 复位DEV
	 * ********************************************************************
	 */
	public native static short NT141CloseDev(int handle); // 关闭设备

	/*
	 * ********************************************************************
	 * 函数: 取密码校验次数 参数: handle 操作设备句柄 返回: 验证次数>0为正确 权限: 匿名 说明: 防止误操作以免死锁
	 * ********************************************************************
	 */
	public native static short NT141GetVerifyNum(int handle);

	/*
	 * ********************************************************************
	 * 函数: 检查是否已失效 参数: handle 操作设备句柄 pWorkMode 当前工作模式 pParameter 工作参数，当类型为0
	 * 2则返回可用的天数 当类型为1则返回可用的次数 当类型为3则返回可用的分钟 返回: 0为正确， 权限: 验证密码后 说明: 普通用户
	 * ********************************************************************
	 */
	public native static short NT141Check(int handle, byte WorkMode[]);

	/*
	 * ********************************************************************
	 * 函数: 初始化时间狗 参数: handle 操作设备句柄 返回: 0为正确， 权限: 超级用户 说明: 设置产品标识
	 * ********************************************************************
	 */
	public native static short NT141Init(int handle);

	/*
	 * ********************************************************************
	 * 函数: 取授权编码 参数: handle 操作设备句柄 AuthDM 授权编码 返回: 0为正确， 权限: 若名 说明:
	 * ********************************************************************
	 */
	public native static short NT141GetAuthDM(int handle, byte AuthDM[]);

	/*
	 * ********************************************************************
	 * 函数: 设置授权编码 参数: handle 操作设备句柄 AuthDM 授权编码 返回: 0为正确(3次系统就复位，必须重新苑取新授权编码)
	 * 权限: 若名 说明:
	 * ********************************************************************
	 */
	public native static short NT141SetAuthDM(int handle, byte AuthDM[]);

	// ========================以下为演示函数及执行代码==========================================
	public static short m_st; // 返回状态
	public static int m_handle = -1; // 设备句柄
	public static short m_vst = 0; // 密码校验状态0为未校验,1为超级密码,2为用户
	public static short m_Initst = 0; // 初始化状态 0为没有初始化 ,1为已初始化
	public static short m_DevNum = 0; // 找到的设备数
	public static String StrProductID = "";// 查找到的产品ID

	/*
	 * ********************************************************************
	 * 函数: 根据不同的返回值输入相应的信息 参数: st 返回值 返回: 无
	 * ********************************************************************
	 */
	public static void CheckErr(short st) {
		switch (st) {
		case OP_OK:
			break;
		case MODE_ERR:
			System.out.println("权限不够！");
			break;
		case EEPROM_ERR:
			System.out.println("写数据失败！");
			break;
		case PIN_ERR:
			System.out.println("校验PIN密码失败！");
			break;
		case CHK_ZERO:
			System.out.println("没有校验次数(已烧死) ！");
			break;
		case PARA_ERR:
			System.out.println("参数错误 ！");
			break;
		case CMD_ERR:
			System.out.println("操作失败状态字！");
			break;
		case SEND_ERR:
			System.out.println("为发送数据失败！");
			break;
		case REC_ERR:
			System.out.println("为接收数据失败！");
			break;
		case EN_ERR:
			System.out.println("为加密失败！");
			break;
		case DE_ERR:
			System.out.println("为解密失败！");
			break;
		case READ_ERR:
			System.out.println("读数据出错！");
			break;
		case PASS_ERR:
			System.out.println("密码错误！");
			break;

		case OPEN_ERR:
			System.out.println("对不起，设备已打开！");
			break;

		case OPENNOT_ERR:
			System.out.println("对不起，设备未打开！");
			break;

		case TIME_ERR:
			System.out.println("使用时间超出范围！");
			break;

		case END_TIME_NOINIT:
			System.out.println("没有结束时间！");
			break;

		case END_TIME_SETOK:
			System.out.println("超始和结束时间设置完成！");
			break;

		case TIMES_ZERO:
			System.out.println("可用次数为0！");
			break;

		case TDEVICE_NOINIT:
			System.out.println("设备没有初始化！");
			break;

		case AUTOINVALID:
			System.out.println("授权失效！");
			break;

		case AUTOERR:
			System.out.println("授权码校验不正确！");
			break;

		case AUTODATEERR:
			System.out.println("授权日期不正确！");
			break;
		default:
			System.out.println("对不起，未知错误码！");
		}
	}

	/*
	 * ********************************************************************
	 * 函数: 取指定长度的输入数据 参数: 无 返回: 相应的字符串
	 * ********************************************************************
	 */
	public static String readLine() {
		int ch;
		String r = "";
		boolean done = false;
		while (!done) {
			try {
				ch = System.in.read();

				if (ch < 0 || (char) ch == '\n')
					done = true;
				else if ((char) ch != '\r') // weird--it used to do \r\n
											// translation
					r = r + (char) ch;

			} catch (java.io.IOException e) {
				done = true;
			}
		}
		return r;
	}

	/*
	 * ********************************************************************
	 * 功能: 查找指定产品ID的设备个数 说明:通过 FindDev函数查找出相应的设备，并显示出来
	 * ********************************************************************
	 */
	public static void OnButFind() {
		byte[] PidData = new byte[16];
		int i;

		System.out.println("请输入16位产品编码:");
		StrProductID = readLine();

		if (StrProductID.length() != 16) {
			System.out.println("输入长度不正确，请重新操作!");
			return;
		}

		for (i = 0; i < 16; i++) {
			PidData[i] = (byte) StrProductID.charAt(i);
		}

		m_DevNum = NT141FindDev(PidData);
		if (m_DevNum == 0) {
			System.out.println("没有设备!");
			return;
		}

		System.out.println("设备个数为:" + m_DevNum);
	}

	/*
	 * ********************************************************************
	 * 功能: 打开指定索引的的设备 说明:指定相应的产品ID及相应的索引，如果成功则返回相应的句柄
	 * ********************************************************************
	 */
	public static void OnButOpen() {
		short Index;
		byte[] PidData = new byte[16];
		String StrIndex = "";
		int i;

		if (m_DevNum < 1) {
			System.out.println("没有设备，请重新进行查找操作!");
			return;
		}

		if (StrProductID.length() != 16) {
			System.out.println("产品编码长度不正确，请重新进行查找操作!");
			return;
		}

		System.out.println("产品编码[" + StrProductID + "] 索引范围是(0-"
				+ (m_DevNum - 1) + "),请输入要打开的设备索引:");
		StrIndex = readLine();
		if (StrIndex.length() > 3 || StrIndex.length() < 1) {
			System.out.println("输入索引值不正确!");
			return;
		}

		try {
			Index = (short) Integer.parseInt(StrIndex);

		} catch (Exception ex) {
			System.out.println("输入数据有误,请重新操作!");
			return;
		}

		for (i = 0; i < 16; i++) {
			PidData[i] = (byte) StrProductID.charAt(i);
		}

		m_handle = NT141OpenDev(PidData, Index);
		if (m_handle < 1) {
			System.out.println("打开设备失败!");
			return;
		}
		System.out.println("打开设备成功!");
	}

	/*
	 * ********************************************************************
	 * 功能: 把设备LED设为亮 说明:当LED为闪烁时设后则不再闪烁
	 * ********************************************************************
	 */
	public static void OnButLEDT() {
		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		m_st = NT141LedOpen(m_handle); // LED亮
		CheckErr(m_st);
	}

	/*
	 * ********************************************************************
	 * 功能:把设备LED设为灭 说明: LED为闪烁时设后则不再闪烁
	 * ********************************************************************
	 */
	public static void OnButLEDF() {
		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		m_st = NT141LedClose(m_handle); // LED灭
		CheckErr(m_st);
	}

	/*
	 * ********************************************************************
	 * 功能:获取设备编号 说明:无须校验密码直接获取
	 * ********************************************************************
	 */
	public static void OnButDevID() {
		byte[] DevData = new byte[12];
		int i;
		String StrDid = "";

		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		m_st = NT141GetDID(m_handle, DevData); // 取DID值
		CheckErr(m_st);
		if (m_st == OP_OK) {
			for (i = 0; i < 12; i++)
				StrDid = StrDid + (char) DevData[i];

			System.out.println("设备编号为:" + StrDid);
		}

	}

	/*
	 * ********************************************************************
	 * 功能:获取产品编号 说明:无须校验密码直接获取
	 * ********************************************************************
	 */
	public static void OnButProduct() {
		byte[] PidData = new byte[16];
		int i;
		String StrPid = "";

		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		m_st = NT141GetPID(m_handle, PidData);
		CheckErr(m_st);
		if (m_st == OP_OK) {
			for (i = 0; i < 16; i++)
				StrPid = StrPid + (char) PidData[i];

			System.out.println("产品编号为:" + StrPid);
		}
	}

	/*
	 * ********************************************************************
	 * 功能: 校验用户密码 说明: 校验正确后，反回相应的校验次数，
	 * ********************************************************************
	 */
	public static void OnButVerifyUserPassword() {
		short VerifyNum;
		short m_len;
		String m_EVerifyPass = "";
		String m_YN = "";
		byte[] Password = new byte[16];
		char CharCmd;

		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		if (m_Initst < 1) {
			System.out.println("请选择执行初始化操作!");
			return;
		}

		System.out.println("请输入1-16位字符串用户密码:");
		m_EVerifyPass = readLine();

		if (m_EVerifyPass.length() > 16 || m_EVerifyPass.length() < 1) {
			System.out.println("输入长度不正确，请重新操作!");
			return;
		}

		m_len = (short) m_EVerifyPass.length();
		for (int i = 0; i < m_len; i++) {
			Password[i] = (byte) m_EVerifyPass.charAt(i);
		}

		VerifyNum = NT141VerifyUserPassword(m_handle, Password, m_len);
		if (VerifyNum == 0) {
			System.out.println("对不起，校验失败!");
			return;
		}

		if (VerifyNum < 0) {
			CheckErr(VerifyNum);
			return;
		}

		m_vst = 1;
		System.out.println("校验用户密码成功!");
	}

	/*
	 * ********************************************************************
	 * 功能:修改用户密码 说明:普通用户只能设自己已的密码
	 * ********************************************************************
	 */
	public static void OnButModifyUserPassword() {
		short m_len;
		String StrNewPass = "";
		byte[] Password = new byte[16];

		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		if (m_vst < 1) {
			System.out.println("权限不足,请用超级用户操作!");
			return;
		}

		System.out.println("请输入1-16位字符串新用户密码:");
		StrNewPass = readLine();

		if (StrNewPass.length() > 16 || StrNewPass.length() < 1) {
			System.out.println("输入长度不正确，请重新操作!");
			return;
		}

		m_len = (short) StrNewPass.length();
		for (int i = 0; i < m_len; i++) {
			Password[i] = (byte) StrNewPass.charAt(i);
		}

		m_st = NT141SetUserPassword(m_handle, Password, m_len);
		CheckErr(m_st);
	}

	/*
	 * ********************************************************************
	 * 功能: 向设备写数据 说明:如果为超级用户则可以任意写数据，如果某块(64字节)设为只读权限， 普通用户则不能对该块进行写操作，只能读操作。
	 * ********************************************************************
	 */
	public static void OnButWrite() {
		short m_len = 0;
		short m_Add = 0;
		String StrData = "";
		String StrAdd = "";
		byte[] WriteData = new byte[256];

		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		if (m_vst < 1) {
			System.out.println("权限不足,先校验密码!");
			return;
		}

		System.out.println("请输入开始地址(0-256):");
		StrAdd = readLine();

		if (StrAdd.length() > 3 || StrAdd.length() < 1) {
			System.out.println("输入长度不正确，请重新操作!");
			return;
		}

		try {
			m_Add = (short) Integer.parseInt(StrAdd);

		} catch (Exception ex) {
			System.out.println("输入数据有误,请重新操作!");
			return;
		}

		System.out.println("请输入要写入的数据:");
		StrData = readLine();

		if (StrData.length() > 256 || StrData.length() < 1) {
			System.out.println("输入长度不正确，请重新操作!");
			return;
		}

		m_len = (short) StrData.length();
		for (int i = 0; i < m_len; i++) {
			WriteData[i] = (byte) StrData.charAt(i);
		}

		if ((m_Add + m_len) > 256)
			m_len = (short) (256 - m_Add);

		m_st = NT141DevWrite(m_handle, m_Add, WriteData, m_len);
		CheckErr(m_st);
	}

	/*
	 * ********************************************************************
	 * 功能: 从设备中读取相应的数据 说明:验证密码后就可以读写
	 * ********************************************************************
	 */
	public static void OnButRead() {
		short m_len = 0;
		short m_Add = 0;
		String StrData = "";
		String StrAdd = "";
		String StrLen = "";
		byte[] ReadBuff = new byte[257];

		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		if (m_vst < 1) {
			System.out.println("权限不足,先校验密码!");
			return;
		}

		System.out.println("请输入读数据开始地址(0-256):");
		StrAdd = readLine();

		if (StrAdd.length() > 3 || StrAdd.length() < 1) {
			System.out.println("输入长度不正确，请重新操作!");
			return;
		}

		System.out.println("请输入读数据长度(1-256):");
		StrLen = readLine();

		if (StrLen.length() > 3 || StrLen.length() < 1) {
			System.out.println("输入长度不正确，请重新操作!");
			return;
		}

		try {
			m_Add = (short) Integer.parseInt(StrAdd);
			m_len = (short) Integer.parseInt(StrLen);

		} catch (Exception ex) {
			System.out.println("输入数据有误,请重新操作!");
			return;
		}

		if ((m_Add + m_len) > 256)
			m_len = (short) (256 - m_Add);

		m_st = NT141DevRead(m_handle, m_Add, ReadBuff, m_len);
		CheckErr(m_st);
		if (m_st == OP_OK) {
			for (int i = 0; i < m_len; i++)
				StrData = StrData + (char) ReadBuff[i];

			System.out.println("读到的数据为:" + StrData);
		}
	}

	/*
	 * ********************************************************************
	 * 功能:初始化设备
	 * 
	 * 说明: 打开后就要执行这个函数
	 * 
	 * ********************************************************************
	 */
	public static void OnButInit() {
		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		m_st = NT141Init(m_handle);
		if (m_st != OP_OK) {
			m_Initst = 0;
			CheckErr(m_st);
			return;
		}

		m_Initst = 1;
		System.out.println("初始化加密狗成功!");
	}

	/*
	 * ********************************************************************
	 * 功能:检测加密狗是否失郊
	 * 
	 * 说明: 打开后就要执行这个函数
	 * 
	 * ********************************************************************
	 */
	public static void OnButCheck() {
		byte[] pWord = new byte[1];
		String Str = "";

		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		if (m_vst < 1) {
			System.out.println("权限不足,先校验密码!");
			return;
		}

		m_st = NT141Check(m_handle, pWord);
		if (m_st < OP_OK) {
			CheckErr(m_st);
			return;
		}

		Str = "工作模式为:";

		switch (pWord[0]) {
		case 0:
			Str += "时间段模式;";
			break;
		case 1:
			Str += "次数模式;";
			break;
		case 2:
			Str += "天数模式;";
			break;
		case 3:
			Str += "周期模式;";
			break;
		case 4:
			Str += "超级模式;";
			break;
		}

		Str += "返回参数为:" + m_st;
		System.out.println(Str);
	}

	/*
	 * ********************************************************************
	 * 功能:获取授权
	 * 
	 * 说明:用于系统重新授权
	 * 
	 * ********************************************************************
	 */
	public static void OnButGetBH() {
		byte[] AuthBH = new byte[16];
		String Str = "";

		if (m_handle < 1) {
			System.out.println("没有打开设备,请先打开设备!");
			return;
		}

		m_st = NT141GetAuthDM(m_handle, AuthBH);
		CheckErr(m_st);
		if (m_st == OP_OK) {
			for (int i = 0; i < 16; i++)
				Str = Str + (char) AuthBH[i];

			System.out.println("授权号为:" + Str);
		}
	}

	/*
	 * ********************************************************************
	 * 功能:重新给加密狗授权
	 * 
	 * 说明:用于系统重新授权
	 * 
	 * ********************************************************************
	 */
	public static void OnButSetBm() {
		byte[] AuthBH = new byte[16];
		String StrAuthBH = "";
 
		if (m_handle < 1) {
			System.out.println("加密锁没有没有打开,请先打开加密锁!");
			return;
		}

		System.out.println("请输入16位授权编码:");
		StrAuthBH = readLine();

		if (StrAuthBH.length() != 16) {
			System.out.println("输入长度不正确，请重新操作!");
			return;
		}

		for (int i = 0; i < 16; i++) {
			AuthBH[i] = (byte) StrAuthBH.charAt(i);
		}

		m_st = NT141SetAuthDM(m_handle, AuthBH);
		if (m_st == OP_OK) {
			System.out.println("授权码设置成功,请重新打开加密锁!");
			m_handle = 0;
			return;
		}
		CheckErr(m_st);
	}

	public static boolean ta() {
		int total = 0;
		try {                    
			total = NT141FindDev("26C0964BFD68EE59".getBytes());
			if (total > 0) {
				total = NT141OpenDev("26C0964BFD68EE59".getBytes(), (short) 0);
				if (total > 0 || total == -6) {
					NT141LedClose(1);
					int cur = NT141Init(1);
					if (cur == 0) {
						if (NT141VerifyUserPassword(1,
								"1984061019840619".getBytes(), (short) 16) > 0) {

							try {
								byte[] IDD = new byte[12];
								NT141GetDID(1, IDD);
								int a1 = Integer.parseInt("" + (char) IDD[0],
										16);
								int a2 = Integer.parseInt("" + (char) IDD[1],
										16);
								int a3 = Integer.parseInt("" + (char) IDD[2],
										16);
								int a4 = Integer.parseInt("" + (char) IDD[3],
										16);
								int a5 = Integer.parseInt("" + (char) IDD[4],
										16);
								int a6 = Integer.parseInt("" + (char) IDD[5],
										16);
								int a7 = Integer.parseInt("" + (char) IDD[6],
										16);
								int a8 = Integer.parseInt("" + (char) IDD[7],
										16);
								int a9 = Integer.parseInt("" + (char) IDD[8],
										16);
								int a10 = Integer.parseInt("" + (char) IDD[9],
										16);
								int a11 = Integer.parseInt("" + (char) IDD[10],
										16);
								int a12 = Integer.parseInt("" + (char) IDD[11],
										16);

								String StrData = "";
								byte[] ReadBuff = new byte[25];
								m_st = NT141DevRead(1, (short) 0, ReadBuff,
										(short) 25);
								CheckErr(m_st);
								if (m_st == OP_OK) {
									for (int i = 0; i < 25; i++) {
										StrData = StrData + (char) ReadBuff[i];
									}
								}

								String sd = StrData.trim();
								int c = Integer.parseInt(sd.substring(0, 5));

								String txtstr = ""
										+ ((a1 + c + 2 + a7)
												+ (a2 + 3 + c + a5) + (a3 + 5
												+ c + a4))
										+ ((a4 + 7 + c + a2)
												+ (a5 + 9 + c + a10) + (a6 + 8
												+ c + a11))
										+ ((a7 + 5 + c + a1)
												+ (a8 + 9 + c + a9) + (a9 + 3
												+ c + a7))
										+ ((a10 + 2 + c + a3)
												+ (a11 + 5 + c + a6) + (a12 + 2
												+ c + a8));

								while (true) {
									if (txtstr.length() == 20) {
										break;
									}
									txtstr = txtstr + "0";
								}
								if (txtstr.equals(sd.substring(5, 25))) {
									Constant.G4 = c;
								} else {
									Constant.G4 = 2;
								}
							} catch (Exception e) {

							}

							byte[] pWord = new byte[1];
							total = NT141Check(1, pWord);
							if (pWord[0] == 2) {
								if (total > 0) {
									NT141LedOpen(1);
									NT141CloseDev(1);
									return false;
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			return true;
		}
		return true;
	}

	public static boolean ta2() {
		int total = 0;
		try {                      
			total = NT141FindDev("36C69F5ECE64EE57".getBytes());
			if (total > 0) {
				total = NT141OpenDev("36C69F5ECE64EE57".getBytes(), (short) 0);
				if (total > 0 || total == -6) {
					NT141LedClose(1);
					int cur = NT141Init(1);
					if (cur == 0) {
						if (NT141VerifyUserPassword(1,
								"1984061019840618".getBytes(), (short) 16) > 0) {

							try {
								byte[] IDD = new byte[12];
								NT141GetDID(1, IDD);
								int a1 = Integer.parseInt("" + (char) IDD[0],
										16);
								int a2 = Integer.parseInt("" + (char) IDD[1],
										16);
								int a3 = Integer.parseInt("" + (char) IDD[2],
										16);
								int a4 = Integer.parseInt("" + (char) IDD[3],
										16);
								int a5 = Integer.parseInt("" + (char) IDD[4],
										16);
								int a6 = Integer.parseInt("" + (char) IDD[5],
										16);
								int a7 = Integer.parseInt("" + (char) IDD[6],
										16);
								int a8 = Integer.parseInt("" + (char) IDD[7],
										16);
								int a9 = Integer.parseInt("" + (char) IDD[8],
										16);
								int a10 = Integer.parseInt("" + (char) IDD[9],
										16);
								int a11 = Integer.parseInt("" + (char) IDD[10],
										16);
								int a12 = Integer.parseInt("" + (char) IDD[11],
										16);

								String StrData = "";
								byte[] ReadBuff = new byte[25];
								m_st = NT141DevRead(1, (short) 0, ReadBuff,
										(short) 25);
								CheckErr(m_st);
								if (m_st == OP_OK) {
									for (int i = 0; i < 25; i++) {
										StrData = StrData + (char) ReadBuff[i];
									}
								}

								String sd = StrData.trim();
								int c = Integer.parseInt(sd.substring(0, 5));

								String txtstr = ""
										+ ((a1 + c + 2 + a7)
												+ (a2 + 3 + c + a5) + (a3 + 5
												+ c + a4))
										+ ((a4 + 7 + c + a2)
												+ (a5 + 9 + c + a10) + (a6 + 8
												+ c + a11))
										+ ((a7 + 5 + c + a1)
												+ (a8 + 9 + c + a9) + (a9 + 3
												+ c + a7))
										+ ((a10 + 2 + c + a3)
												+ (a11 + 5 + c + a6) + (a12 + 2
												+ c + a8));

								while (true) {
									if (txtstr.length() == 20) {
										break;
									}
									txtstr = txtstr + "0";
								}
								if (txtstr.equals(sd.substring(5, 25))) {
									Constant.G4 = c;
								} else {
									//Constant.G4 = 2;
									Constant.G4 = 0;
								}
							} catch (Exception e) {

							}
							NT141LedOpen(1);
							NT141CloseDev(1);
							return false;
						}
					}
				}
			}
		} catch (Exception e) {
			return true;
		}
		return true;
	}

	
	public int gett() {
		int total = 0;
		try {                     
			total = NT141FindDev("36C69F5ECE64EE57".getBytes());
			if (total > 0) {           
				total = NT141OpenDev("36C69F5ECE64EE57".getBytes(), (short) 0);
				if (total > 0) {
					NT141LedClose(1);
					int cur = NT141Init(1);
					if (cur == 0) {
						if (NT141VerifyUserPassword(1,
								"1984061019840618".getBytes(), (short) 16) > 0) {
							try {
								byte[] IDD = new byte[12];
								NT141GetDID(1, IDD);
								int a1 = Integer.parseInt("" + (char) IDD[0],
										16);
								int a2 = Integer.parseInt("" + (char) IDD[1],
										16);
								int a3 = Integer.parseInt("" + (char) IDD[2],
										16);
								int a4 = Integer.parseInt("" + (char) IDD[3],
										16);
								int a5 = Integer.parseInt("" + (char) IDD[4],
										16);
								int a6 = Integer.parseInt("" + (char) IDD[5],
										16);
								int a7 = Integer.parseInt("" + (char) IDD[6],
										16);
								int a8 = Integer.parseInt("" + (char) IDD[7],
										16);
								int a9 = Integer.parseInt("" + (char) IDD[8],
										16);
								int a10 = Integer.parseInt("" + (char) IDD[9],
										16);
								int a11 = Integer.parseInt("" + (char) IDD[10],
										16);
								int a12 = Integer.parseInt("" + (char) IDD[11],
										16);

								String StrData = "";
								byte[] ReadBuff = new byte[25];
								m_st = NT141DevRead(1, (short) 0, ReadBuff,
										(short) 25);
								CheckErr(m_st);
								if (m_st == OP_OK) {
									for (int i = 0; i < 25; i++) {
										StrData = StrData + (char) ReadBuff[i];
									}
								}

								String sd = StrData.trim();
								int c = Integer.parseInt(sd.substring(0, 5));

								String txtstr = ""
										+ ((a1 + c + 2 + a7)
												+ (a2 + 3 + c + a5) + (a3 + 5
												+ c + a4))
										+ ((a4 + 7 + c + a2)
												+ (a5 + 9 + c + a10) + (a6 + 8
												+ c + a11))
										+ ((a7 + 5 + c + a1)
												+ (a8 + 9 + c + a9) + (a9 + 3
												+ c + a7))
										+ ((a10 + 2 + c + a3)
												+ (a11 + 5 + c + a6) + (a12 + 2
												+ c + a8));

								while (true) {
									if (txtstr.length() == 20) {
										break;
									}
									txtstr = txtstr + "0";
								}
								if (txtstr.equals(sd.substring(5, 25))) {
									Constant.G4 = c;
								} else {
									Constant.G4 = 0;
								}
							} catch (Exception e) {

							}
							NT141LedOpen(1);
							NT141CloseDev(1);
							Constant.PAN = 2;
							goupan = 0;
							return Constant.IPP;
						}
					}
				}
			} else {
				total = NT141FindDev("26C0964BFD68EE59".getBytes());
				if (total > 0) {
					total = NT141OpenDev("26C0964BFD68EE59".getBytes(),
							(short) 0);
					if (total > 0) {
						NT141LedClose(1);
						int cur = NT141Init(1);
						if (cur == 0) {
							if (NT141VerifyUserPassword(1,
									"1984061019840619".getBytes(), (short) 16) > 0) {
								try {
									byte[] IDD = new byte[12];
									NT141GetDID(1, IDD);
									int a1 = Integer.parseInt("" + (char) IDD[0],
											16);
									int a2 = Integer.parseInt("" + (char) IDD[1],
											16);
									int a3 = Integer.parseInt("" + (char) IDD[2],
											16);
									int a4 = Integer.parseInt("" + (char) IDD[3],
											16);
									int a5 = Integer.parseInt("" + (char) IDD[4],
											16);
									int a6 = Integer.parseInt("" + (char) IDD[5],
											16);
									int a7 = Integer.parseInt("" + (char) IDD[6],
											16);
									int a8 = Integer.parseInt("" + (char) IDD[7],
											16);
									int a9 = Integer.parseInt("" + (char) IDD[8],
											16);
									int a10 = Integer.parseInt("" + (char) IDD[9],
											16);
									int a11 = Integer.parseInt("" + (char) IDD[10],
											16);
									int a12 = Integer.parseInt("" + (char) IDD[11],
											16);

									String StrData = "";
									byte[] ReadBuff = new byte[25];
									m_st = NT141DevRead(1, (short) 0, ReadBuff,
											(short) 25);
									CheckErr(m_st);
									if (m_st == OP_OK) {
										for (int i = 0; i < 25; i++) {
											StrData = StrData + (char) ReadBuff[i];
										}
									}

									String sd = StrData.trim();
									int c = Integer.parseInt(sd.substring(0, 5));

									String txtstr = ""
											+ ((a1 + c + 2 + a7)
													+ (a2 + 3 + c + a5) + (a3 + 5
													+ c + a4))
											+ ((a4 + 7 + c + a2)
													+ (a5 + 9 + c + a10) + (a6 + 8
													+ c + a11))
											+ ((a7 + 5 + c + a1)
													+ (a8 + 9 + c + a9) + (a9 + 3
													+ c + a7))
											+ ((a10 + 2 + c + a3)
													+ (a11 + 5 + c + a6) + (a12 + 2
													+ c + a8));

									while (true) {
										if (txtstr.length() == 20) {
											break;
										}
										txtstr = txtstr + "0";
									}
									if (txtstr.equals(sd.substring(5, 25))) {
										Constant.G4 = c;
									} else {
										Constant.G4 = 0;
									}
								} catch (Exception e) {

								}

								byte[] pWord = new byte[1];
								total = NT141Check(1, pWord);
								if (pWord[0] == 2) {
									if (total > 0) {
										NT141LedOpen(1);
										NT141CloseDev(1);
										Constant.PAN = 1;
										goupan = 1;
										return Constant.IPP;
									}
								}
							}
						}
					}
				}
			}
			Constant.PAN = 0;
			return 0;
		} catch (Exception e) {
			Constant.PAN = 0;
			return 0;
		}
	}

	@Override
	public void destroy() {
		//if (Constant.SV != null) {
		//	Constant.SV.StopServer();
		//}
		super.destroy();
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		SqlConnect.getSqlMapInstance();
		Constant.init();
		Constant.FILES = config.getServletContext().getRealPath("files");
		Constant.SEE = config.getServletContext().getRealPath("see");
		FileHandle.fileExists_create(Constant.SEE);
		Constant.SCREEN = config.getServletContext().getRealPath("screen");
		FileHandle.fileExists_create(Constant.SCREEN);
		Constant.EXE = config.getServletContext().getRealPath("exe");
		
		Constant.CAMERA = config.getInitParameter("camera");
		FileHandle.fileExists_create(Constant.CAMERA);
		Constant.PHOTOS = config.getInitParameter("photos");
		FileHandle.fileExists_create(Constant.PHOTOS);
		
		Constant.LOG = config.getServletContext().getRealPath("log");
		FileHandle.fileExists_create(Constant.LOG);
		
		Constant.PLAYLOG = config.getServletContext().getRealPath("playlog");
		FileHandle.fileExists_create(Constant.PLAYLOG);
		
		
		Constant.VSCONFIG = config.getServletContext().getRealPath("vsconfig");
		FileHandle.fileExists_create(Constant.VSCONFIG);
		
		//String vsini=Constant.VSCONFIG+File.separator+"vs.ini";
		String vsini="D://vs//server//webapps//vs//vsconfig//vs.ini";
		
	    Constant.readVsIni(vsini);	
	    
	    Map<String,String> map=new HashMap<String, String>();
		
	    try {
			
			SetParameterPrint.getReflect(new VVersion(),map);
			
			SetParameterPrint.getReflect(new Constant(),map);
			
			SetParameterPrint.getReflect(new SystemInfo(),map);
			
			Constant.writeIni(Constant.VSCONFIG+File.separator+"print.ini", map);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
		
	    
	    
        //String printini=Constant.VSCONFIG+File.separator+"print.ini";
		
	    //Constant.readVsIni(vsini);	
	    
	    
	    
		//Constant.LOCALDIE = config.getInitParameter("localdie").trim();
		//Constant.INDEXLANG = config.getInitParameter("indexlang").trim();

		//Constant.WEATHERKEY = config.getInitParameter("weatherKey").trim();
		
		//Constant.DOWNSIZE=Integer.parseInt(config.getInitParameter("downsize").trim());
		
		GetLocal gl = new GetLocal();
		Local local = gl.getLocal(Constant.LOCALDIE);

		Constant.LOCAL = local;
		//Constant.TIMEJK = Integer.parseInt(config.getInitParameter("timejk")
		//		.trim());
		int ou = 0;
		try {
			ou = Integer.parseInt(config.getInitParameter("outtime").trim());
		} catch (Exception e) {

		}
		if (ou == 0) {
			ou = 11;
		}

		String srvmark = "";
		try {
			srvmark = config.getInitParameter("srvmark").trim();
		} catch (Exception e) {

		}
		Constant.tky = srvmark;
		if (Constant.tky.length() == 17) {
			int xiansu = 0;
			try {
				xiansu = Integer.parseInt(config.getInitParameter("xiansu")
						.trim());
			} catch (Exception e) {

			}
			Constant.xiansu = xiansu;
			//Constant.sc = new SocketClient();
			//Constant.hd = new HttpDown();
			Constant.svip = config.getInitParameter("srvip").trim();
			int lian = 10;
			try {
				lian = Integer.parseInt(config.getInitParameter("lian").trim());
			} catch (Exception e) {

			}
			Constant.lian = lian;
			if (Constant.lian < 3) {
				Constant.lian = 3;
			}
		}
		Constant.OUT = ou * 1000;
		MainDo ct = new MainDo();
		int ds = gett();
		
		
		//网络版本开关
		//String vshow=config.getInitParameter("vshow").trim();
		
		
		
	
		try {
			SqlConnect.getSqlMapInstance().update("update_client_all_netstate0");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		if(Constant.vsLicenses==1){
			
			Constant.lType="2";
			
		}
		
	
		if(Constant.lType.equals("1")){
			if(Constant.lCheck.equals("1")){
				//Constant.PAN = 2;
				ct.init(0);
			}else{
				
				System.out.println(Constant.LOCAL.getA00504() +"["+Constant.LOCAL.getA00507()+"]");
			}
			
			if(!Constant.CHECKNETJMSTATE){
				
				Timer timer=new Timer();
				timer.schedule(new CheckNetJm(timer), 60*1000, 60*1000);
				
			}
			
			
			/*int dogcount=GetJmDog.getDog();
			
			if(dogcount==0){
				System.out.println("初始化失败");
			}else{
				Constant.G4=dogcount;
				Constant.PAN = 2;
				ct.init(93);
				
			}*/
			
		}else if(Constant.lType.equals("2")){
			
			//验证读取授权文件
		
			String vsLicensesTxt=FileHandle.readTxtFile(Constant.vsLicensesPath);
			
			if(vsLicensesTxt.equals("")){
				
				System.out.println("授权文件失败");
			
			}else{
				
				//解析文件
				try {
					
					Constant.resolveVsLicenses();
					
					System.out.println("授权文件读取成功");
					
					Constant.vsLicensesFlag=1;
					
					ct.init(93);
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			
			
			
		}else{
				//判断文件大小
				File nt141jni = new File(Constant.EXE+File.separator +"NT141JNI.dll");
				if(nt141jni.exists()){
					
					if(nt141jni.length()==86016){
						
					}else{
						Constant.PAN=0;
					}
					
				}else{
					Constant.PAN = 0;
				}
				
				//PAN 0初始化失败 1限时狗初始化  2无限时初始化
				
				//***调试*****
				//ds=93;
				//Constant.PAN=2;
				//Constant.G4=9;
				//***调试*****
				
				//PAN=1 临时狗  PAN2加密狗
				if (Constant.PAN == 0) {
					System.out.println(Constant.LOCAL.getA00504() +"["+Constant.LOCAL.getA00505()+"]");
				} else if (Constant.PAN == 1) {
					Constant.T2 = new Timer();
					Constant.T2.schedule(new Mt(), 3600 * 1000 * 24, 3600 * 1000 * 24);
				} else if (Constant.PAN == 2) {
					Constant.T3 = new Timer();
					Constant.T3.schedule(new Mts(), 3600 * 1000 * 24, 3600 * 1000 * 24);
				}
				ct.init(ds);
		}
	}
}
