package com.vshow.control.tool;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.PooledByteBufAllocator;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;

import com.vshow.control.data.Client;

public class MainSendMsgHandle extends Thread {

	private static Log logger = LogFactory.getLog(MainSendMsgHandle.class);

	@Override
	public void run() {
		while (true) {
			try {
				// 遍历消息队列
				Client cli;
				for (Iterator itr = Constant.messageMap.keySet().iterator(); itr
						.hasNext();) {

					String key = (String) itr.next();
					Mlt msgList = Constant.messageMap.get(key);
					if (msgList != null) {

						ChannelHandlerContext ctx = VSNettyChannelMap.get(key);
						// System.out.println("ctx:"+ctx);
						if (ctx != null) {
							if (msgList.allmsg.size() > 0) {
								String cmd = "";
								MyMsg mmTemp = msgList.allmsg.get(0);
								cli = new Client();
								if (mmTemp.fbType == 1 || mmTemp.fbType == 7
										|| mmTemp.fbType == 23
										|| mmTemp.fbType == 17
										|| mmTemp.fbType == 16
										|| mmTemp.fbType == 18) {
									if (Constant.downloadQueue.size() < Constant.downloadQueueSize) {

										MyMsg mm = msgList.allmsg.remove(0);
										cmd = mm.msg;
										cli.setName(mm.sendkey);
										cli.setMark(key);
										cli.setState(1);
										try {
											if (cmd.isEmpty()) {
												cmd = "z";
											}

											logger.info("发送:[" + key + "]"
													+ cmd);
											// send
											sendmsg(ctx, cmd);

											// 存入消息缓存集合
											// Constant.messageMapCache.put(key+"@"+mm.sendkey,mm);

											try {

												if (mm.sendkey.equals("")) {

												} else {

													// 更新结果result
													SqlConnect
															.getSqlMapInstance()
															.update("up_on_result_suc",
																	cli);

													// 更新最后一次播放状态
													SqlConnect
															.getSqlMapInstance()
															.update("up_cp_state",
																	cli);

												}

											} catch (Exception e) {
												logger.error(e);
											}
										} catch (Exception e) {
											// VSNettyChannelMap.remove((SocketChannel)ctx.channel());
											logger.error(e);
											msgList.allmsg.add(mm);
											return;
										}

										// Constant.downloadQueue.put(key+"@"+mm.sendkey,
										// mm);
										Constant.downloadQueue.put(key, mm);
									}

								} else {

									MyMsg mm = msgList.allmsg.remove(0);
									cmd = mm.msg;
									cli.setName(mm.sendkey);
									cli.setMark(key);
									cli.setState(1);
									try {
										if (cmd.isEmpty()) {
											cmd = "z";
										}
										logger.info("发送:[" + key + "]" + cmd);
										// send
										sendmsg(ctx, cmd);

										try {
											if (mm.sendkey.equals("")) {

											} else {

												// 更新结果result
												SqlConnect
														.getSqlMapInstance()
														.update("up_on_result_suc",
																cli);

												// 更新最后一次播放状态
												SqlConnect.getSqlMapInstance()
														.update("up_cp_state",
																cli);

											}

										} catch (Exception e) {
											logger.error(e);
										}
									} catch (Exception e) {
										// VSNettyChannelMap.remove((SocketChannel)ctx.channel());
										logger.error(e);
										msgList.allmsg.add(mm);
										return;
									}
								}

								if (cli.getState() == 22
										&& Constant.isFIleZY == true) {
									String dir1;
									String dir;
									MyMsg mm = msgList.allmsg.remove(0);
									cmd = mm.msg;
									cli.setName(mm.sendkey);
									cli.setMark(key);
									cli.setState(1);
									try {

										System.out.println("解决协议文件无法下载开始");
										// 拿到当前协议文件
										String bak = cmd.split("%")[1];
										String md = cmd.split("%")[0];
										String index = bak.split(".txt")[0];
										index += "bak.txt";
										String cmdbak = md + "%" + index;
										 dir1 = Constant.FILES
												+ File.separator + index;
										 dir = Constant.FILES
												+ File.separator + bak;
										// 获取文件目录并复制文件
										FileInputStream in = new FileInputStream(
												new File(dir));
										FileOutputStream out = new FileOutputStream(
												new File(dir1));
										byte[] buff = new byte[10240]; // 限制大小
										int n = 0;
										while ((n = in.read(buff)) != -1) {
											out.write(buff, 0, n);
										}
										out.flush();
										in.close();
										out.close();
										// 重新发送
										sendmsg(ctx, cmdbak);
										// 存入消息缓存集合
										// Constant.messageMapCache.put(key+"@"+mm.sendkey,mm);

										try {

											if (mm.sendkey.equals("")) {

											} else {

												// 更新结果result
												SqlConnect
														.getSqlMapInstance()
														.update("up_on_result_suc",
																cli);

												// 更新最后一次播放状态
												SqlConnect.getSqlMapInstance()
														.update("up_cp_state",
																cli);

											}

										} catch (Exception e) {
											logger.error(e);
										}
									} catch (Exception e) {
										// VSNettyChannelMap.remove((SocketChannel)ctx.channel());
										logger.error(e);
										msgList.allmsg.add(mm);
										return;
									}

									// Constant.downloadQueue.put(key+"@"+mm.sendkey,
									// mm);
									Constant.downloadQueue.put(key, mm);
									System.out.println("执行结果" + cli.getState());
									// 下载成功后删除此协议文件
									if (cli.getState() == 1) {
										File file = new File(dir1);
										if (file.exists() && file.isFile()) {
											if (file.delete()) {
												System.out.println("删除成功执行完毕");
											}
										}
									}
								}

							}
							if (msgList.allmsgBuss.size() > 0) {

								MyMsg mm = msgList.allmsgBuss.remove(0);
								String cmd = mm.msg;
								sendmsg(ctx, cmd);

							}

						}

					}
				}

				sleep(100);
			} catch (Exception e) {
				logger.error(e);
			}

		}
	}

	// 发送消息
	public synchronized void sendmsg(ChannelHandlerContext ctx, String msg) {

		try {

			if (new VVersion().pwdPloy.equals("1")) {

				msg = DesUtil.encrypt(msg, DesUtil.keyStatic);

			}
			System.out.println("发送:" + msg);
			NettyChannel nettyChannel = NettyChannelUtil
					.getChannelHandlerContextNettyChannel(ctx);

			byte[] req;

			if (nettyChannel.isCheckMsgFlag()) {

				req = VSEchoServerHandler.getSendMsgNew(msg,
						nettyChannel.getCode());

			} else {

				req = msg.getBytes("UTF-8");

			}
			// logger.info("发送终端协议[开始]:"+new String(req));

			logger.info("发送终端协议[开始]:" + msg);
			System.out.println("发送终端协议[开始]:" + msg);

			ByteBuf pingMessage = Unpooled.buffer();
			// ByteBuf
			// pingMessage=PooledByteBufAllocator.DEFAULT.directBuffer(1024);
			pingMessage.writeBytes(req);

			ctx.writeAndFlush(pingMessage);

			// pingMessage.release();
			System.out.println("发送终端协议[结束]:");
			logger.info("发送终端协议[结束]");

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
}
