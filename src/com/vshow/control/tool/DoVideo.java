package com.vshow.control.tool;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.oro.text.regex.MalformedPatternException;
import org.apache.oro.text.regex.PatternCompiler;
import org.apache.oro.text.regex.PatternMatcher;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;



public class DoVideo {
	Logger logger  =  Logger.getLogger(DoVideo.class);
	public static int Do(String str, String flvfile,int end) {
		Process process;
		String cmdd;
		try {
			cmdd = "cmd /c start "
					+ Constant.EXE
					+ File.separator
					+ "ffmpeg.exe"
					+ " -i "
					+ str
					+ " -y -ar 22050 -f flv -qscale 10 -s 640*480 -r 15 -ss 0 -t  "+ end +" "
					+ flvfile;
			Runtime.getRuntime().exec(cmdd);
			Thread.sleep(3000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (new File(flvfile).length() == 0) {
			try {
				cmdd = "cmd /c start "
						+ Constant.EXE
						+ File.separator
						+ "mencoder.exe"
						+ " -ffourcc FLV1 -lavfopts i_certify_that_my_video_stream_does_not_use_b_frames -of lavf -oac mp3lame -ovc lavc -lavcopts vcodec=flv:vbitrate=200:acodec=mp3:abitrate=56 -vf scale=640:480 -ofps 15 -srate 22050 -ss 0 -endpos 15 "
						+" "+ str + " -o " + flvfile;
				Runtime.getRuntime().exec(cmdd);
				Thread.sleep(3000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		long flvlen = 0;
		long tem;
		int tot = 0;
		while (true) {
			tem = new File(flvfile).length();
			if (flvlen != tem) {
				flvlen = tem;
				try {
					Thread.sleep(1000);
					tot++;
					if (tot > 30) {
						break;
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			} else {
				break;
			}
		}
		int i = 0;
		try {
			cmdd = "cmd /c " + Constant.EXE + File.separator + "getvideo.exe "
					+ str;
			process = Runtime.getRuntime().exec(cmdd);
			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(process.getInputStream()));
			String restr = null;
			while ((restr = (bufferedReader.readLine())) == null) {
				Thread.sleep(100);
				i++;
				if (i > 60) {
					bufferedReader.close();
					return 0;
				}
			}
			bufferedReader.close();
			return Integer.parseInt(restr.trim());
		} catch (Exception e) {
		}

		return 0;
	}

	public static void Do2(String str, String flvfile, int ss) {
		int end = 2;
		String cmdd;
		try {
			
			cmdd = "cmd /c start "
					+ Constant.EXE
					+ File.separator
					+ "ffmpeg.exe"
					+ " -i "
					+ str
					+ " -y -ar 22050 -f flv -qscale 10 -s 640*480 -r 15 -ss 0 -t  "+ end +" "
					+ flvfile;
			
			Runtime.getRuntime().exec(cmdd);
			
			Thread.sleep(3000);
			
		} catch (Exception e) {
			
			new DoVideo().logger.error(e);
		
		}
		
		if (new File(flvfile).length() == 0) {
			try {
				cmdd = "cmd /c start "
						+ Constant.EXE
						+ File.separator
						+ "mencoder.exe"
						+ " -ffourcc FLV1 -lavfopts i_certify_that_my_video_stream_does_not_use_b_frames -of lavf -oac mp3lame -ovc lavc -lavcopts vcodec=flv:vbitrate=200:acodec=mp3:abitrate=56 -vf scale=640:480 -ofps 15 -srate 22050 -ss 0 -endpos 15 "
						+" "+ str + " -o " + flvfile;
				Runtime.getRuntime().exec(cmdd);
				Thread.sleep(3000);
			} catch (Exception e) {
				new DoVideo().logger.error(e);
			}
		}
		long flvlen = 0;
		long tem;
		int tot = 0;
		while (true) {
			tem = new File(flvfile).length();
			if (flvlen != tem) {
				flvlen = tem;
				try {
					Thread.sleep(1000);
					tot++;
					if (tot > 30) {
						break;
					}
				} catch (Exception e) {
					// TODO: handle exception
					new DoVideo().logger.error(e);
				}
			} else {
				break;
			}
		}
	}
	
	
	/**
	 * 截取视频图片
	 * 假设命令为 
	 * ffmpeg -i e:/13.flv -y -f image2 -ss 08.010 -t 0.001 -s 352x240 b.jpg  
	 * 输入：视频地址，图片生成地址 
	 * @param videoLocation 视频文件地址
	 * @param imageLocation 截取后图片地址
	 * 
	 * */
	
	public static boolean InterceptVideoImg(String videoLocation, String imageLocation)  
	 {  
	         List<String> commend = new java.util.ArrayList<String>();  
	         //低精度  
	         String fp= Constant.EXE+ File.separator+"ffmpeg.exe";
	         commend.add(fp);  
	         commend.add("-i");  
	         commend.add(videoLocation);  
	         commend.add("-y");  
	         commend.add("-f");
	         commend.add("image2");  
	         commend.add("-ss");   // 添加参数＂-ss＂，该参数指定截取的起始时间 
	         commend.add("08.01");  
	         commend.add("-t");  // 添加参数＂-t＂，该参数指定持续时间
	         commend.add("0.001");  // 添加持续时间为1毫秒 
	         commend.add("-s");  // 添加参数＂-s＂，该参数指定截取的图片大小 
	         commend.add("352x240");// 添加截取的图片大小为352*240 
	         commend.add(imageLocation);  
	         

	        try {  
	             ProcessBuilder builder = new ProcessBuilder();  
	             builder.command(commend);
	             builder.start();
	             return true;  
	         } catch (Exception e) {  
	             e.printStackTrace();  
	             return false;  
	         }  
	 }
	
	/**
	 * 截取缩略图并返回时长
	 * @param videoLocation 源视频路径
	 * @param imageLocation 缩略图文件名
	 * @param resolution  缩略图分辨率如320x240
	 * @return
	 */
	public static int SnapVideoImage_Duration(String videoLocation,String imageLocation) {
		List<String> commend = new java.util.ArrayList<String>();
		//低精度  
        String fp= Constant.EXE+ File.separator+"ffmpeg.exe";
		commend.add(fp);
		commend.add("-i");
		commend.add(videoLocation);
		commend.add("-y");
		commend.add("-f");
		commend.add("image2");
		commend.add("-ss"); // 添加参数＂-ss＂，该参数指定截取的起始时间
		commend.add("04.01");
		commend.add("-t"); // 添加参数＂-t＂，该参数指定持续时间
		commend.add("0.001"); // 添加持续时间为1毫秒
		commend.add("-s"); // 添加参数＂-s＂，该参数指定截取的图片大小
		//commend.add("352x240");// 添加截取的图片大小为350*240
		commend.add("352x240");// 添加截取的图片大小为350*240
		commend.add(imageLocation);

		try {
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commend);
			builder.redirectErrorStream(true);
			Process p = builder.start();

			// 1. start
			BufferedReader buf = null; // 保存ffmpeg的输出结果流
			String line = null;
			// read the standard output

			buf = new BufferedReader(new InputStreamReader(p.getInputStream()));

			StringBuffer sb = new StringBuffer();
			while ((line = buf.readLine()) != null) {
				System.out.println(line);
				sb.append(line);
				continue;
			}
			p.waitFor();// 这里线程阻塞，将等待外部转换进程运行成功运行结束后，才往下执行
			// 1. end
			String execResult = sb.toString();
			
			PatternCompiler compiler = new Perl5Compiler();
			try {
				String regexDuration = "Duration: (.*?), start: (.*?), bitrate: (\\d*) kb\\/s";
				// String regexVideo = "Video: (.*?), (.*?), (.*?)[,\\s]";
				// String regexAudio = "Audio: (\\w*), (\\d*) Hz";

				org.apache.oro.text.regex.Pattern patternDuration = compiler
						.compile(regexDuration, Perl5Compiler.CASE_INSENSITIVE_MASK);
				PatternMatcher matcherDuration = new Perl5Matcher();
				if (matcherDuration.contains(execResult, patternDuration)) {
					org.apache.oro.text.regex.MatchResult re = matcherDuration
							.getMatch();

					System.out.println("提取出播放时间  ===" + re.group(1));
					System.out.println("开始时间        =====" + re.group(2));
					System.out.println("bitrate 码率 单位 kb==" + re.group(3));
					return ffmpegduration2ms(re.group(1));
				}
			
			} catch (MalformedPatternException e) {
				e.printStackTrace();
			}
			
		} catch (Exception e) {
			// System.out.println(e);
			e.printStackTrace();
			return 0;
		}
		return 0;
	}
	
	
	/**
	 * ffmpeg的duration转为秒，考虑实际应用场景，毫秒略去取整
	 * @param duration
	 * @return
	 */
	public static int ffmpegduration2ms(String duration){
		try{
			int hour=0,min=0,sec=0,ms=0;
			String[] timelist = duration.split("\\.");
			if ((timelist != null) && (timelist.length >0)){
				
				String[] hms = timelist[0].split("\\:");
				if ((hms != null) && (hms.length == 3)){
					hour = Integer.parseInt(hms[0]);
					min  = Integer.parseInt(hms[1]);
					sec  = Integer.parseInt(hms[2]);
					return hour*3600+min*60+sec;
				}
			}
		}catch(Exception e){
			
		} 
		return 0;
	}
	
	
	
	public static int DoMP4(String str, String flvfile,int end) {
		Process process;
		String cmdd;
		try {
			cmdd = "cmd /c start "
					+ Constant.EXE
					+ File.separator
					+ "ffmpeg.exe"
					+ " -i "
					+ str
					+ " -y -ar 22050 -f mp4 -qscale 10 -s 640*480 -r 15 -ss 0 "
					+ flvfile;
			Runtime.getRuntime().exec(cmdd);
			Thread.sleep(3000);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (new File(flvfile).length() == 0) {
			try {
				cmdd = "cmd /c start "
						+ Constant.EXE
						+ File.separator
						+ "mencoder.exe"
						+ " -ffourcc FLV1 -lavfopts i_certify_that_my_video_stream_does_not_use_b_frames -of lavf -oac mp3lame -ovc lavc -lavcopts vcodec=flv:vbitrate=200:acodec=mp3:abitrate=56 -vf scale=640:480 -ofps 15 -srate 22050 -ss 0 -endpos 15 "
						+" "+ str + " -o " + flvfile;
				Runtime.getRuntime().exec(cmdd);
				Thread.sleep(3000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		long flvlen = 0;
		long tem;
		int tot = 0;
		while (true) {
			tem = new File(flvfile).length();
			if (flvlen != tem) {
				flvlen = tem;
				try {
					Thread.sleep(1000);
					tot++;
					if (tot > 30) {
						break;
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			} else {
				break;
			}
		}
		int i = 0;
		try {
			cmdd = "cmd /c " + Constant.EXE + File.separator + "getvideo.exe "
					+ str;
			process = Runtime.getRuntime().exec(cmdd);
			BufferedReader bufferedReader = new BufferedReader(
					new InputStreamReader(process.getInputStream()));
			String restr = null;
			while ((restr = (bufferedReader.readLine())) == null) {
				Thread.sleep(100);
				i++;
				if (i > 60) {
					bufferedReader.close();
					return 0;
				}
			}
			bufferedReader.close();
			return Integer.parseInt(restr.trim());
		} catch (Exception e) {
		}

		return 0;
	}
}
