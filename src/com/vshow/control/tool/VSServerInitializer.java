package com.vshow.control.tool;

 
import java.util.concurrent.TimeUnit;

import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.DelimiterBasedFrameDecoder;
import io.netty.handler.codec.LineBasedFrameDecoder;
import io.netty.handler.codec.http.HttpRequestDecoder;
import io.netty.handler.codec.http.HttpResponseEncoder;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;
import io.netty.handler.timeout.IdleStateHandler;

 

 

public class VSServerInitializer extends ChannelInitializer<SocketChannel> { 

    @Override
    protected void initChannel(SocketChannel channel) throws Exception {
        ChannelPipeline pipeline = channel.pipeline();
 
        System.out.println("initChannel:"); 
       
        //channel.pipeline().addLast(new LineBasedFrameDecoder(1024));
		//半包处理, ‘;’ 作为分包符
        //channel.pipeline().addLast(new DelimiterBasedFrameDecoder(1024,Unpooled.copiedBuffer("\n".getBytes())));
        // 字符串编码
        // channel.pipeline().addLast(new StringDecoder());
		// 字符串解码
        // channel.pipeline().addLast(new StringEncoder());
        
        // 字符串解码 和 编码
        // pipeline.addLast("decoder", new StringDecoder());
        // pipeline.addLast("encoder", new StringEncoder());
        
        pipeline.addLast("idleStateHandler", new IdleStateHandler(Constant.OUTTIME, Constant.OUTTIME, Constant.OUTTIME, TimeUnit.SECONDS));
        pipeline.addLast("handler", new VSEchoServerHandler());

        
    }
    

 
}
