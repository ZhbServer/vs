package com.vshow.control.tool;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.socket.SocketChannel;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class VSNettyChannelMap {
	private static Map<String, ChannelHandlerContext> map = new ConcurrentHashMap<String, ChannelHandlerContext>();
	

	public static void add(String clientId, ChannelHandlerContext ctx) {
		map.put(clientId, ctx);
	}

	public static int size(){
		return map.size();
	}
	public static ChannelHandlerContext get(String clientMark) {
		return map.get(clientMark);
	}
    public static void remove(String key) {
		map.remove(key);
	}
}
